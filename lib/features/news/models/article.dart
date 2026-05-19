class Article {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String sourceName;

  const Article({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.sourceName,
  });

// Add this static method:
factory Article.fromJson(Map<String, dynamic> json) {
  return Article(
    title: json['title'] ?? 'No Title',
    description: json['description'] ?? 'No Description',
    url: json['url'] ?? '',
    urlToImage: json['urlToImage'] ?? '',
    publishedAt: json['publishedAt'] ?? '',
    sourceName: json['source']?['name'] ?? 'Unknown', 
  );
}
}