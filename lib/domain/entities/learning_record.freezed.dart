// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LearningRecord _$LearningRecordFromJson(Map<String, dynamic> json) {
  return _LearningRecord.fromJson(json);
}

/// @nodoc
mixin _$LearningRecord {
  String get id => throw _privateConstructorUsedError;
  String get planId => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  Duration get totalStudyTime => throw _privateConstructorUsedError;
  List<String> get knownCharacters => throw _privateConstructorUsedError;
  List<String> get unknownCharacters => throw _privateConstructorUsedError;
  int get targetCharactersPerDay => throw _privateConstructorUsedError;
  Duration get targetStudyTimePerDay => throw _privateConstructorUsedError;

  /// Serializes this LearningRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LearningRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LearningRecordCopyWith<LearningRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningRecordCopyWith<$Res> {
  factory $LearningRecordCopyWith(
          LearningRecord value, $Res Function(LearningRecord) then) =
      _$LearningRecordCopyWithImpl<$Res, LearningRecord>;
  @useResult
  $Res call(
      {String id,
      String planId,
      DateTime startTime,
      DateTime endTime,
      Duration totalStudyTime,
      List<String> knownCharacters,
      List<String> unknownCharacters,
      int targetCharactersPerDay,
      Duration targetStudyTimePerDay});
}

/// @nodoc
class _$LearningRecordCopyWithImpl<$Res, $Val extends LearningRecord>
    implements $LearningRecordCopyWith<$Res> {
  _$LearningRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LearningRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? planId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? totalStudyTime = null,
    Object? knownCharacters = null,
    Object? unknownCharacters = null,
    Object? targetCharactersPerDay = null,
    Object? targetStudyTimePerDay = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalStudyTime: null == totalStudyTime
          ? _value.totalStudyTime
          : totalStudyTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      knownCharacters: null == knownCharacters
          ? _value.knownCharacters
          : knownCharacters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      unknownCharacters: null == unknownCharacters
          ? _value.unknownCharacters
          : unknownCharacters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      targetCharactersPerDay: null == targetCharactersPerDay
          ? _value.targetCharactersPerDay
          : targetCharactersPerDay // ignore: cast_nullable_to_non_nullable
              as int,
      targetStudyTimePerDay: null == targetStudyTimePerDay
          ? _value.targetStudyTimePerDay
          : targetStudyTimePerDay // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearningRecordImplCopyWith<$Res>
    implements $LearningRecordCopyWith<$Res> {
  factory _$$LearningRecordImplCopyWith(_$LearningRecordImpl value,
          $Res Function(_$LearningRecordImpl) then) =
      __$$LearningRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String planId,
      DateTime startTime,
      DateTime endTime,
      Duration totalStudyTime,
      List<String> knownCharacters,
      List<String> unknownCharacters,
      int targetCharactersPerDay,
      Duration targetStudyTimePerDay});
}

/// @nodoc
class __$$LearningRecordImplCopyWithImpl<$Res>
    extends _$LearningRecordCopyWithImpl<$Res, _$LearningRecordImpl>
    implements _$$LearningRecordImplCopyWith<$Res> {
  __$$LearningRecordImplCopyWithImpl(
      _$LearningRecordImpl _value, $Res Function(_$LearningRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? planId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? totalStudyTime = null,
    Object? knownCharacters = null,
    Object? unknownCharacters = null,
    Object? targetCharactersPerDay = null,
    Object? targetStudyTimePerDay = null,
  }) {
    return _then(_$LearningRecordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalStudyTime: null == totalStudyTime
          ? _value.totalStudyTime
          : totalStudyTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      knownCharacters: null == knownCharacters
          ? _value._knownCharacters
          : knownCharacters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      unknownCharacters: null == unknownCharacters
          ? _value._unknownCharacters
          : unknownCharacters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      targetCharactersPerDay: null == targetCharactersPerDay
          ? _value.targetCharactersPerDay
          : targetCharactersPerDay // ignore: cast_nullable_to_non_nullable
              as int,
      targetStudyTimePerDay: null == targetStudyTimePerDay
          ? _value.targetStudyTimePerDay
          : targetStudyTimePerDay // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LearningRecordImpl implements _LearningRecord {
  const _$LearningRecordImpl(
      {required this.id,
      required this.planId,
      required this.startTime,
      required this.endTime,
      required this.totalStudyTime,
      required final List<String> knownCharacters,
      required final List<String> unknownCharacters,
      required this.targetCharactersPerDay,
      required this.targetStudyTimePerDay})
      : _knownCharacters = knownCharacters,
        _unknownCharacters = unknownCharacters;

  factory _$LearningRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$LearningRecordImplFromJson(json);

  @override
  final String id;
  @override
  final String planId;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final Duration totalStudyTime;
  final List<String> _knownCharacters;
  @override
  List<String> get knownCharacters {
    if (_knownCharacters is EqualUnmodifiableListView) return _knownCharacters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_knownCharacters);
  }

  final List<String> _unknownCharacters;
  @override
  List<String> get unknownCharacters {
    if (_unknownCharacters is EqualUnmodifiableListView)
      return _unknownCharacters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unknownCharacters);
  }

  @override
  final int targetCharactersPerDay;
  @override
  final Duration targetStudyTimePerDay;

  @override
  String toString() {
    return 'LearningRecord(id: $id, planId: $planId, startTime: $startTime, endTime: $endTime, totalStudyTime: $totalStudyTime, knownCharacters: $knownCharacters, unknownCharacters: $unknownCharacters, targetCharactersPerDay: $targetCharactersPerDay, targetStudyTimePerDay: $targetStudyTimePerDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearningRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.totalStudyTime, totalStudyTime) ||
                other.totalStudyTime == totalStudyTime) &&
            const DeepCollectionEquality()
                .equals(other._knownCharacters, _knownCharacters) &&
            const DeepCollectionEquality()
                .equals(other._unknownCharacters, _unknownCharacters) &&
            (identical(other.targetCharactersPerDay, targetCharactersPerDay) ||
                other.targetCharactersPerDay == targetCharactersPerDay) &&
            (identical(other.targetStudyTimePerDay, targetStudyTimePerDay) ||
                other.targetStudyTimePerDay == targetStudyTimePerDay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      planId,
      startTime,
      endTime,
      totalStudyTime,
      const DeepCollectionEquality().hash(_knownCharacters),
      const DeepCollectionEquality().hash(_unknownCharacters),
      targetCharactersPerDay,
      targetStudyTimePerDay);

  /// Create a copy of LearningRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LearningRecordImplCopyWith<_$LearningRecordImpl> get copyWith =>
      __$$LearningRecordImplCopyWithImpl<_$LearningRecordImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LearningRecordImplToJson(
      this,
    );
  }
}

abstract class _LearningRecord implements LearningRecord {
  const factory _LearningRecord(
      {required final String id,
      required final String planId,
      required final DateTime startTime,
      required final DateTime endTime,
      required final Duration totalStudyTime,
      required final List<String> knownCharacters,
      required final List<String> unknownCharacters,
      required final int targetCharactersPerDay,
      required final Duration targetStudyTimePerDay}) = _$LearningRecordImpl;

  factory _LearningRecord.fromJson(Map<String, dynamic> json) =
      _$LearningRecordImpl.fromJson;

  @override
  String get id;
  @override
  String get planId;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  Duration get totalStudyTime;
  @override
  List<String> get knownCharacters;
  @override
  List<String> get unknownCharacters;
  @override
  int get targetCharactersPerDay;
  @override
  Duration get targetStudyTimePerDay;

  /// Create a copy of LearningRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LearningRecordImplCopyWith<_$LearningRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExerciseRecord _$ExerciseRecordFromJson(Map<String, dynamic> json) {
  return _ExerciseRecord.fromJson(json);
}

/// @nodoc
mixin _$ExerciseRecord {
  String get type => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  int get characterCount => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this ExerciseRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExerciseRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseRecordCopyWith<ExerciseRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseRecordCopyWith<$Res> {
  factory $ExerciseRecordCopyWith(
          ExerciseRecord value, $Res Function(ExerciseRecord) then) =
      _$ExerciseRecordCopyWithImpl<$Res, ExerciseRecord>;
  @useResult
  $Res call(
      {String type, DateTime timestamp, int characterCount, String? notes});
}

/// @nodoc
class _$ExerciseRecordCopyWithImpl<$Res, $Val extends ExerciseRecord>
    implements $ExerciseRecordCopyWith<$Res> {
  _$ExerciseRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? timestamp = null,
    Object? characterCount = null,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      characterCount: null == characterCount
          ? _value.characterCount
          : characterCount // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseRecordImplCopyWith<$Res>
    implements $ExerciseRecordCopyWith<$Res> {
  factory _$$ExerciseRecordImplCopyWith(_$ExerciseRecordImpl value,
          $Res Function(_$ExerciseRecordImpl) then) =
      __$$ExerciseRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type, DateTime timestamp, int characterCount, String? notes});
}

/// @nodoc
class __$$ExerciseRecordImplCopyWithImpl<$Res>
    extends _$ExerciseRecordCopyWithImpl<$Res, _$ExerciseRecordImpl>
    implements _$$ExerciseRecordImplCopyWith<$Res> {
  __$$ExerciseRecordImplCopyWithImpl(
      _$ExerciseRecordImpl _value, $Res Function(_$ExerciseRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExerciseRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? timestamp = null,
    Object? characterCount = null,
    Object? notes = freezed,
  }) {
    return _then(_$ExerciseRecordImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      characterCount: null == characterCount
          ? _value.characterCount
          : characterCount // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseRecordImpl implements _ExerciseRecord {
  const _$ExerciseRecordImpl(
      {required this.type,
      required this.timestamp,
      required this.characterCount,
      this.notes});

  factory _$ExerciseRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseRecordImplFromJson(json);

  @override
  final String type;
  @override
  final DateTime timestamp;
  @override
  final int characterCount;
  @override
  final String? notes;

  @override
  String toString() {
    return 'ExerciseRecord(type: $type, timestamp: $timestamp, characterCount: $characterCount, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseRecordImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.characterCount, characterCount) ||
                other.characterCount == characterCount) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, timestamp, characterCount, notes);

  /// Create a copy of ExerciseRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseRecordImplCopyWith<_$ExerciseRecordImpl> get copyWith =>
      __$$ExerciseRecordImplCopyWithImpl<_$ExerciseRecordImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseRecordImplToJson(
      this,
    );
  }
}

abstract class _ExerciseRecord implements ExerciseRecord {
  const factory _ExerciseRecord(
      {required final String type,
      required final DateTime timestamp,
      required final int characterCount,
      final String? notes}) = _$ExerciseRecordImpl;

  factory _ExerciseRecord.fromJson(Map<String, dynamic> json) =
      _$ExerciseRecordImpl.fromJson;

  @override
  String get type;
  @override
  DateTime get timestamp;
  @override
  int get characterCount;
  @override
  String? get notes;

  /// Create a copy of ExerciseRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseRecordImplCopyWith<_$ExerciseRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
