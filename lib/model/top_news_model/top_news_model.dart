import 'package:freezed_annotation/freezed_annotation.dart';
part 'top_news_model.freezed.dart';
part 'top_news_model.g.dart';

@freezed
class TopNewsListModel with _$TopNewsListModel {
  const factory TopNewsListModel({
    String? status,
    int? totalResults,
    List<ArticlesModel>? articles,
  }) = _TopNewsListModel;

  factory TopNewsListModel.fromJson(Map<String, dynamic> json) =>
      _$TopNewsListModelFromJson(json);
}

@freezed
class ArticlesModel with _$ArticlesModel {
  const factory ArticlesModel({
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
  }) = _ArticlesModel;

  factory ArticlesModel.fromJson(Map<String, dynamic> json) =>
      _$ArticlesModelFromJson(json);
}
