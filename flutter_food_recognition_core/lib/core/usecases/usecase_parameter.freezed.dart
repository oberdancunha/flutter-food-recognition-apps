// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'usecase_parameter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UseCaseParameterTearOff {
  const _$UseCaseParameterTearOff();

  UseCaseParameterValue<Type> value<Type>(Type value) {
    return UseCaseParameterValue<Type>(
      value,
    );
  }

  UserCaseParameterNotValue<Type> notValue<Type>() {
    return UserCaseParameterNotValue<Type>();
  }
}

/// @nodoc
const $UseCaseParameter = _$UseCaseParameterTearOff();

/// @nodoc
mixin _$UseCaseParameter<Type> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Type value) value,
    required TResult Function() notValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Type value)? value,
    TResult Function()? notValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Type value)? value,
    TResult Function()? notValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UseCaseParameterValue<Type> value) value,
    required TResult Function(UserCaseParameterNotValue<Type> value) notValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UseCaseParameterValue<Type> value)? value,
    TResult Function(UserCaseParameterNotValue<Type> value)? notValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UseCaseParameterValue<Type> value)? value,
    TResult Function(UserCaseParameterNotValue<Type> value)? notValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UseCaseParameterCopyWith<Type, $Res> {
  factory $UseCaseParameterCopyWith(UseCaseParameter<Type> value,
          $Res Function(UseCaseParameter<Type>) then) =
      _$UseCaseParameterCopyWithImpl<Type, $Res>;
}

/// @nodoc
class _$UseCaseParameterCopyWithImpl<Type, $Res>
    implements $UseCaseParameterCopyWith<Type, $Res> {
  _$UseCaseParameterCopyWithImpl(this._value, this._then);

  final UseCaseParameter<Type> _value;
  // ignore: unused_field
  final $Res Function(UseCaseParameter<Type>) _then;
}

/// @nodoc
abstract class $UseCaseParameterValueCopyWith<Type, $Res> {
  factory $UseCaseParameterValueCopyWith(UseCaseParameterValue<Type> value,
          $Res Function(UseCaseParameterValue<Type>) then) =
      _$UseCaseParameterValueCopyWithImpl<Type, $Res>;
  $Res call({Type value});
}

/// @nodoc
class _$UseCaseParameterValueCopyWithImpl<Type, $Res>
    extends _$UseCaseParameterCopyWithImpl<Type, $Res>
    implements $UseCaseParameterValueCopyWith<Type, $Res> {
  _$UseCaseParameterValueCopyWithImpl(UseCaseParameterValue<Type> _value,
      $Res Function(UseCaseParameterValue<Type>) _then)
      : super(_value, (v) => _then(v as UseCaseParameterValue<Type>));

  @override
  UseCaseParameterValue<Type> get _value =>
      super._value as UseCaseParameterValue<Type>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(UseCaseParameterValue<Type>(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Type,
    ));
  }
}

/// @nodoc

class _$UseCaseParameterValue<Type> implements UseCaseParameterValue<Type> {
  const _$UseCaseParameterValue(this.value);

  @override
  final Type value;

  @override
  String toString() {
    return 'UseCaseParameter<$Type>.value(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UseCaseParameterValue<Type> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  $UseCaseParameterValueCopyWith<Type, UseCaseParameterValue<Type>>
      get copyWith => _$UseCaseParameterValueCopyWithImpl<Type,
          UseCaseParameterValue<Type>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Type value) value,
    required TResult Function() notValue,
  }) {
    return value(this.value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Type value)? value,
    TResult Function()? notValue,
  }) {
    return value?.call(this.value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Type value)? value,
    TResult Function()? notValue,
    required TResult orElse(),
  }) {
    if (value != null) {
      return value(this.value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UseCaseParameterValue<Type> value) value,
    required TResult Function(UserCaseParameterNotValue<Type> value) notValue,
  }) {
    return value(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UseCaseParameterValue<Type> value)? value,
    TResult Function(UserCaseParameterNotValue<Type> value)? notValue,
  }) {
    return value?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UseCaseParameterValue<Type> value)? value,
    TResult Function(UserCaseParameterNotValue<Type> value)? notValue,
    required TResult orElse(),
  }) {
    if (value != null) {
      return value(this);
    }
    return orElse();
  }
}

abstract class UseCaseParameterValue<Type> implements UseCaseParameter<Type> {
  const factory UseCaseParameterValue(Type value) =
      _$UseCaseParameterValue<Type>;

  Type get value;
  @JsonKey(ignore: true)
  $UseCaseParameterValueCopyWith<Type, UseCaseParameterValue<Type>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCaseParameterNotValueCopyWith<Type, $Res> {
  factory $UserCaseParameterNotValueCopyWith(
          UserCaseParameterNotValue<Type> value,
          $Res Function(UserCaseParameterNotValue<Type>) then) =
      _$UserCaseParameterNotValueCopyWithImpl<Type, $Res>;
}

/// @nodoc
class _$UserCaseParameterNotValueCopyWithImpl<Type, $Res>
    extends _$UseCaseParameterCopyWithImpl<Type, $Res>
    implements $UserCaseParameterNotValueCopyWith<Type, $Res> {
  _$UserCaseParameterNotValueCopyWithImpl(
      UserCaseParameterNotValue<Type> _value,
      $Res Function(UserCaseParameterNotValue<Type>) _then)
      : super(_value, (v) => _then(v as UserCaseParameterNotValue<Type>));

  @override
  UserCaseParameterNotValue<Type> get _value =>
      super._value as UserCaseParameterNotValue<Type>;
}

/// @nodoc

class _$UserCaseParameterNotValue<Type>
    implements UserCaseParameterNotValue<Type> {
  const _$UserCaseParameterNotValue();

  @override
  String toString() {
    return 'UseCaseParameter<$Type>.notValue()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserCaseParameterNotValue<Type>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Type value) value,
    required TResult Function() notValue,
  }) {
    return notValue();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Type value)? value,
    TResult Function()? notValue,
  }) {
    return notValue?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Type value)? value,
    TResult Function()? notValue,
    required TResult orElse(),
  }) {
    if (notValue != null) {
      return notValue();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UseCaseParameterValue<Type> value) value,
    required TResult Function(UserCaseParameterNotValue<Type> value) notValue,
  }) {
    return notValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UseCaseParameterValue<Type> value)? value,
    TResult Function(UserCaseParameterNotValue<Type> value)? notValue,
  }) {
    return notValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UseCaseParameterValue<Type> value)? value,
    TResult Function(UserCaseParameterNotValue<Type> value)? notValue,
    required TResult orElse(),
  }) {
    if (notValue != null) {
      return notValue(this);
    }
    return orElse();
  }
}

abstract class UserCaseParameterNotValue<Type>
    implements UseCaseParameter<Type> {
  const factory UserCaseParameterNotValue() = _$UserCaseParameterNotValue<Type>;
}
