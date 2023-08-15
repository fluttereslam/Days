import 'package:collection/collection.dart';

import 'result.dart';

class AllNewsModel {
  String? status;
  int? totalResults;
  List<Result>? results;
  String? nextPage;

  AllNewsModel({
    this.status,
    this.totalResults,
    this.results,
    this.nextPage,
  });

  factory AllNewsModel.fromJson(Map<String, dynamic> json) => AllNewsModel(
        status: json['status'] as String?,
        totalResults: json['totalResults'] as int?,
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
            .toList(),
        nextPage: json['nextPage'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalResults': totalResults,
        'results': results?.map((e) => e.toJson()).toList(),
        'nextPage': nextPage,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AllNewsModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      status.hashCode ^
      totalResults.hashCode ^
      results.hashCode ^
      nextPage.hashCode;
}
