// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LearningPlan _$LearningPlanFromJson(Map<String, dynamic> json) {
  return _LearningPlan.fromJson(json);
}

/// @nodoc
mixin _$LearningPlan {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  int get targetCharactersPerDay => throw _privateConstructorUsedError;
  Duration get targetStudyTimePerDay => throw _privateConstructorUsedError;
  List<String> get selectedCategories => throw _privateConstructorUsedError;
  Map<String, int> get exerciseTypeGoals => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  List<DailyGoal> get dailyGoals => throw _privateConstructorUsedError;

  /// Serializes this LearningPlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LearningPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LearningPlanCopyWith<LearningPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningPlanCopyWith<$Res> {
  factory $LearningPlanCopyWith(
          LearningPlan value, $Res Function(LearningPlan) then) =
      _$LearningPlanCopyWithImpl<$Res, LearningPlan>;
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime startDate,
      DateTime endDate,
      int targetCharactersPerDay,
      Duration targetStudyTimePerDay,
      List<String> selectedCategories,
      Map<String, int> exerciseTypeGoals,
      bool isActive,
      List<DailyGoal> dailyGoals});
}

/// @nodoc
class _$LearningPlanCopyWithImpl<$Res, $Val extends LearningPlan>
    implements $LearningPlanCopyWith<$Res> {
  _$LearningPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LearningPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? targetCharactersPerDay = null,
    Object? targetStudyTimePerDay = null,
    Object? selectedCategories = null,
    Object? exerciseTypeGoals = null,
    Object? isActive = null,
    Object? dailyGoals = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      targetCharactersPerDay: null == targetCharactersPerDay
          ? _value.targetCharactersPerDay
          : targetCharactersPerDay // ignore: cast_nullable_to_non_nullable
              as int,
      targetStudyTimePerDay: null == targetStudyTimePerDay
          ? _value.targetStudyTimePerDay
          : targetStudyTimePerDay // ignore: cast_nullable_to_non_nullable
              as Duration,
      selectedCategories: null == selectedCategories
          ? _value.selectedCategories
          : selectedCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      exerciseTypeGoals: null == exerciseTypeGoals
          ? _value.exerciseTypeGoals
          : exerciseTypeGoals // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      dailyGoals: null == dailyGoals
          ? _value.dailyGoals
          : dailyGoals // ignore: cast_nullable_to_non_nullable
              as List<DailyGoal>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearningPlanImplCopyWith<$Res>
    implements $LearningPlanCopyWith<$Res> {
  factory _$$LearningPlanImplCopyWith(
          _$LearningPlanImpl value, $Res Function(_$LearningPlanImpl) then) =
      __$$LearningPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime startDate,
      DateTime endDate,
      int targetCharactersPerDay,
      Duration targetStudyTimePerDay,
      List<String> selectedCategories,
      Map<String, int> exerciseTypeGoals,
      bool isActive,
      List<DailyGoal> dailyGoals});
}

/// @nodoc
class __$$LearningPlanImplCopyWithImpl<$Res>
    extends _$LearningPlanCopyWithImpl<$Res, _$LearningPlanImpl>
    implements _$$LearningPlanImplCopyWith<$Res> {
  __$$LearningPlanImplCopyWithImpl(
      _$LearningPlanImpl _value, $Res Function(_$LearningPlanImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? targetCharactersPerDay = null,
    Object? targetStudyTimePerDay = null,
    Object? selectedCategories = null,
    Object? exerciseTypeGoals = null,
    Object? isActive = null,
    Object? dailyGoals = null,
  }) {
    return _then(_$LearningPlanImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      targetCharactersPerDay: null == targetCharactersPerDay
          ? _value.targetCharactersPerDay
          : targetCharactersPerDay // ignore: cast_nullable_to_non_nullable
              as int,
      targetStudyTimePerDay: null == targetStudyTimePerDay
          ? _value.targetStudyTimePerDay
          : targetStudyTimePerDay // ignore: cast_nullable_to_non_nullable
              as Duration,
      selectedCategories: null == selectedCategories
          ? _value._selectedCategories
          : selectedCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      exerciseTypeGoals: null == exerciseTypeGoals
          ? _value._exerciseTypeGoals
          : exerciseTypeGoals // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      dailyGoals: null == dailyGoals
          ? _value._dailyGoals
          : dailyGoals // ignore: cast_nullable_to_non_nullable
              as List<DailyGoal>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LearningPlanImpl implements _LearningPlan {
  const _$LearningPlanImpl(
      {required this.id,
      required this.name,
      required this.startDate,
      required this.endDate,
      required this.targetCharactersPerDay,
      required this.targetStudyTimePerDay,
      required final List<String> selectedCategories,
      required final Map<String, int> exerciseTypeGoals,
      required this.isActive,
      required final List<DailyGoal> dailyGoals})
      : _selectedCategories = selectedCategories,
        _exerciseTypeGoals = exerciseTypeGoals,
        _dailyGoals = dailyGoals;

  factory _$LearningPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$LearningPlanImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final int targetCharactersPerDay;
  @override
  final Duration targetStudyTimePerDay;
  final List<String> _selectedCategories;
  @override
  List<String> get selectedCategories {
    if (_selectedCategories is EqualUnmodifiableListView)
      return _selectedCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedCategories);
  }

  final Map<String, int> _exerciseTypeGoals;
  @override
  Map<String, int> get exerciseTypeGoals {
    if (_exerciseTypeGoals is EqualUnmodifiableMapView)
      return _exerciseTypeGoals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_exerciseTypeGoals);
  }

  @override
  final bool isActive;
  final List<DailyGoal> _dailyGoals;
  @override
  List<DailyGoal> get dailyGoals {
    if (_dailyGoals is EqualUnmodifiableListView) return _dailyGoals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyGoals);
  }

  @override
  String toString() {
    return 'LearningPlan(id: $id, name: $name, startDate: $startDate, endDate: $endDate, targetCharactersPerDay: $targetCharactersPerDay, targetStudyTimePerDay: $targetStudyTimePerDay, selectedCategories: $selectedCategories, exerciseTypeGoals: $exerciseTypeGoals, isActive: $isActive, dailyGoals: $dailyGoals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearningPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.targetCharactersPerDay, targetCharactersPerDay) ||
                other.targetCharactersPerDay == targetCharactersPerDay) &&
            (identical(other.targetStudyTimePerDay, targetStudyTimePerDay) ||
                other.targetStudyTimePerDay == targetStudyTimePerDay) &&
            const DeepCollectionEquality()
                .equals(other._selectedCategories, _selectedCategories) &&
            const DeepCollectionEquality()
                .equals(other._exerciseTypeGoals, _exerciseTypeGoals) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._dailyGoals, _dailyGoals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      startDate,
      endDate,
      targetCharactersPerDay,
      targetStudyTimePerDay,
      const DeepCollectionEquality().hash(_selectedCategories),
      const DeepCollectionEquality().hash(_exerciseTypeGoals),
      isActive,
      const DeepCollectionEquality().hash(_dailyGoals));

  /// Create a copy of LearningPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LearningPlanImplCopyWith<_$LearningPlanImpl> get copyWith =>
      __$$LearningPlanImplCopyWithImpl<_$LearningPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LearningPlanImplToJson(
      this,
    );
  }
}

abstract class _LearningPlan implements LearningPlan {
  const factory _LearningPlan(
      {required final String id,
      required final String name,
      required final DateTime startDate,
      required final DateTime endDate,
      required final int targetCharactersPerDay,
      required final Duration targetStudyTimePerDay,
      required final List<String> selectedCategories,
      required final Map<String, int> exerciseTypeGoals,
      required final bool isActive,
      required final List<DailyGoal> dailyGoals}) = _$LearningPlanImpl;

  factory _LearningPlan.fromJson(Map<String, dynamic> json) =
      _$LearningPlanImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  int get targetCharactersPerDay;
  @override
  Duration get targetStudyTimePerDay;
  @override
  List<String> get selectedCategories;
  @override
  Map<String, int> get exerciseTypeGoals;
  @override
  bool get isActive;
  @override
  List<DailyGoal> get dailyGoals;

  /// Create a copy of LearningPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LearningPlanImplCopyWith<_$LearningPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyGoal _$DailyGoalFromJson(Map<String, dynamic> json) {
  return _DailyGoal.fromJson(json);
}

/// @nodoc
mixin _$DailyGoal {
  DateTime get date => throw _privateConstructorUsedError;
  int get charactersToLearn => throw _privateConstructorUsedError;
  Duration get studyTime => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  Map<String, bool> get exerciseCompletion =>
      throw _privateConstructorUsedError;

  /// Serializes this DailyGoal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyGoalCopyWith<DailyGoal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyGoalCopyWith<$Res> {
  factory $DailyGoalCopyWith(DailyGoal value, $Res Function(DailyGoal) then) =
      _$DailyGoalCopyWithImpl<$Res, DailyGoal>;
  @useResult
  $Res call(
      {DateTime date,
      int charactersToLearn,
      Duration studyTime,
      bool isCompleted,
      Map<String, bool> exerciseCompletion});
}

/// @nodoc
class _$DailyGoalCopyWithImpl<$Res, $Val extends DailyGoal>
    implements $DailyGoalCopyWith<$Res> {
  _$DailyGoalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyGoal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? charactersToLearn = null,
    Object? studyTime = null,
    Object? isCompleted = null,
    Object? exerciseCompletion = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      charactersToLearn: null == charactersToLearn
          ? _value.charactersToLearn
          : charactersToLearn // ignore: cast_nullable_to_non_nullable
              as int,
      studyTime: null == studyTime
          ? _value.studyTime
          : studyTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      exerciseCompletion: null == exerciseCompletion
          ? _value.exerciseCompletion
          : exerciseCompletion // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyGoalImplCopyWith<$Res>
    implements $DailyGoalCopyWith<$Res> {
  factory _$$DailyGoalImplCopyWith(
          _$DailyGoalImpl value, $Res Function(_$DailyGoalImpl) then) =
      __$$DailyGoalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      int charactersToLearn,
      Duration studyTime,
      bool isCompleted,
      Map<String, bool> exerciseCompletion});
}

/// @nodoc
class __$$DailyGoalImplCopyWithImpl<$Res>
    extends _$DailyGoalCopyWithImpl<$Res, _$DailyGoalImpl>
    implements _$$DailyGoalImplCopyWith<$Res> {
  __$$DailyGoalImplCopyWithImpl(
      _$DailyGoalImpl _value, $Res Function(_$DailyGoalImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyGoal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? charactersToLearn = null,
    Object? studyTime = null,
    Object? isCompleted = null,
    Object? exerciseCompletion = null,
  }) {
    return _then(_$DailyGoalImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      charactersToLearn: null == charactersToLearn
          ? _value.charactersToLearn
          : charactersToLearn // ignore: cast_nullable_to_non_nullable
              as int,
      studyTime: null == studyTime
          ? _value.studyTime
          : studyTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      exerciseCompletion: null == exerciseCompletion
          ? _value._exerciseCompletion
          : exerciseCompletion // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyGoalImpl implements _DailyGoal {
  const _$DailyGoalImpl(
      {required this.date,
      required this.charactersToLearn,
      required this.studyTime,
      required this.isCompleted,
      required final Map<String, bool> exerciseCompletion})
      : _exerciseCompletion = exerciseCompletion;

  factory _$DailyGoalImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyGoalImplFromJson(json);

  @override
  final DateTime date;
  @override
  final int charactersToLearn;
  @override
  final Duration studyTime;
  @override
  final bool isCompleted;
  final Map<String, bool> _exerciseCompletion;
  @override
  Map<String, bool> get exerciseCompletion {
    if (_exerciseCompletion is EqualUnmodifiableMapView)
      return _exerciseCompletion;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_exerciseCompletion);
  }

  @override
  String toString() {
    return 'DailyGoal(date: $date, charactersToLearn: $charactersToLearn, studyTime: $studyTime, isCompleted: $isCompleted, exerciseCompletion: $exerciseCompletion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyGoalImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.charactersToLearn, charactersToLearn) ||
                other.charactersToLearn == charactersToLearn) &&
            (identical(other.studyTime, studyTime) ||
                other.studyTime == studyTime) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            const DeepCollectionEquality()
                .equals(other._exerciseCompletion, _exerciseCompletion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      charactersToLearn,
      studyTime,
      isCompleted,
      const DeepCollectionEquality().hash(_exerciseCompletion));

  /// Create a copy of DailyGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyGoalImplCopyWith<_$DailyGoalImpl> get copyWith =>
      __$$DailyGoalImplCopyWithImpl<_$DailyGoalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyGoalImplToJson(
      this,
    );
  }
}

abstract class _DailyGoal implements DailyGoal {
  const factory _DailyGoal(
      {required final DateTime date,
      required final int charactersToLearn,
      required final Duration studyTime,
      required final bool isCompleted,
      required final Map<String, bool> exerciseCompletion}) = _$DailyGoalImpl;

  factory _DailyGoal.fromJson(Map<String, dynamic> json) =
      _$DailyGoalImpl.fromJson;

  @override
  DateTime get date;
  @override
  int get charactersToLearn;
  @override
  Duration get studyTime;
  @override
  bool get isCompleted;
  @override
  Map<String, bool> get exerciseCompletion;

  /// Create a copy of DailyGoal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyGoalImplCopyWith<_$DailyGoalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
