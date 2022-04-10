// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'locale_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocaleState _$LocaleStateFromJson(Map<String, dynamic> json) {
  return _LocaleState.fromJson(json);
}

/// @nodoc
class _$LocaleStateTearOff {
  const _$LocaleStateTearOff();

  _LocaleState call(
      {@LocaleJsonConverter() @JsonKey() Locale locale = fallbackLocale}) {
    return _LocaleState(
      locale: locale,
    );
  }

  LocaleState fromJson(Map<String, Object?> json) {
    return LocaleState.fromJson(json);
  }
}

/// @nodoc
const $LocaleState = _$LocaleStateTearOff();

/// @nodoc
mixin _$LocaleState {
  @LocaleJsonConverter()
  @JsonKey()
  Locale get locale => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocaleStateCopyWith<LocaleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocaleStateCopyWith<$Res> {
  factory $LocaleStateCopyWith(
          LocaleState value, $Res Function(LocaleState) then) =
      _$LocaleStateCopyWithImpl<$Res>;
  $Res call({@LocaleJsonConverter() @JsonKey() Locale locale});
}

/// @nodoc
class _$LocaleStateCopyWithImpl<$Res> implements $LocaleStateCopyWith<$Res> {
  _$LocaleStateCopyWithImpl(this._value, this._then);

  final LocaleState _value;
  // ignore: unused_field
  final $Res Function(LocaleState) _then;

  @override
  $Res call({
    Object? locale = freezed,
  }) {
    return _then(_value.copyWith(
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc
abstract class _$LocaleStateCopyWith<$Res>
    implements $LocaleStateCopyWith<$Res> {
  factory _$LocaleStateCopyWith(
          _LocaleState value, $Res Function(_LocaleState) then) =
      __$LocaleStateCopyWithImpl<$Res>;
  @override
  $Res call({@LocaleJsonConverter() @JsonKey() Locale locale});
}

/// @nodoc
class __$LocaleStateCopyWithImpl<$Res> extends _$LocaleStateCopyWithImpl<$Res>
    implements _$LocaleStateCopyWith<$Res> {
  __$LocaleStateCopyWithImpl(
      _LocaleState _value, $Res Function(_LocaleState) _then)
      : super(_value, (v) => _then(v as _LocaleState));

  @override
  _LocaleState get _value => super._value as _LocaleState;

  @override
  $Res call({
    Object? locale = freezed,
  }) {
    return _then(_LocaleState(
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocaleState extends _LocaleState {
  const _$_LocaleState(
      {@LocaleJsonConverter() @JsonKey() this.locale = fallbackLocale})
      : super._();

  factory _$_LocaleState.fromJson(Map<String, dynamic> json) =>
      _$$_LocaleStateFromJson(json);

  @override
  @LocaleJsonConverter()
  @JsonKey()
  final Locale locale;

  @override
  String toString() {
    return 'LocaleState(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocaleState &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  _$LocaleStateCopyWith<_LocaleState> get copyWith =>
      __$LocaleStateCopyWithImpl<_LocaleState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocaleStateToJson(this);
  }
}

abstract class _LocaleState extends LocaleState {
  const factory _LocaleState(
      {@LocaleJsonConverter() @JsonKey() Locale locale}) = _$_LocaleState;
  const _LocaleState._() : super._();

  factory _LocaleState.fromJson(Map<String, dynamic> json) =
      _$_LocaleState.fromJson;

  @override
  @LocaleJsonConverter()
  @JsonKey()
  Locale get locale;
  @override
  @JsonKey(ignore: true)
  _$LocaleStateCopyWith<_LocaleState> get copyWith =>
      throw _privateConstructorUsedError;
}
