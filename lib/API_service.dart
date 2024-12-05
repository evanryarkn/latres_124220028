import 'dart:convert';
import 'package:http/http.dart' as http;

// Model Data
class NewsItem {
  final String title;
  final String summary;
  final String imageUrl;
  final String publishedAt;

  NewsItem({
    required this.title,
    required this.summary,
    required this.imageUrl,
    required this.publishedAt,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      title: json['title'] ?? 'No Title',
      summary: json['summary'] ?? 'No Summary',
      imageUrl: json['imageUrl'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
    );
  }
}

// Service Class
class ApiService {
  // Base URLs
  static const String _baseUrlBlogs = 'https://api.spaceflightnewsapi.net/v4/blogs/';
  static const String _baseUrlArticles = 'https://api.spaceflightnewsapi.net/v4/articles/';
  static const String _baseUrlReports = 'https://api.spaceflightnewsapi.net/v4/reports/';

  // Fetch Blogs
  static Future<List<NewsItem>> fetchBlogs() async {
    final response = await http.get(Uri.parse(_baseUrlBlogs));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['results'] as List;
      return data.map((json) => NewsItem.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load blogs');
    }
  }

  // Fetch Articles
  static Future<List<NewsItem>> fetchArticles() async {
    final response = await http.get(Uri.parse(_baseUrlArticles));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['results'] as List;
      return data.map((json) => NewsItem.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }

  // Fetch Reports
  static Future<List<NewsItem>> fetchReports() async {
    final response = await http.get(Uri.parse(_baseUrlReports));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['results'] as List;
      return data.map((json) => NewsItem.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load reports');
    }
  }
}
