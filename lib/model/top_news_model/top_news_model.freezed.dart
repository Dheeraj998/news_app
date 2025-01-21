// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_news_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TopNewsListModel _$TopNewsListModelFromJson(Map<String, dynamic> json) {
  return _TopNewsListModel.fromJson(json);
}

/// @nodoc
mixin _$TopNewsListModel {
  String? get status => throw _privateConstructorUsedError;
  int? get totalResults => throw _privateConstructorUsedError;
  List<ArticlesModel>? get articles => throw _privateConstructorUsedError;

  /// Serializes this TopNewsListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopNewsListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopNewsListModelCopyWith<TopNewsListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopNewsListModelCopyWith<$Res> {
  factory $TopNewsListModelCopyWith(
          TopNewsListModel value, $Res Function(TopNewsListModel) then) =
      _$TopNewsListModelCopyWithImpl<$Res, TopNewsListModel>;
  @useResult
  $Res call({String? status, int? totalResults, List<ArticlesModel>? articles});
}

/// @nodoc
class _$TopNewsListModelCopyWithImpl<$Res, $Val extends TopNewsListModel>
    implements $TopNewsListModelCopyWith<$Res> {
  _$TopNewsListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopNewsListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? totalResults = freezed,
    Object? articles = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      totalResults: freezed == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
      articles: freezed == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticlesModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopNewsListModelImplCopyWith<$Res>
    implements $TopNewsListModelCopyWith<$Res> {
  factory _$$TopNewsListModelImplCopyWith(_$TopNewsListModelImpl value,
          $Res Function(_$TopNewsListModelImpl) then) =
      __$$TopNewsListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, int? totalResults, List<ArticlesModel>? articles});
}

/// @nodoc
class __$$TopNewsListModelImplCopyWithImpl<$Res>
    extends _$TopNewsListModelCopyWithImpl<$Res, _$TopNewsListModelImpl>
    implements _$$TopNewsListModelImplCopyWith<$Res> {
  __$$TopNewsListModelImplCopyWithImpl(_$TopNewsListModelImpl _value,
      $Res Function(_$TopNewsListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TopNewsListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? totalResults = freezed,
    Object? articles = freezed,
  }) {
    return _then(_$TopNewsListModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      totalResults: freezed == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
      articles: freezed == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticlesModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopNewsListModelImpl implements _TopNewsListModel {
  const _$TopNewsListModelImpl(
      {this.status, this.totalResults, final List<ArticlesModel>? articles})
      : _articles = articles;

  factory _$TopNewsListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopNewsListModelImplFromJson(json);

  @override
  final String? status;
  @override
  final int? totalResults;
  final List<ArticlesModel>? _articles;
  @override
  List<ArticlesModel>? get articles {
    final value = _articles;
    if (value == null) return null;
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TopNewsListModel(status: $status, totalResults: $totalResults, articles: $articles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopNewsListModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, totalResults,
      const DeepCollectionEquality().hash(_articles));

  /// Create a copy of TopNewsListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopNewsListModelImplCopyWith<_$TopNewsListModelImpl> get copyWith =>
      __$$TopNewsListModelImplCopyWithImpl<_$TopNewsListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopNewsListModelImplToJson(
      this,
    );
  }
}

abstract class _TopNewsListModel implements TopNewsListModel {
  const factory _TopNewsListModel(
      {final String? status,
      final int? totalResults,
      final List<ArticlesModel>? articles}) = _$TopNewsListModelImpl;

  factory _TopNewsListModel.fromJson(Map<String, dynamic> json) =
      _$TopNewsListModelImpl.fromJson;

  @override
  String? get status;
  @override
  int? get totalResults;
  @override
  List<ArticlesModel>? get articles;

  /// Create a copy of TopNewsListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopNewsListModelImplCopyWith<_$TopNewsListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArticlesModel _$ArticlesModelFromJson(Map<String, dynamic> json) {
  return _ArticlesModel.fromJson(json);
}

/// @nodoc
mixin _$ArticlesModel {
  String? get author => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get urlToImage => throw _privateConstructorUsedError;
  DateTime? get publishedAt => throw _privateConstructorUsedError;

  /// Serializes this ArticlesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArticlesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArticlesModelCopyWith<ArticlesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticlesModelCopyWith<$Res> {
  factory $ArticlesModelCopyWith(
          ArticlesModel value, $Res Function(ArticlesModel) then) =
      _$ArticlesModelCopyWithImpl<$Res, ArticlesModel>;
  @useResult
  $Res call(
      {String? author,
      String? title,
      String? description,
      String? url,
      String? urlToImage,
      DateTime? publishedAt});
}

/// @nodoc
class _$ArticlesModelCopyWithImpl<$Res, $Val extends ArticlesModel>
    implements $ArticlesModelCopyWith<$Res> {
  _$ArticlesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArticlesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? urlToImage = freezed,
    Object? publishedAt = freezed,
  }) {
    return _then(_value.copyWith(
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      urlToImage: freezed == urlToImage
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticlesModelImplCopyWith<$Res>
    implements $ArticlesModelCopyWith<$Res> {
  factory _$$ArticlesModelImplCopyWith(
          _$ArticlesModelImpl value, $Res Function(_$ArticlesModelImpl) then) =
      __$$ArticlesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? author,
      String? title,
      String? description,
      String? url,
      String? urlToImage,
      DateTime? publishedAt});
}

/// @nodoc
class __$$ArticlesModelImplCopyWithImpl<$Res>
    extends _$ArticlesModelCopyWithImpl<$Res, _$ArticlesModelImpl>
    implements _$$ArticlesModelImplCopyWith<$Res> {
  __$$ArticlesModelImplCopyWithImpl(
      _$ArticlesModelImpl _value, $Res Function(_$ArticlesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArticlesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? urlToImage = freezed,
    Object? publishedAt = freezed,
  }) {
    return _then(_$ArticlesModelImpl(
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      urlToImage: freezed == urlToImage
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticlesModelImpl implements _ArticlesModel {
  const _$ArticlesModelImpl(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt});

  factory _$ArticlesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticlesModelImplFromJson(json);

  @override
  final String? author;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? url;
  @override
  final String? urlToImage;
  @override
  final DateTime? publishedAt;

  @override
  String toString() {
    return 'ArticlesModel(author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticlesModelImpl &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.urlToImage, urlToImage) ||
                other.urlToImage == urlToImage) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, author, title, description, url, urlToImage, publishedAt);

  /// Create a copy of ArticlesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticlesModelImplCopyWith<_$ArticlesModelImpl> get copyWith =>
      __$$ArticlesModelImplCopyWithImpl<_$ArticlesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticlesModelImplToJson(
      this,
    );
  }
}

abstract class _ArticlesModel implements ArticlesModel {
  const factory _ArticlesModel(
      {final String? author,
      final String? title,
      final String? description,
      final String? url,
      final String? urlToImage,
      final DateTime? publishedAt}) = _$ArticlesModelImpl;

  factory _ArticlesModel.fromJson(Map<String, dynamic> json) =
      _$ArticlesModelImpl.fromJson;

  @override
  String? get author;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get urlToImage;
  @override
  DateTime? get publishedAt;

  /// Create a copy of ArticlesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArticlesModelImplCopyWith<_$ArticlesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
