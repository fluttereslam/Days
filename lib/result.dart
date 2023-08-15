import 'package:collection/collection.dart';

class Result {
  String? title;
  String? link;
  dynamic keywords;
  dynamic creator;
  dynamic videoUrl;
  String? description;
  String? content;
  String? pubDate;
  String? imageUrl;
  String? sourceId;
  List<String>? category;
  List<String>? country;
  String? language;

  Result({
    this.title,
    this.link,
    this.keywords,
    this.creator,
    this.videoUrl,
    this.description,
    this.content,
    this.pubDate,
    this.imageUrl,
    this.sourceId,
    this.category,
    this.country,
    this.language,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json['title'] as String?,
        link: json['link'] as String?,
        keywords: json['keywords'] as dynamic,
        creator: json['creator'] as dynamic,
        videoUrl: json['video_url'] as dynamic,
        description: json['description'] as String?,
        content: json['content'] as String?,
        pubDate: json['pubDate'] as String?,
        imageUrl: json['image_url'] as String?,
        sourceId: json['source_id'] as String?,
        category: json['category'] as List<String>?,
        country: json['country'] as List<String>?,
        language: json['language'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'link': link,
        'keywords': keywords,
        'creator': creator,
        'video_url': videoUrl,
        'description': description,
        'content': content,
        'pubDate': pubDate,
        'image_url': imageUrl,
        'source_id': sourceId,
        'category': category,
        'country': country,
        'language': language,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      title.hashCode ^
      link.hashCode ^
      keywords.hashCode ^
      creator.hashCode ^
      videoUrl.hashCode ^
      description.hashCode ^
      content.hashCode ^
      pubDate.hashCode ^
      imageUrl.hashCode ^
      sourceId.hashCode ^
      category.hashCode ^
      country.hashCode ^
      language.hashCode;
}
