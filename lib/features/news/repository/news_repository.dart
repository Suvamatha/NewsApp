import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/article.dart';

class NewsRepository {
  static final String _apiKey = dotenv.env['NEWS_API_KEY'] ?? '';
  static const String _baseUrl = 'https://newsapi.org/v2';


  Future<List<Article>> getTopHeadlines({String category = 'general'}) async {
    try {
      final url = Uri.parse(
        '$_baseUrl/top-headlines?country=us&category=$category&apiKey=$_apiKey',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final List articles = json['articles'];
        print('Articles count: ${articles.length}'); // debug log
        print('Status: ${json['status']}'); // debug log

        return articles
            .map((article) => Article.fromJson(article))
            .toList();
      } else {
        print('Error: ${response.statusCode}');
        print('Body: ${response.body}');
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Something went wrong: $e');
    }
  }
}