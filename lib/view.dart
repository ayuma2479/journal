import 'package:flutter/material.dart';
import 'controller.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  final controller = JournalController();
  final Set<Object> coloredPosts = {};
  String keyword = '';

  static const characterColors = <String, Color>{
    '緑谷出久': Color(0xFFDCF2DF),
    '爆豪勝己': Color(0xFFFFE2C2),
    '轟焦凍': Color(0xFFDFEEFF),
    'オールマイト': Color(0xFFFFF0B8),
    '飯田天哉': Color(0xFFDDE5F6),
    '切島鋭児郎': Color(0xFFFFDAD8),
    '心操人使': Color(0xFFE9DFF5),
    'エンデヴァー': Color(0xFFFFD8CA),
    'トガヒミコ': Color(0xFFFFE0EA),
    '口田甲司': Color(0xFFE6EBCF),
    '発目明': Color(0xFFF7DFF2),
    '通形ミリオ': Color(0xFFFFF3CC),
    '相澤消太': Color(0xFFE0E5E9),
    '八百万百': Color(0xFFF0DCE3),
  };

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    await controller.load();
    if (mounted) setState(() {});
  }

  void toggleColor(Object post) {
    setState(() {
      if (!coloredPosts.add(post)) {
        coloredPosts.remove(post);
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFFF5F8F5),
    appBar: AppBar(
      title: const Text('ヒーローたちの言葉'),
      backgroundColor: const Color(0xFF235C40),
      foregroundColor: Colors.white,
    ),
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'キャラクター名・名言で検索',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onChanged: (s) => setState(() => keyword = s),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 4, 16, 12),
          child: Text('投稿をタップするとキャラクターの色に！もう一度で元に戻ります。'),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            children: [
              for (var p in controller.search(keyword))
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Material(
                    color: coloredPosts.contains(p)
                        ? characterColors[p['user']] ?? const Color(0xFFE8EFE8)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    clipBehavior: Clip.antiAlias,
                    child: ListTile(
                      onTap: () => toggleColor(p),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      leading: Text(
                        p['emoji'],
                        style: const TextStyle(fontSize: 30),
                      ),
                      title: Text(
                        p['user'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF203529),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          p['text'],
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: Color(0xFF29332D),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    ),
  );
}
