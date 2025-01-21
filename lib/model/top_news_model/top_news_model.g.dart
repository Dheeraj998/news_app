// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopNewsListModelImpl _$$TopNewsListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TopNewsListModelImpl(
      status: json['status'] as String?,
      totalResults: (json['totalResults'] as num?)?.toInt(),
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => ArticlesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TopNewsListModelImplToJson(
        _$TopNewsListModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

_$ArticlesModelImpl _$$ArticlesModelImplFromJson(Map<String, dynamic> json) =>
    _$ArticlesModelImpl(
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
    );

Map<String, dynamic> _$$ArticlesModelImplToJson(_$ArticlesModelImpl instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt?.toIso8601String(),
    };
