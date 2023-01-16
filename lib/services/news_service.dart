import 'dart:convert';

import 'package:newsapp/models/articles.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/news.dart';

class NewService {
  Future<List<Articles>> fetchNews(String category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?apiKey=aa04eab51a0a42ca93918c48185f5998&country=tr&category=$category';
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      News news = News.fromJson(result);
      return news.articles ?? [];
    }
    throw Exception("Bad Request");
  }
}
