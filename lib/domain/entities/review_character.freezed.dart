// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_character.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewCharacter _$ReviewCharacterFromJson(Map<String, dynamic> json) {
  return _ReviewCharacter.fromJson(json);
}

/// @nodoc
mixin _$ReviewCharacter {
  String get character => throw _privateConstructorUsedError;
  DateTime get learnedAt => throw _privateConstructorUsedError;
  List<DateTime> get reviewDates => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  bool get needsReview => throw _privateConstructorUsedError;
  DateTime get nextReviewDate => throw _privateConstructorUsedError;

  /// Serializes this ReviewCharacter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewCharacter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewCharacterCopyWith<ReviewCharacter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCharacterCopyWith<$Res> {
  factory $ReviewCharacterCopyWith(
          ReviewCharacter value, $Res Function(ReviewCharacter) then) =
      _$ReviewCharacterCopyWithImpl<$Res, ReviewCharacter>;
  @useResult
  $Res call(
      {String character,
      DateTime learnedAt,
      List<DateTime> reviewDates,
      int reviewCount,
      bool needsReview,
      DateTime nextReviewDate});
}

/// @nodoc
class _$ReviewCharacterCopyWithImpl<$Res, $Val extends ReviewCharacter>
    implements $ReviewCharacterCopyWith<$Res> {
  _$ReviewCharacterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewCharacter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? character = null,
    Object? learnedAt = null,
    Object? reviewDates = null,
    Object? reviewCount = null,
    Object? needsReview = null,
    Object? nextReviewDate = null,
  }) {
    return _then(_value.copyWith(
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
      learnedAt: null == learnedAt
          ? _value.learnedAt
          : learnedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reviewDates: null == reviewDates
          ? _value.reviewDates
          : reviewDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      needsReview: null == needsReview
          ? _value.needsReview
          : needsReview // ignore: cast_nullable_to_non_nullable
              as bool,
      nextReviewDate: null == nextReviewDate
          ? _value.nextReviewDate
          : nextReviewDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewCharacterImplCopyWith<$Res>
    implements $ReviewCharacterCopyWith<$Res> {
  factory _$$ReviewCharacterImplCopyWith(_$ReviewCharacterImpl value,
          $Res Function(_$ReviewCharacterImpl) then) =
      __$$ReviewCharacterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String character,
      DateTime learnedAt,
      List<DateTime> reviewDates,
      int reviewCount,
      bool needsReview,
      DateTime nextReviewDate});
}

/// @nodoc
class __$$ReviewCharacterImplCopyWithImpl<$Res>
    extends _$ReviewCharacterCopyWithImpl<$Res, _$ReviewCharacterImpl>
    implements _$$ReviewCharacterImplCopyWith<$Res> {
  __$$ReviewCharacterImplCopyWithImpl(
      _$ReviewCharacterImpl _value, $Res Function(_$ReviewCharacterImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewCharacter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? character = null,
    Object? learnedAt = null,
    Object? reviewDates = null,
    Object? reviewCount = null,
    Object? needsReview = null,
    Object? nextReviewDate = null,
  }) {
    return _then(_$ReviewCharacterImpl(
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
      learnedAt: null == learnedAt
          ? _value.learnedAt
          : learnedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reviewDates: null == reviewDates
          ? _value._reviewDates
          : reviewDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      needsReview: null == needsReview
          ? _value.needsReview
          : needsReview // ignore: cast_nullable_to_non_nullable
              as bool,
      nextReviewDate: null == nextReviewDate
          ? _value.nextReviewDate
          : nextReviewDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewCharacterImpl implements _ReviewCharacter {
  const _$ReviewCharacterImpl(
      {required this.character,
      required this.learnedAt,
      required final List<DateTime> reviewDates,
      required this.reviewCount,
      required this.needsReview,
      required this.nextReviewDate})
      : _reviewDates = reviewDates;

  factory _$ReviewCharacterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewCharacterImplFromJson(json);

  @override
  final String character;
  @override
  final DateTime learnedAt;
  final List<DateTime> _reviewDates;
  @override
  List<DateTime> get reviewDates {
    if (_reviewDates is EqualUnmodifiableListView) return _reviewDates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviewDates);
  }

  @override
  final int reviewCount;
  @override
  final bool needsReview;
  @override
  final DateTime nextReviewDate;

  @override
  String toString() {
    return 'ReviewCharacter(character: $character, learnedAt: $learnedAt, reviewDates: $reviewDates, reviewCount: $reviewCount, needsReview: $needsReview, nextReviewDate: $nextReviewDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewCharacterImpl &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.learnedAt, learnedAt) ||
                other.learnedAt == learnedAt) &&
            const DeepCollectionEquality()
                .equals(other._reviewDates, _reviewDates) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.needsReview, needsReview) ||
                other.needsReview == needsReview) &&
            (identical(other.nextReviewDate, nextReviewDate) ||
                other.nextReviewDate == nextReviewDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      character,
      learnedAt,
      const DeepCollectionEquality().hash(_reviewDates),
      reviewCount,
      needsReview,
      nextReviewDate);

  /// Create a copy of ReviewCharacter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewCharacterImplCopyWith<_$ReviewCharacterImpl> get copyWith =>
      __$$ReviewCharacterImplCopyWithImpl<_$ReviewCharacterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewCharacterImplToJson(
      this,
    );
  }
}

abstract class _ReviewCharacter implements ReviewCharacter {
  const factory _ReviewCharacter(
      {required final String character,
      required final DateTime learnedAt,
      required final List<DateTime> reviewDates,
      required final int reviewCount,
      required final bool needsReview,
      required final DateTime nextReviewDate}) = _$ReviewCharacterImpl;

  factory _ReviewCharacter.fromJson(Map<String, dynamic> json) =
      _$ReviewCharacterImpl.fromJson;

  @override
  String get character;
  @override
  DateTime get learnedAt;
  @override
  List<DateTime> get reviewDates;
  @override
  int get reviewCount;
  @override
  bool get needsReview;
  @override
  DateTime get nextReviewDate;

  /// Create a copy of ReviewCharacter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewCharacterImplCopyWith<_$ReviewCharacterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
