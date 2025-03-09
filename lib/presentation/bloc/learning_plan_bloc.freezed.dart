// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_plan_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LearningPlanEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(LearningPlan plan) savePlan,
    required TResult Function(LearningPlan plan) updatePlan,
    required TResult Function(String id) deletePlan,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(LearningPlan plan)? savePlan,
    TResult? Function(LearningPlan plan)? updatePlan,
    TResult? Function(String id)? deletePlan,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LearningPlan plan)? savePlan,
    TResult Function(LearningPlan plan)? updatePlan,
    TResult Function(String id)? deletePlan,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SavePlan value) savePlan,
    required TResult Function(_UpdatePlan value) updatePlan,
    required TResult Function(_DeletePlan value) deletePlan,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SavePlan value)? savePlan,
    TResult? Function(_UpdatePlan value)? updatePlan,
    TResult? Function(_DeletePlan value)? deletePlan,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SavePlan value)? savePlan,
    TResult Function(_UpdatePlan value)? updatePlan,
    TResult Function(_DeletePlan value)? deletePlan,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningPlanEventCopyWith<$Res> {
  factory $LearningPlanEventCopyWith(
          LearningPlanEvent value, $Res Function(LearningPlanEvent) then) =
      _$LearningPlanEventCopyWithImpl<$Res, LearningPlanEvent>;
}

/// @nodoc
class _$LearningPlanEventCopyWithImpl<$Res, $Val extends LearningPlanEvent>
    implements $LearningPlanEventCopyWith<$Res> {
  _$LearningPlanEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LearningPlanEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$LearningPlanEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningPlanEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'LearningPlanEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(LearningPlan plan) savePlan,
    required TResult Function(LearningPlan plan) updatePlan,
    required TResult Function(String id) deletePlan,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(LearningPlan plan)? savePlan,
    TResult? Function(LearningPlan plan)? updatePlan,
    TResult? Function(String id)? deletePlan,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LearningPlan plan)? savePlan,
    TResult Function(LearningPlan plan)? updatePlan,
    TResult Function(String id)? deletePlan,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SavePlan value) savePlan,
    required TResult Function(_UpdatePlan value) updatePlan,
    required TResult Function(_DeletePlan value) deletePlan,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SavePlan value)? savePlan,
    TResult? Function(_UpdatePlan value)? updatePlan,
    TResult? Function(_DeletePlan value)? deletePlan,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SavePlan value)? savePlan,
    TResult Function(_UpdatePlan value)? updatePlan,
    TResult Function(_DeletePlan value)? deletePlan,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements LearningPlanEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$SavePlanImplCopyWith<$Res> {
  factory _$$SavePlanImplCopyWith(
          _$SavePlanImpl value, $Res Function(_$SavePlanImpl) then) =
      __$$SavePlanImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LearningPlan plan});

  $LearningPlanCopyWith<$Res> get plan;
}

/// @nodoc
class __$$SavePlanImplCopyWithImpl<$Res>
    extends _$LearningPlanEventCopyWithImpl<$Res, _$SavePlanImpl>
    implements _$$SavePlanImplCopyWith<$Res> {
  __$$SavePlanImplCopyWithImpl(
      _$SavePlanImpl _value, $Res Function(_$SavePlanImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningPlanEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plan = null,
  }) {
    return _then(_$SavePlanImpl(
      null == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as LearningPlan,
    ));
  }

  /// Create a copy of LearningPlanEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LearningPlanCopyWith<$Res> get plan {
    return $LearningPlanCopyWith<$Res>(_value.plan, (value) {
      return _then(_value.copyWith(plan: value));
    });
  }
}

/// @nodoc

class _$SavePlanImpl implements _SavePlan {
  const _$SavePlanImpl(this.plan);

  @override
  final LearningPlan plan;

  @override
  String toString() {
    return 'LearningPlanEvent.savePlan(plan: $plan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavePlanImpl &&
            (identical(other.plan, plan) || other.plan == plan));
  }

  @override
  int get hashCode => Object.hash(runtimeType, plan);

  /// Create a copy of LearningPlanEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavePlanImplCopyWith<_$SavePlanImpl> get copyWith =>
      __$$SavePlanImplCopyWithImpl<_$SavePlanImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(LearningPlan plan) savePlan,
    required TResult Function(LearningPlan plan) updatePlan,
    required TResult Function(String id) deletePlan,
  }) {
    return savePlan(plan);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(LearningPlan plan)? savePlan,
    TResult? Function(LearningPlan plan)? updatePlan,
    TResult? Function(String id)? deletePlan,
  }) {
    return savePlan?.call(plan);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LearningPlan plan)? savePlan,
    TResult Function(LearningPlan plan)? updatePlan,
    TResult Function(String id)? deletePlan,
    required TResult orElse(),
  }) {
    if (savePlan != null) {
      return savePlan(plan);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SavePlan value) savePlan,
    required TResult Function(_UpdatePlan value) updatePlan,
    required TResult Function(_DeletePlan value) deletePlan,
  }) {
    return savePlan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SavePlan value)? savePlan,
    TResult? Function(_UpdatePlan value)? updatePlan,
    TResult? Function(_DeletePlan value)? deletePlan,
  }) {
    return savePlan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SavePlan value)? savePlan,
    TResult Function(_UpdatePlan value)? updatePlan,
    TResult Function(_DeletePlan value)? deletePlan,
    required TResult orElse(),
  }) {
    if (savePlan != null) {
      return savePlan(this);
    }
    return orElse();
  }
}

abstract class _SavePlan implements LearningPlanEvent {
  const factory _SavePlan(final LearningPlan plan) = _$SavePlanImpl;

  LearningPlan get plan;

  /// Create a copy of LearningPlanEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavePlanImplCopyWith<_$SavePlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePlanImplCopyWith<$Res> {
  factory _$$UpdatePlanImplCopyWith(
          _$UpdatePlanImpl value, $Res Function(_$UpdatePlanImpl) then) =
      __$$UpdatePlanImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LearningPlan plan});

  $LearningPlanCopyWith<$Res> get plan;
}

/// @nodoc
class __$$UpdatePlanImplCopyWithImpl<$Res>
    extends _$LearningPlanEventCopyWithImpl<$Res, _$UpdatePlanImpl>
    implements _$$UpdatePlanImplCopyWith<$Res> {
  __$$UpdatePlanImplCopyWithImpl(
      _$UpdatePlanImpl _value, $Res Function(_$UpdatePlanImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningPlanEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plan = null,
  }) {
    return _then(_$UpdatePlanImpl(
      null == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as LearningPlan,
    ));
  }

  /// Create a copy of LearningPlanEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LearningPlanCopyWith<$Res> get plan {
    return $LearningPlanCopyWith<$Res>(_value.plan, (value) {
      return _then(_value.copyWith(plan: value));
    });
  }
}

/// @nodoc

class _$UpdatePlanImpl implements _UpdatePlan {
  const _$UpdatePlanImpl(this.plan);

  @override
  final LearningPlan plan;

  @override
  String toString() {
    return 'LearningPlanEvent.updatePlan(plan: $plan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePlanImpl &&
            (identical(other.plan, plan) || other.plan == plan));
  }

  @override
  int get hashCode => Object.hash(runtimeType, plan);

  /// Create a copy of LearningPlanEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePlanImplCopyWith<_$UpdatePlanImpl> get copyWith =>
      __$$UpdatePlanImplCopyWithImpl<_$UpdatePlanImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(LearningPlan plan) savePlan,
    required TResult Function(LearningPlan plan) updatePlan,
    required TResult Function(String id) deletePlan,
  }) {
    return updatePlan(plan);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(LearningPlan plan)? savePlan,
    TResult? Function(LearningPlan plan)? updatePlan,
    TResult? Function(String id)? deletePlan,
  }) {
    return updatePlan?.call(plan);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LearningPlan plan)? savePlan,
    TResult Function(LearningPlan plan)? updatePlan,
    TResult Function(String id)? deletePlan,
    required TResult orElse(),
  }) {
    if (updatePlan != null) {
      return updatePlan(plan);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SavePlan value) savePlan,
    required TResult Function(_UpdatePlan value) updatePlan,
    required TResult Function(_DeletePlan value) deletePlan,
  }) {
    return updatePlan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SavePlan value)? savePlan,
    TResult? Function(_UpdatePlan value)? updatePlan,
    TResult? Function(_DeletePlan value)? deletePlan,
  }) {
    return updatePlan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SavePlan value)? savePlan,
    TResult Function(_UpdatePlan value)? updatePlan,
    TResult Function(_DeletePlan value)? deletePlan,
    required TResult orElse(),
  }) {
    if (updatePlan != null) {
      return updatePlan(this);
    }
    return orElse();
  }
}

abstract class _UpdatePlan implements LearningPlanEvent {
  const factory _UpdatePlan(final LearningPlan plan) = _$UpdatePlanImpl;

  LearningPlan get plan;

  /// Create a copy of LearningPlanEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePlanImplCopyWith<_$UpdatePlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeletePlanImplCopyWith<$Res> {
  factory _$$DeletePlanImplCopyWith(
          _$DeletePlanImpl value, $Res Function(_$DeletePlanImpl) then) =
      __$$DeletePlanImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DeletePlanImplCopyWithImpl<$Res>
    extends _$LearningPlanEventCopyWithImpl<$Res, _$DeletePlanImpl>
    implements _$$DeletePlanImplCopyWith<$Res> {
  __$$DeletePlanImplCopyWithImpl(
      _$DeletePlanImpl _value, $Res Function(_$DeletePlanImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningPlanEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeletePlanImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeletePlanImpl implements _DeletePlan {
  const _$DeletePlanImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'LearningPlanEvent.deletePlan(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletePlanImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of LearningPlanEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeletePlanImplCopyWith<_$DeletePlanImpl> get copyWith =>
      __$$DeletePlanImplCopyWithImpl<_$DeletePlanImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(LearningPlan plan) savePlan,
    required TResult Function(LearningPlan plan) updatePlan,
    required TResult Function(String id) deletePlan,
  }) {
    return deletePlan(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(LearningPlan plan)? savePlan,
    TResult? Function(LearningPlan plan)? updatePlan,
    TResult? Function(String id)? deletePlan,
  }) {
    return deletePlan?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LearningPlan plan)? savePlan,
    TResult Function(LearningPlan plan)? updatePlan,
    TResult Function(String id)? deletePlan,
    required TResult orElse(),
  }) {
    if (deletePlan != null) {
      return deletePlan(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SavePlan value) savePlan,
    required TResult Function(_UpdatePlan value) updatePlan,
    required TResult Function(_DeletePlan value) deletePlan,
  }) {
    return deletePlan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SavePlan value)? savePlan,
    TResult? Function(_UpdatePlan value)? updatePlan,
    TResult? Function(_DeletePlan value)? deletePlan,
  }) {
    return deletePlan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SavePlan value)? savePlan,
    TResult Function(_UpdatePlan value)? updatePlan,
    TResult Function(_DeletePlan value)? deletePlan,
    required TResult orElse(),
  }) {
    if (deletePlan != null) {
      return deletePlan(this);
    }
    return orElse();
  }
}

abstract class _DeletePlan implements LearningPlanEvent {
  const factory _DeletePlan(final String id) = _$DeletePlanImpl;

  String get id;

  /// Create a copy of LearningPlanEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeletePlanImplCopyWith<_$DeletePlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LearningPlanState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<LearningPlan> plans) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<LearningPlan> plans)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<LearningPlan> plans)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningPlanStateCopyWith<$Res> {
  factory $LearningPlanStateCopyWith(
          LearningPlanState value, $Res Function(LearningPlanState) then) =
      _$LearningPlanStateCopyWithImpl<$Res, LearningPlanState>;
}

/// @nodoc
class _$LearningPlanStateCopyWithImpl<$Res, $Val extends LearningPlanState>
    implements $LearningPlanStateCopyWith<$Res> {
  _$LearningPlanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LearningPlanState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$LearningPlanStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningPlanState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'LearningPlanState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<LearningPlan> plans) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<LearningPlan> plans)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<LearningPlan> plans)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LearningPlanState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$LearningPlanStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningPlanState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'LearningPlanState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<LearningPlan> plans) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<LearningPlan> plans)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<LearningPlan> plans)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements LearningPlanState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<LearningPlan> plans});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$LearningPlanStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningPlanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plans = null,
  }) {
    return _then(_$LoadedImpl(
      null == plans
          ? _value._plans
          : plans // ignore: cast_nullable_to_non_nullable
              as List<LearningPlan>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<LearningPlan> plans) : _plans = plans;

  final List<LearningPlan> _plans;
  @override
  List<LearningPlan> get plans {
    if (_plans is EqualUnmodifiableListView) return _plans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plans);
  }

  @override
  String toString() {
    return 'LearningPlanState.loaded(plans: $plans)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._plans, _plans));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_plans));

  /// Create a copy of LearningPlanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<LearningPlan> plans) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(plans);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<LearningPlan> plans)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(plans);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<LearningPlan> plans)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(plans);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements LearningPlanState {
  const factory _Loaded(final List<LearningPlan> plans) = _$LoadedImpl;

  List<LearningPlan> get plans;

  /// Create a copy of LearningPlanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$LearningPlanStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningPlanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LearningPlanState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of LearningPlanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<LearningPlan> plans) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<LearningPlan> plans)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<LearningPlan> plans)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements LearningPlanState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of LearningPlanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
