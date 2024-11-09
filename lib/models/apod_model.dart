class ApodModel {
  final String title;
  final String url;
  final String explanation;
  final String mediaType;
  final String date;

  ApodModel({
    required this.title,
    required this.url,
    required this.explanation,
    required this.mediaType,
    required this.date,
  });

  // Factory constructor to create an ApodModel from JSON data
  factory ApodModel.fromJson(Map<String, dynamic> json) {
    return ApodModel(
      title: json['title'] ?? 'No Title',
      url: json['url'] ?? '',
      explanation: json['explanation'] ?? 'No explanation provided',
      mediaType: json['media_type'] ?? 'image',
      date: json['date'] ?? '',
    );
  }

  // Optional: Convert ApodModel back to JSON if needed
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'url': url,
      'explanation': explanation,
      'media_type': mediaType,
      'date': date,
    };
  }
}
