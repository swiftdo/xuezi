// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LearningSessionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function(String character, bool isKnown) characterLearned,
    required TResult Function(String character) characterUndone,
    required TResult Function() endSession,
    required TResult Function() restart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function(String character, bool isKnown)? characterLearned,
    TResult? Function(String character)? characterUndone,
    TResult? Function()? endSession,
    TResult? Function()? restart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function(String character, bool isKnown)? characterLearned,
    TResult Function(String character)? characterUndone,
    TResult Function()? endSession,
    TResult Function()? restart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Resumed value) resumed,
    required TResult Function(_CharacterLearned value) characterLearned,
    required TResult Function(_CharacterUndone value) characterUndone,
    required TResult Function(_EndSession value) endSession,
    required TResult Function(_Restart value) restart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Resumed value)? resumed,
    TResult? Function(_CharacterLearned value)? characterLearned,
    TResult? Function(_CharacterUndone value)? characterUndone,
    TResult? Function(_EndSession value)? endSession,
    TResult? Function(_Restart value)? restart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Paused value)? paused,
    TResult Function(_Resumed value)? resumed,
    TResult Function(_CharacterLearned value)? characterLearned,
    TResult Function(_CharacterUndone value)? characterUndone,
    TResult Function(_EndSession value)? endSession,
    TResult Function(_Restart value)? restart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningSessionEventCopyWith<$Res> {
  factory $LearningSessionEventCopyWith(LearningSessionEvent value,
          $Res Function(LearningSessionEvent) then) =
      _$LearningSessionEventCopyWithImpl<$Res, LearningSessionEvent>;
}

/// @nodoc
class _$LearningSessionEventCopyWithImpl<$Res,
        $Val extends LearningSessionEvent>
    implements $LearningSessionEventCopyWith<$Res> {
  _$LearningSessionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LearningSessionEvent
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
    extends _$LearningSessionEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningSessionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'LearningSessionEvent.started()';
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
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function(String character, bool isKnown) characterLearned,
    required TResult Function(String character) characterUndone,
    required TResult Function() endSession,
    required TResult Function() restart,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function(String character, bool isKnown)? characterLearned,
    TResult? Function(String character)? characterUndone,
    TResult? Function()? endSession,
    TResult? Function()? restart,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function(String character, bool isKnown)? characterLearned,
    TResult Function(String character)? characterUndone,
    TResult Function()? endSession,
    TResult Function()? restart,
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
    required TResult Function(_Paused value) paused,
    required TResult Function(_Resumed value) resumed,
    required TResult Function(_CharacterLearned value) characterLearned,
    required TResult Function(_CharacterUndone value) characterUndone,
    required TResult Function(_EndSession value) endSession,
    required TResult Function(_Restart value) restart,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Resumed value)? resumed,
    TResult? Function(_CharacterLearned value)? characterLearned,
    TResult? Function(_CharacterUndone value)? characterUndone,
    TResult? Function(_EndSession value)? endSession,
    TResult? Function(_Restart value)? restart,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Paused value)? paused,
    TResult Function(_Resumed value)? resumed,
    TResult Function(_CharacterLearned value)? characterLearned,
    TResult Function(_CharacterUndone value)? characterUndone,
    TResult Function(_EndSession value)? endSession,
    TResult Function(_Restart value)? restart,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements LearningSessionEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$PausedImplCopyWith<$Res> {
  factory _$$PausedImplCopyWith(
          _$PausedImpl value, $Res Function(_$PausedImpl) then) =
      __$$PausedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PausedImplCopyWithImpl<$Res>
    extends _$LearningSessionEventCopyWithImpl<$Res, _$PausedImpl>
    implements _$$PausedImplCopyWith<$Res> {
  __$$PausedImplCopyWithImpl(
      _$PausedImpl _value, $Res Function(_$PausedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningSessionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PausedImpl implements _Paused {
  const _$PausedImpl();

  @override
  String toString() {
    return 'LearningSessionEvent.paused()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PausedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function(String character, bool isKnown) characterLearned,
    required TResult Function(String character) characterUndone,
    required TResult Function() endSession,
    required TResult Function() restart,
  }) {
    return paused();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function(String character, bool isKnown)? characterLearned,
    TResult? Function(String character)? characterUndone,
    TResult? Function()? endSession,
    TResult? Function()? restart,
  }) {
    return paused?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function(String character, bool isKnown)? characterLearned,
    TResult Function(String character)? characterUndone,
    TResult Function()? endSession,
    TResult Function()? restart,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Resumed value) resumed,
    required TResult Function(_CharacterLearned value) characterLearned,
    required TResult Function(_CharacterUndone value) characterUndone,
    required TResult Function(_EndSession value) endSession,
    required TResult Function(_Restart value) restart,
  }) {
    return paused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Resumed value)? resumed,
    TResult? Function(_CharacterLearned value)? characterLearned,
    TResult? Function(_CharacterUndone value)? characterUndone,
    TResult? Function(_EndSession value)? endSession,
    TResult? Function(_Restart value)? restart,
  }) {
    return paused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Paused value)? paused,
    TResult Function(_Resumed value)? resumed,
    TResult Function(_CharacterLearned value)? characterLearned,
    TResult Function(_CharacterUndone value)? characterUndone,
    TResult Function(_EndSession value)? endSession,
    TResult Function(_Restart value)? restart,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }
}

abstract class _Paused implements LearningSessionEvent {
  const factory _Paused() = _$PausedImpl;
}

/// @nodoc
abstract class _$$ResumedImplCopyWith<$Res> {
  factory _$$ResumedImplCopyWith(
          _$ResumedImpl value, $Res Function(_$ResumedImpl) then) =
      __$$ResumedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResumedImplCopyWithImpl<$Res>
    extends _$LearningSessionEventCopyWithImpl<$Res, _$ResumedImpl>
    implements _$$ResumedImplCopyWith<$Res> {
  __$$ResumedImplCopyWithImpl(
      _$ResumedImpl _value, $Res Function(_$ResumedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningSessionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResumedImpl implements _Resumed {
  const _$ResumedImpl();

  @override
  String toString() {
    return 'LearningSessionEvent.resumed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResumedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function(String character, bool isKnown) characterLearned,
    required TResult Function(String character) characterUndone,
    required TResult Function() endSession,
    required TResult Function() restart,
  }) {
    return resumed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function(String character, bool isKnown)? characterLearned,
    TResult? Function(String character)? characterUndone,
    TResult? Function()? endSession,
    TResult? Function()? restart,
  }) {
    return resumed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function(String character, bool isKnown)? characterLearned,
    TResult Function(String character)? characterUndone,
    TResult Function()? endSession,
    TResult Function()? restart,
    required TResult orElse(),
  }) {
    if (resumed != null) {
      return resumed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Resumed value) resumed,
    required TResult Function(_CharacterLearned value) characterLearned,
    required TResult Function(_CharacterUndone value) characterUndone,
    required TResult Function(_EndSession value) endSession,
    required TResult Function(_Restart value) restart,
  }) {
    return resumed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Resumed value)? resumed,
    TResult? Function(_CharacterLearned value)? characterLearned,
    TResult? Function(_CharacterUndone value)? characterUndone,
    TResult? Function(_EndSession value)? endSession,
    TResult? Function(_Restart value)? restart,
  }) {
    return resumed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Paused value)? paused,
    TResult Function(_Resumed value)? resumed,
    TResult Function(_CharacterLearned value)? characterLearned,
    TResult Function(_CharacterUndone value)? characterUndone,
    TResult Function(_EndSession value)? endSession,
    TResult Function(_Restart value)? restart,
    required TResult orElse(),
  }) {
    if (resumed != null) {
      return resumed(this);
    }
    return orElse();
  }
}

abstract class _Resumed implements LearningSessionEvent {
  const factory _Resumed() = _$ResumedImpl;
}

/// @nodoc
abstract class _$$CharacterLearnedImplCopyWith<$Res> {
  factory _$$CharacterLearnedImplCopyWith(_$CharacterLearnedImpl value,
          $Res Function(_$CharacterLearnedImpl) then) =
      __$$CharacterLearnedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String character, bool isKnown});
}

/// @nodoc
class __$$CharacterLearnedImplCopyWithImpl<$Res>
    extends _$LearningSessionEventCopyWithImpl<$Res, _$CharacterLearnedImpl>
    implements _$$CharacterLearnedImplCopyWith<$Res> {
  __$$CharacterLearnedImplCopyWithImpl(_$CharacterLearnedImpl _value,
      $Res Function(_$CharacterLearnedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? character = null,
    Object? isKnown = null,
  }) {
    return _then(_$CharacterLearnedImpl(
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
      isKnown: null == isKnown
          ? _value.isKnown
          : isKnown // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CharacterLearnedImpl implements _CharacterLearned {
  const _$CharacterLearnedImpl(
      {required this.character, required this.isKnown});

  @override
  final String character;
  @override
  final bool isKnown;

  @override
  String toString() {
    return 'LearningSessionEvent.characterLearned(character: $character, isKnown: $isKnown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterLearnedImpl &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.isKnown, isKnown) || other.isKnown == isKnown));
  }

  @override
  int get hashCode => Object.hash(runtimeType, character, isKnown);

  /// Create a copy of LearningSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterLearnedImplCopyWith<_$CharacterLearnedImpl> get copyWith =>
      __$$CharacterLearnedImplCopyWithImpl<_$CharacterLearnedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function(String character, bool isKnown) characterLearned,
    required TResult Function(String character) characterUndone,
    required TResult Function() endSession,
    required TResult Function() restart,
  }) {
    return characterLearned(character, isKnown);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function(String character, bool isKnown)? characterLearned,
    TResult? Function(String character)? characterUndone,
    TResult? Function()? endSession,
    TResult? Function()? restart,
  }) {
    return characterLearned?.call(character, isKnown);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function(String character, bool isKnown)? characterLearned,
    TResult Function(String character)? characterUndone,
    TResult Function()? endSession,
    TResult Function()? restart,
    required TResult orElse(),
  }) {
    if (characterLearned != null) {
      return characterLearned(character, isKnown);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Resumed value) resumed,
    required TResult Function(_CharacterLearned value) characterLearned,
    required TResult Function(_CharacterUndone value) characterUndone,
    required TResult Function(_EndSession value) endSession,
    required TResult Function(_Restart value) restart,
  }) {
    return characterLearned(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Resumed value)? resumed,
    TResult? Function(_CharacterLearned value)? characterLearned,
    TResult? Function(_CharacterUndone value)? characterUndone,
    TResult? Function(_EndSession value)? endSession,
    TResult? Function(_Restart value)? restart,
  }) {
    return characterLearned?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Paused value)? paused,
    TResult Function(_Resumed value)? resumed,
    TResult Function(_CharacterLearned value)? characterLearned,
    TResult Function(_CharacterUndone value)? characterUndone,
    TResult Function(_EndSession value)? endSession,
    TResult Function(_Restart value)? restart,
    required TResult orElse(),
  }) {
    if (characterLearned != null) {
      return characterLearned(this);
    }
    return orElse();
  }
}

abstract class _CharacterLearned implements LearningSessionEvent {
  const factory _CharacterLearned(
      {required final String character,
      required final bool isKnown}) = _$CharacterLearnedImpl;

  String get character;
  bool get isKnown;

  /// Create a copy of LearningSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterLearnedImplCopyWith<_$CharacterLearnedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CharacterUndoneImplCopyWith<$Res> {
  factory _$$CharacterUndoneImplCopyWith(_$CharacterUndoneImpl value,
          $Res Function(_$CharacterUndoneImpl) then) =
      __$$CharacterUndoneImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String character});
}

/// @nodoc
class __$$CharacterUndoneImplCopyWithImpl<$Res>
    extends _$LearningSessionEventCopyWithImpl<$Res, _$CharacterUndoneImpl>
    implements _$$CharacterUndoneImplCopyWith<$Res> {
  __$$CharacterUndoneImplCopyWithImpl(
      _$CharacterUndoneImpl _value, $Res Function(_$CharacterUndoneImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? character = null,
  }) {
    return _then(_$CharacterUndoneImpl(
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CharacterUndoneImpl implements _CharacterUndone {
  const _$CharacterUndoneImpl({required this.character});

  @override
  final String character;

  @override
  String toString() {
    return 'LearningSessionEvent.characterUndone(character: $character)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterUndoneImpl &&
            (identical(other.character, character) ||
                other.character == character));
  }

  @override
  int get hashCode => Object.hash(runtimeType, character);

  /// Create a copy of LearningSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterUndoneImplCopyWith<_$CharacterUndoneImpl> get copyWith =>
      __$$CharacterUndoneImplCopyWithImpl<_$CharacterUndoneImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function(String character, bool isKnown) characterLearned,
    required TResult Function(String character) characterUndone,
    required TResult Function() endSession,
    required TResult Function() restart,
  }) {
    return characterUndone(character);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function(String character, bool isKnown)? characterLearned,
    TResult? Function(String character)? characterUndone,
    TResult? Function()? endSession,
    TResult? Function()? restart,
  }) {
    return characterUndone?.call(character);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function(String character, bool isKnown)? characterLearned,
    TResult Function(String character)? characterUndone,
    TResult Function()? endSession,
    TResult Function()? restart,
    required TResult orElse(),
  }) {
    if (characterUndone != null) {
      return characterUndone(character);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Resumed value) resumed,
    required TResult Function(_CharacterLearned value) characterLearned,
    required TResult Function(_CharacterUndone value) characterUndone,
    required TResult Function(_EndSession value) endSession,
    required TResult Function(_Restart value) restart,
  }) {
    return characterUndone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Resumed value)? resumed,
    TResult? Function(_CharacterLearned value)? characterLearned,
    TResult? Function(_CharacterUndone value)? characterUndone,
    TResult? Function(_EndSession value)? endSession,
    TResult? Function(_Restart value)? restart,
  }) {
    return characterUndone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Paused value)? paused,
    TResult Function(_Resumed value)? resumed,
    TResult Function(_CharacterLearned value)? characterLearned,
    TResult Function(_CharacterUndone value)? characterUndone,
    TResult Function(_EndSession value)? endSession,
    TResult Function(_Restart value)? restart,
    required TResult orElse(),
  }) {
    if (characterUndone != null) {
      return characterUndone(this);
    }
    return orElse();
  }
}

abstract class _CharacterUndone implements LearningSessionEvent {
  const factory _CharacterUndone({required final String character}) =
      _$CharacterUndoneImpl;

  String get character;

  /// Create a copy of LearningSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterUndoneImplCopyWith<_$CharacterUndoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EndSessionImplCopyWith<$Res> {
  factory _$$EndSessionImplCopyWith(
          _$EndSessionImpl value, $Res Function(_$EndSessionImpl) then) =
      __$$EndSessionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EndSessionImplCopyWithImpl<$Res>
    extends _$LearningSessionEventCopyWithImpl<$Res, _$EndSessionImpl>
    implements _$$EndSessionImplCopyWith<$Res> {
  __$$EndSessionImplCopyWithImpl(
      _$EndSessionImpl _value, $Res Function(_$EndSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningSessionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EndSessionImpl implements _EndSession {
  const _$EndSessionImpl();

  @override
  String toString() {
    return 'LearningSessionEvent.endSession()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EndSessionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function(String character, bool isKnown) characterLearned,
    required TResult Function(String character) characterUndone,
    required TResult Function() endSession,
    required TResult Function() restart,
  }) {
    return endSession();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function(String character, bool isKnown)? characterLearned,
    TResult? Function(String character)? characterUndone,
    TResult? Function()? endSession,
    TResult? Function()? restart,
  }) {
    return endSession?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function(String character, bool isKnown)? characterLearned,
    TResult Function(String character)? characterUndone,
    TResult Function()? endSession,
    TResult Function()? restart,
    required TResult orElse(),
  }) {
    if (endSession != null) {
      return endSession();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Resumed value) resumed,
    required TResult Function(_CharacterLearned value) characterLearned,
    required TResult Function(_CharacterUndone value) characterUndone,
    required TResult Function(_EndSession value) endSession,
    required TResult Function(_Restart value) restart,
  }) {
    return endSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Resumed value)? resumed,
    TResult? Function(_CharacterLearned value)? characterLearned,
    TResult? Function(_CharacterUndone value)? characterUndone,
    TResult? Function(_EndSession value)? endSession,
    TResult? Function(_Restart value)? restart,
  }) {
    return endSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Paused value)? paused,
    TResult Function(_Resumed value)? resumed,
    TResult Function(_CharacterLearned value)? characterLearned,
    TResult Function(_CharacterUndone value)? characterUndone,
    TResult Function(_EndSession value)? endSession,
    TResult Function(_Restart value)? restart,
    required TResult orElse(),
  }) {
    if (endSession != null) {
      return endSession(this);
    }
    return orElse();
  }
}

abstract class _EndSession implements LearningSessionEvent {
  const factory _EndSession() = _$EndSessionImpl;
}

/// @nodoc
abstract class _$$RestartImplCopyWith<$Res> {
  factory _$$RestartImplCopyWith(
          _$RestartImpl value, $Res Function(_$RestartImpl) then) =
      __$$RestartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RestartImplCopyWithImpl<$Res>
    extends _$LearningSessionEventCopyWithImpl<$Res, _$RestartImpl>
    implements _$$RestartImplCopyWith<$Res> {
  __$$RestartImplCopyWithImpl(
      _$RestartImpl _value, $Res Function(_$RestartImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningSessionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RestartImpl implements _Restart {
  const _$RestartImpl();

  @override
  String toString() {
    return 'LearningSessionEvent.restart()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RestartImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function(String character, bool isKnown) characterLearned,
    required TResult Function(String character) characterUndone,
    required TResult Function() endSession,
    required TResult Function() restart,
  }) {
    return restart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function(String character, bool isKnown)? characterLearned,
    TResult? Function(String character)? characterUndone,
    TResult? Function()? endSession,
    TResult? Function()? restart,
  }) {
    return restart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function(String character, bool isKnown)? characterLearned,
    TResult Function(String character)? characterUndone,
    TResult Function()? endSession,
    TResult Function()? restart,
    required TResult orElse(),
  }) {
    if (restart != null) {
      return restart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Resumed value) resumed,
    required TResult Function(_CharacterLearned value) characterLearned,
    required TResult Function(_CharacterUndone value) characterUndone,
    required TResult Function(_EndSession value) endSession,
    required TResult Function(_Restart value) restart,
  }) {
    return restart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Resumed value)? resumed,
    TResult? Function(_CharacterLearned value)? characterLearned,
    TResult? Function(_CharacterUndone value)? characterUndone,
    TResult? Function(_EndSession value)? endSession,
    TResult? Function(_Restart value)? restart,
  }) {
    return restart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Paused value)? paused,
    TResult Function(_Resumed value)? resumed,
    TResult Function(_CharacterLearned value)? characterLearned,
    TResult Function(_CharacterUndone value)? characterUndone,
    TResult Function(_EndSession value)? endSession,
    TResult Function(_Restart value)? restart,
    required TResult orElse(),
  }) {
    if (restart != null) {
      return restart(this);
    }
    return orElse();
  }
}

abstract class _Restart implements LearningSessionEvent {
  const factory _Restart() = _$RestartImpl;
}

/// @nodoc
mixin _$LearningSessionState {
  LearningPlan get plan => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  Duration get totalStudyTime => throw _privateConstructorUsedError;
  int get charactersLearned => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  List<String> get completedExercises => throw _privateConstructorUsedError;
  List<String> get knownCharacters => throw _privateConstructorUsedError;
  List<String> get unknownCharacters => throw _privateConstructorUsedError;
  List<String> get characters => throw _privateConstructorUsedError;
  DateTime? get lastResumeTime => throw _privateConstructorUsedError;

  /// Create a copy of LearningSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LearningSessionStateCopyWith<LearningSessionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningSessionStateCopyWith<$Res> {
  factory $LearningSessionStateCopyWith(LearningSessionState value,
          $Res Function(LearningSessionState) then) =
      _$LearningSessionStateCopyWithImpl<$Res, LearningSessionState>;
  @useResult
  $Res call(
      {LearningPlan plan,
      DateTime startTime,
      Duration totalStudyTime,
      int charactersLearned,
      bool isActive,
      List<String> completedExercises,
      List<String> knownCharacters,
      List<String> unknownCharacters,
      List<String> characters,
      DateTime? lastResumeTime});

  $LearningPlanCopyWith<$Res> get plan;
}

/// @nodoc
class _$LearningSessionStateCopyWithImpl<$Res,
        $Val extends LearningSessionState>
    implements $LearningSessionStateCopyWith<$Res> {
  _$LearningSessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LearningSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plan = null,
    Object? startTime = null,
    Object? totalStudyTime = null,
    Object? charactersLearned = null,
    Object? isActive = null,
    Object? completedExercises = null,
    Object? knownCharacters = null,
    Object? unknownCharacters = null,
    Object? characters = null,
    Object? lastResumeTime = freezed,
  }) {
    return _then(_value.copyWith(
      plan: null == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as LearningPlan,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalStudyTime: null == totalStudyTime
          ? _value.totalStudyTime
          : totalStudyTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      charactersLearned: null == charactersLearned
          ? _value.charactersLearned
          : charactersLearned // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      completedExercises: null == completedExercises
          ? _value.completedExercises
          : completedExercises // ignore: cast_nullable_to_non_nullable
              as List<String>,
      knownCharacters: null == knownCharacters
          ? _value.knownCharacters
          : knownCharacters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      unknownCharacters: null == unknownCharacters
          ? _value.unknownCharacters
          : unknownCharacters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      characters: null == characters
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastResumeTime: freezed == lastResumeTime
          ? _value.lastResumeTime
          : lastResumeTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of LearningSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LearningPlanCopyWith<$Res> get plan {
    return $LearningPlanCopyWith<$Res>(_value.plan, (value) {
      return _then(_value.copyWith(plan: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LearningSessionStateImplCopyWith<$Res>
    implements $LearningSessionStateCopyWith<$Res> {
  factory _$$LearningSessionStateImplCopyWith(_$LearningSessionStateImpl value,
          $Res Function(_$LearningSessionStateImpl) then) =
      __$$LearningSessionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LearningPlan plan,
      DateTime startTime,
      Duration totalStudyTime,
      int charactersLearned,
      bool isActive,
      List<String> completedExercises,
      List<String> knownCharacters,
      List<String> unknownCharacters,
      List<String> characters,
      DateTime? lastResumeTime});

  @override
  $LearningPlanCopyWith<$Res> get plan;
}

/// @nodoc
class __$$LearningSessionStateImplCopyWithImpl<$Res>
    extends _$LearningSessionStateCopyWithImpl<$Res, _$LearningSessionStateImpl>
    implements _$$LearningSessionStateImplCopyWith<$Res> {
  __$$LearningSessionStateImplCopyWithImpl(_$LearningSessionStateImpl _value,
      $Res Function(_$LearningSessionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plan = null,
    Object? startTime = null,
    Object? totalStudyTime = null,
    Object? charactersLearned = null,
    Object? isActive = null,
    Object? completedExercises = null,
    Object? knownCharacters = null,
    Object? unknownCharacters = null,
    Object? characters = null,
    Object? lastResumeTime = freezed,
  }) {
    return _then(_$LearningSessionStateImpl(
      plan: null == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as LearningPlan,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalStudyTime: null == totalStudyTime
          ? _value.totalStudyTime
          : totalStudyTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      charactersLearned: null == charactersLearned
          ? _value.charactersLearned
          : charactersLearned // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      completedExercises: null == completedExercises
          ? _value._completedExercises
          : completedExercises // ignore: cast_nullable_to_non_nullable
              as List<String>,
      knownCharacters: null == knownCharacters
          ? _value._knownCharacters
          : knownCharacters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      unknownCharacters: null == unknownCharacters
          ? _value._unknownCharacters
          : unknownCharacters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      characters: null == characters
          ? _value._characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastResumeTime: freezed == lastResumeTime
          ? _value.lastResumeTime
          : lastResumeTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$LearningSessionStateImpl implements _LearningSessionState {
  const _$LearningSessionStateImpl(
      {required this.plan,
      required this.startTime,
      required this.totalStudyTime,
      required this.charactersLearned,
      required this.isActive,
      required final List<String> completedExercises,
      required final List<String> knownCharacters,
      required final List<String> unknownCharacters,
      required final List<String> characters,
      this.lastResumeTime})
      : _completedExercises = completedExercises,
        _knownCharacters = knownCharacters,
        _unknownCharacters = unknownCharacters,
        _characters = characters;

  @override
  final LearningPlan plan;
  @override
  final DateTime startTime;
  @override
  final Duration totalStudyTime;
  @override
  final int charactersLearned;
  @override
  final bool isActive;
  final List<String> _completedExercises;
  @override
  List<String> get completedExercises {
    if (_completedExercises is EqualUnmodifiableListView)
      return _completedExercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedExercises);
  }

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

  final List<String> _characters;
  @override
  List<String> get characters {
    if (_characters is EqualUnmodifiableListView) return _characters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characters);
  }

  @override
  final DateTime? lastResumeTime;

  @override
  String toString() {
    return 'LearningSessionState(plan: $plan, startTime: $startTime, totalStudyTime: $totalStudyTime, charactersLearned: $charactersLearned, isActive: $isActive, completedExercises: $completedExercises, knownCharacters: $knownCharacters, unknownCharacters: $unknownCharacters, characters: $characters, lastResumeTime: $lastResumeTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearningSessionStateImpl &&
            (identical(other.plan, plan) || other.plan == plan) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.totalStudyTime, totalStudyTime) ||
                other.totalStudyTime == totalStudyTime) &&
            (identical(other.charactersLearned, charactersLearned) ||
                other.charactersLearned == charactersLearned) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._completedExercises, _completedExercises) &&
            const DeepCollectionEquality()
                .equals(other._knownCharacters, _knownCharacters) &&
            const DeepCollectionEquality()
                .equals(other._unknownCharacters, _unknownCharacters) &&
            const DeepCollectionEquality()
                .equals(other._characters, _characters) &&
            (identical(other.lastResumeTime, lastResumeTime) ||
                other.lastResumeTime == lastResumeTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      plan,
      startTime,
      totalStudyTime,
      charactersLearned,
      isActive,
      const DeepCollectionEquality().hash(_completedExercises),
      const DeepCollectionEquality().hash(_knownCharacters),
      const DeepCollectionEquality().hash(_unknownCharacters),
      const DeepCollectionEquality().hash(_characters),
      lastResumeTime);

  /// Create a copy of LearningSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LearningSessionStateImplCopyWith<_$LearningSessionStateImpl>
      get copyWith =>
          __$$LearningSessionStateImplCopyWithImpl<_$LearningSessionStateImpl>(
              this, _$identity);
}

abstract class _LearningSessionState implements LearningSessionState {
  const factory _LearningSessionState(
      {required final LearningPlan plan,
      required final DateTime startTime,
      required final Duration totalStudyTime,
      required final int charactersLearned,
      required final bool isActive,
      required final List<String> completedExercises,
      required final List<String> knownCharacters,
      required final List<String> unknownCharacters,
      required final List<String> characters,
      final DateTime? lastResumeTime}) = _$LearningSessionStateImpl;

  @override
  LearningPlan get plan;
  @override
  DateTime get startTime;
  @override
  Duration get totalStudyTime;
  @override
  int get charactersLearned;
  @override
  bool get isActive;
  @override
  List<String> get completedExercises;
  @override
  List<String> get knownCharacters;
  @override
  List<String> get unknownCharacters;
  @override
  List<String> get characters;
  @override
  DateTime? get lastResumeTime;

  /// Create a copy of LearningSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LearningSessionStateImplCopyWith<_$LearningSessionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
