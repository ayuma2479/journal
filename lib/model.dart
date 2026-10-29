import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> loadPosts() async {
  final url = Uri.parse(
    'https://ayuma2479.github.io/journal/assets/assets/posts.json',
  );
  final res = await http.get(url);
  if (res.statusCode != 200) {
    throw Exception('読み込み失敗');
  }

  final List posts = jsonDecode(utf8.decode(res.bodyBytes));
  return posts;
}
