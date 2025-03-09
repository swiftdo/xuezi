// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LearningReminder {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DateTime get scheduledTime => throw _privateConstructorUsedError;
  bool get isEnabled => throw _privateConstructorUsedError;
  List<int> get repeatDays =>
      throw _privateConstructorUsedError; // 0-6 representing Sunday-Saturday
  ReminderType get type => throw _privateConstructorUsedError;
  Map<String, dynamic> get additionalData => throw _privateConstructorUsedError;

  /// Create a copy of LearningReminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LearningReminderCopyWith<LearningReminder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningReminderCopyWith<$Res> {
  factory $LearningReminderCopyWith(
          LearningReminder value, $Res Function(LearningReminder) then) =
      _$LearningReminderCopyWithImpl<$Res, LearningReminder>;
  @useResult
  $Res call(
      {String id,
      String title,
      String message,
      DateTime scheduledTime,
      bool isEnabled,
      List<int> repeatDays,
      ReminderType type,
      Map<String, dynamic> additionalData});
}

/// @nodoc
class _$LearningReminderCopyWithImpl<$Res, $Val extends LearningReminder>
    implements $LearningReminderCopyWith<$Res> {
  _$LearningReminderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LearningReminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? message = null,
    Object? scheduledTime = null,
    Object? isEnabled = null,
    Object? repeatDays = null,
    Object? type = null,
    Object? additionalData = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      repeatDays: null == repeatDays
          ? _value.repeatDays
          : repeatDays // ignore: cast_nullable_to_non_nullable
              as List<int>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReminderType,
      additionalData: null == additionalData
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearningReminderImplCopyWith<$Res>
    implements $LearningReminderCopyWith<$Res> {
  factory _$$LearningReminderImplCopyWith(_$LearningReminderImpl value,
          $Res Function(_$LearningReminderImpl) then) =
      __$$LearningReminderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String message,
      DateTime scheduledTime,
      bool isEnabled,
      List<int> repeatDays,
      ReminderType type,
      Map<String, dynamic> additionalData});
}

/// @nodoc
class __$$LearningReminderImplCopyWithImpl<$Res>
    extends _$LearningReminderCopyWithImpl<$Res, _$LearningReminderImpl>
    implements _$$LearningReminderImplCopyWith<$Res> {
  __$$LearningReminderImplCopyWithImpl(_$LearningReminderImpl _value,
      $Res Function(_$LearningReminderImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningReminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? message = null,
    Object? scheduledTime = null,
    Object? isEnabled = null,
    Object? repeatDays = null,
    Object? type = null,
    Object? additionalData = null,
  }) {
    return _then(_$LearningReminderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      repeatDays: null == repeatDays
          ? _value._repeatDays
          : repeatDays // ignore: cast_nullable_to_non_nullable
              as List<int>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReminderType,
      additionalData: null == additionalData
          ? _value._additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$LearningReminderImpl implements _LearningReminder {
  const _$LearningReminderImpl(
      {required this.id,
      required this.title,
      required this.message,
      required this.scheduledTime,
      required this.isEnabled,
      required final List<int> repeatDays,
      required this.type,
      required final Map<String, dynamic> additionalData})
      : _repeatDays = repeatDays,
        _additionalData = additionalData;

  @override
  final String id;
  @override
  final String title;
  @override
  final String message;
  @override
  final DateTime scheduledTime;
  @override
  final bool isEnabled;
  final List<int> _repeatDays;
  @override
  List<int> get repeatDays {
    if (_repeatDays is EqualUnmodifiableListView) return _repeatDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_repeatDays);
  }

// 0-6 representing Sunday-Saturday
  @override
  final ReminderType type;
  final Map<String, dynamic> _additionalData;
  @override
  Map<String, dynamic> get additionalData {
    if (_additionalData is EqualUnmodifiableMapView) return _additionalData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_additionalData);
  }

  @override
  String toString() {
    return 'LearningReminder(id: $id, title: $title, message: $message, scheduledTime: $scheduledTime, isEnabled: $isEnabled, repeatDays: $repeatDays, type: $type, additionalData: $additionalData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearningReminderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            const DeepCollectionEquality()
                .equals(other._repeatDays, _repeatDays) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._additionalData, _additionalData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      message,
      scheduledTime,
      isEnabled,
      const DeepCollectionEquality().hash(_repeatDays),
      type,
      const DeepCollectionEquality().hash(_additionalData));

  /// Create a copy of LearningReminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LearningReminderImplCopyWith<_$LearningReminderImpl> get copyWith =>
      __$$LearningReminderImplCopyWithImpl<_$LearningReminderImpl>(
          this, _$identity);
}

abstract class _LearningReminder implements LearningReminder {
  const factory _LearningReminder(
          {required final String id,
          required final String title,
          required final String message,
          required final DateTime scheduledTime,
          required final bool isEnabled,
          required final List<int> repeatDays,
          required final ReminderType type,
          required final Map<String, dynamic> additionalData}) =
      _$LearningReminderImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  String get message;
  @override
  DateTime get scheduledTime;
  @override
  bool get isEnabled;
  @override
  List<int> get repeatDays; // 0-6 representing Sunday-Saturday
  @override
  ReminderType get type;
  @override
  Map<String, dynamic> get additionalData;

  /// Create a copy of LearningReminder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LearningReminderImplCopyWith<_$LearningReminderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
