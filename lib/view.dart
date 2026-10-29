
import 'package:flutter/material.dart';
import 'controller.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  var controller = JournalController();
  String keyword = '';

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    await controller.load();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('つぶやき表示')),
    body: Column(
      children: [
        TextField(
          decoration: const InputDecoration(hintText: '検索'),
          onChanged: (s) => setState(() => keyword = s),
        ),
        Expanded(
          child: ListView(
            children: [
              for (var p in controller.search(keyword))
                ListTile(
                  leading: Text(p['emoji']),
                  title: Text(p['user']),
                  subtitle: Text(p['text']),
                ),
            ],
          ),
        ),
      ],
    ),
  );
}
