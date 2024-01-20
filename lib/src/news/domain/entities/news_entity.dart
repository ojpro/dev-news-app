import 'package:intl/intl.dart';

class NewsEntity {
  final String url;
  final String title;
  final String? author;
  final String? description;
  final String? coverImage;
  final String publishedAt;

  NewsEntity({
    this.author,
    this.description,
    this.coverImage,
    required this.url,
    required this.title,
    required this.publishedAt,
  });

  factory NewsEntity.fromMap(Map<String, dynamic> map) {
    return NewsEntity(
      url: map['url'] ?? '',
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      description: map['description'] ?? '',
      coverImage: map['cover_image'] ?? '',
      publishedAt: DateFormat.yMMMMEEEEd().format(DateTime.parse(map['published_at'])),
    );
  }
}
