import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<List> loadPosts() async {
  final source = await rootBundle.loadString('assets/posts.json');
  final List posts = jsonDecode(source);
  return posts;
}
