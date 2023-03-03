// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of settings;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingsAccountEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInWithGoogle,
    required TResult Function() signInWithApple,
    required TResult Function(String providerId) unlink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signInWithGoogle,
    TResult? Function()? signInWithApple,
    TResult? Function(String providerId)? unlink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function(String providerId)? unlink,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SettingsConnectGoogle value) signInWithGoogle,
    required TResult Function(_SettingsConnectApple value) signInWithApple,
    required TResult Function(_SettingsUnlink value) unlink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SettingsConnectGoogle value)? signInWithGoogle,
    TResult? Function(_SettingsConnectApple value)? signInWithApple,
    TResult? Function(_SettingsUnlink value)? unlink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SettingsConnectGoogle value)? signInWithGoogle,
    TResult Function(_SettingsConnectApple value)? signInWithApple,
    TResult Function(_SettingsUnlink value)? unlink,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsAccountEventCopyWith<$Res> {
  factory $SettingsAccountEventCopyWith(SettingsAccountEvent value,
          $Res Function(SettingsAccountEvent) then) =
      _$SettingsAccountEventCopyWithImpl<$Res, SettingsAccountEvent>;
}

/// @nodoc
class _$SettingsAccountEventCopyWithImpl<$Res,
        $Val extends SettingsAccountEvent>
    implements $SettingsAccountEventCopyWith<$Res> {
  _$SettingsAccountEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SettingsConnectGoogleCopyWith<$Res> {
  factory _$$_SettingsConnectGoogleCopyWith(_$_SettingsConnectGoogle value,
          $Res Function(_$_SettingsConnectGoogle) then) =
      __$$_SettingsConnectGoogleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SettingsConnectGoogleCopyWithImpl<$Res>
    extends _$SettingsAccountEventCopyWithImpl<$Res, _$_SettingsConnectGoogle>
    implements _$$_SettingsConnectGoogleCopyWith<$Res> {
  __$$_SettingsConnectGoogleCopyWithImpl(_$_SettingsConnectGoogle _value,
      $Res Function(_$_SettingsConnectGoogle) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SettingsConnectGoogle implements _SettingsConnectGoogle {
  const _$_SettingsConnectGoogle();

  @override
  String toString() {
    return 'SettingsAccountEvent.signInWithGoogle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SettingsConnectGoogle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInWithGoogle,
    required TResult Function() signInWithApple,
    required TResult Function(String providerId) unlink,
  }) {
    return signInWithGoogle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signInWithGoogle,
    TResult? Function()? signInWithApple,
    TResult? Function(String providerId)? unlink,
  }) {
    return signInWithGoogle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function(String providerId)? unlink,
    required TResult orElse(),
  }) {
    if (signInWithGoogle != null) {
      return signInWithGoogle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SettingsConnectGoogle value) signInWithGoogle,
    required TResult Function(_SettingsConnectApple value) signInWithApple,
    required TResult Function(_SettingsUnlink value) unlink,
  }) {
    return signInWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SettingsConnectGoogle value)? signInWithGoogle,
    TResult? Function(_SettingsConnectApple value)? signInWithApple,
    TResult? Function(_SettingsUnlink value)? unlink,
  }) {
    return signInWithGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SettingsConnectGoogle value)? signInWithGoogle,
    TResult Function(_SettingsConnectApple value)? signInWithApple,
    TResult Function(_SettingsUnlink value)? unlink,
    required TResult orElse(),
  }) {
    if (signInWithGoogle != null) {
      return signInWithGoogle(this);
    }
    return orElse();
  }
}

abstract class _SettingsConnectGoogle implements SettingsAccountEvent {
  const factory _SettingsConnectGoogle() = _$_SettingsConnectGoogle;
}

/// @nodoc
abstract class _$$_SettingsConnectAppleCopyWith<$Res> {
  factory _$$_SettingsConnectAppleCopyWith(_$_SettingsConnectApple value,
          $Res Function(_$_SettingsConnectApple) then) =
      __$$_SettingsConnectAppleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SettingsConnectAppleCopyWithImpl<$Res>
    extends _$SettingsAccountEventCopyWithImpl<$Res, _$_SettingsConnectApple>
    implements _$$_SettingsConnectAppleCopyWith<$Res> {
  __$$_SettingsConnectAppleCopyWithImpl(_$_SettingsConnectApple _value,
      $Res Function(_$_SettingsConnectApple) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SettingsConnectApple implements _SettingsConnectApple {
  const _$_SettingsConnectApple();

  @override
  String toString() {
    return 'SettingsAccountEvent.signInWithApple()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SettingsConnectApple);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInWithGoogle,
    required TResult Function() signInWithApple,
    required TResult Function(String providerId) unlink,
  }) {
    return signInWithApple();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signInWithGoogle,
    TResult? Function()? signInWithApple,
    TResult? Function(String providerId)? unlink,
  }) {
    return signInWithApple?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function(String providerId)? unlink,
    required TResult orElse(),
  }) {
    if (signInWithApple != null) {
      return signInWithApple();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SettingsConnectGoogle value) signInWithGoogle,
    required TResult Function(_SettingsConnectApple value) signInWithApple,
    required TResult Function(_SettingsUnlink value) unlink,
  }) {
    return signInWithApple(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SettingsConnectGoogle value)? signInWithGoogle,
    TResult? Function(_SettingsConnectApple value)? signInWithApple,
    TResult? Function(_SettingsUnlink value)? unlink,
  }) {
    return signInWithApple?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SettingsConnectGoogle value)? signInWithGoogle,
    TResult Function(_SettingsConnectApple value)? signInWithApple,
    TResult Function(_SettingsUnlink value)? unlink,
    required TResult orElse(),
  }) {
    if (signInWithApple != null) {
      return signInWithApple(this);
    }
    return orElse();
  }
}

abstract class _SettingsConnectApple implements SettingsAccountEvent {
  const factory _SettingsConnectApple() = _$_SettingsConnectApple;
}

/// @nodoc
abstract class _$$_SettingsUnlinkCopyWith<$Res> {
  factory _$$_SettingsUnlinkCopyWith(
          _$_SettingsUnlink value, $Res Function(_$_SettingsUnlink) then) =
      __$$_SettingsUnlinkCopyWithImpl<$Res>;
  @useResult
  $Res call({String providerId});
}

/// @nodoc
class __$$_SettingsUnlinkCopyWithImpl<$Res>
    extends _$SettingsAccountEventCopyWithImpl<$Res, _$_SettingsUnlink>
    implements _$$_SettingsUnlinkCopyWith<$Res> {
  __$$_SettingsUnlinkCopyWithImpl(
      _$_SettingsUnlink _value, $Res Function(_$_SettingsUnlink) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providerId = null,
  }) {
    return _then(_$_SettingsUnlink(
      null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SettingsUnlink implements _SettingsUnlink {
  const _$_SettingsUnlink(this.providerId);

  @override
  final String providerId;

  @override
  String toString() {
    return 'SettingsAccountEvent.unlink(providerId: $providerId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsUnlink &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, providerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsUnlinkCopyWith<_$_SettingsUnlink> get copyWith =>
      __$$_SettingsUnlinkCopyWithImpl<_$_SettingsUnlink>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInWithGoogle,
    required TResult Function() signInWithApple,
    required TResult Function(String providerId) unlink,
  }) {
    return unlink(providerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signInWithGoogle,
    TResult? Function()? signInWithApple,
    TResult? Function(String providerId)? unlink,
  }) {
    return unlink?.call(providerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function(String providerId)? unlink,
    required TResult orElse(),
  }) {
    if (unlink != null) {
      return unlink(providerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SettingsConnectGoogle value) signInWithGoogle,
    required TResult Function(_SettingsConnectApple value) signInWithApple,
    required TResult Function(_SettingsUnlink value) unlink,
  }) {
    return unlink(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SettingsConnectGoogle value)? signInWithGoogle,
    TResult? Function(_SettingsConnectApple value)? signInWithApple,
    TResult? Function(_SettingsUnlink value)? unlink,
  }) {
    return unlink?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SettingsConnectGoogle value)? signInWithGoogle,
    TResult Function(_SettingsConnectApple value)? signInWithApple,
    TResult Function(_SettingsUnlink value)? unlink,
    required TResult orElse(),
  }) {
    if (unlink != null) {
      return unlink(this);
    }
    return orElse();
  }
}

abstract class _SettingsUnlink implements SettingsAccountEvent {
  const factory _SettingsUnlink(final String providerId) = _$_SettingsUnlink;

  String get providerId;
  @JsonKey(ignore: true)
  _$$_SettingsUnlinkCopyWith<_$_SettingsUnlink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SettingsDeleteState {
  bool get canSubmit => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsDeleteStateCopyWith<SettingsDeleteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsDeleteStateCopyWith<$Res> {
  factory $SettingsDeleteStateCopyWith(
          SettingsDeleteState value, $Res Function(SettingsDeleteState) then) =
      _$SettingsDeleteStateCopyWithImpl<$Res, SettingsDeleteState>;
  @useResult
  $Res call(
      {bool canSubmit, bool isLoading, bool isSuccess, String? errorText});
}

/// @nodoc
class _$SettingsDeleteStateCopyWithImpl<$Res, $Val extends SettingsDeleteState>
    implements $SettingsDeleteStateCopyWith<$Res> {
  _$SettingsDeleteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canSubmit = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? errorText = freezed,
  }) {
    return _then(_value.copyWith(
      canSubmit: null == canSubmit
          ? _value.canSubmit
          : canSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingsDeleteStateCopyWith<$Res>
    implements $SettingsDeleteStateCopyWith<$Res> {
  factory _$$_SettingsDeleteStateCopyWith(_$_SettingsDeleteState value,
          $Res Function(_$_SettingsDeleteState) then) =
      __$$_SettingsDeleteStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool canSubmit, bool isLoading, bool isSuccess, String? errorText});
}

/// @nodoc
class __$$_SettingsDeleteStateCopyWithImpl<$Res>
    extends _$SettingsDeleteStateCopyWithImpl<$Res, _$_SettingsDeleteState>
    implements _$$_SettingsDeleteStateCopyWith<$Res> {
  __$$_SettingsDeleteStateCopyWithImpl(_$_SettingsDeleteState _value,
      $Res Function(_$_SettingsDeleteState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canSubmit = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? errorText = freezed,
  }) {
    return _then(_$_SettingsDeleteState(
      canSubmit: null == canSubmit
          ? _value.canSubmit
          : canSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SettingsDeleteState implements _SettingsDeleteState {
  const _$_SettingsDeleteState(
      {this.canSubmit = false,
      this.isLoading = false,
      this.isSuccess = false,
      this.errorText});

  @override
  @JsonKey()
  final bool canSubmit;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  final String? errorText;

  @override
  String toString() {
    return 'SettingsDeleteState(canSubmit: $canSubmit, isLoading: $isLoading, isSuccess: $isSuccess, errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsDeleteState &&
            (identical(other.canSubmit, canSubmit) ||
                other.canSubmit == canSubmit) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, canSubmit, isLoading, isSuccess, errorText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsDeleteStateCopyWith<_$_SettingsDeleteState> get copyWith =>
      __$$_SettingsDeleteStateCopyWithImpl<_$_SettingsDeleteState>(
          this, _$identity);
}

abstract class _SettingsDeleteState implements SettingsDeleteState {
  const factory _SettingsDeleteState(
      {final bool canSubmit,
      final bool isLoading,
      final bool isSuccess,
      final String? errorText}) = _$_SettingsDeleteState;

  @override
  bool get canSubmit;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  String? get errorText;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsDeleteStateCopyWith<_$_SettingsDeleteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SettingsEmailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function() submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function()? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function()? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SettingsEmailChanged value) emailChanged,
    required TResult Function(_SettingsEmailSubmit value) submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SettingsEmailChanged value)? emailChanged,
    TResult? Function(_SettingsEmailSubmit value)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SettingsEmailChanged value)? emailChanged,
    TResult Function(_SettingsEmailSubmit value)? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEmailEventCopyWith<$Res> {
  factory $SettingsEmailEventCopyWith(
          SettingsEmailEvent value, $Res Function(SettingsEmailEvent) then) =
      _$SettingsEmailEventCopyWithImpl<$Res, SettingsEmailEvent>;
}

/// @nodoc
class _$SettingsEmailEventCopyWithImpl<$Res, $Val extends SettingsEmailEvent>
    implements $SettingsEmailEventCopyWith<$Res> {
  _$SettingsEmailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SettingsEmailChangedCopyWith<$Res> {
  factory _$$_SettingsEmailChangedCopyWith(_$_SettingsEmailChanged value,
          $Res Function(_$_SettingsEmailChanged) then) =
      __$$_SettingsEmailChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$_SettingsEmailChangedCopyWithImpl<$Res>
    extends _$SettingsEmailEventCopyWithImpl<$Res, _$_SettingsEmailChanged>
    implements _$$_SettingsEmailChangedCopyWith<$Res> {
  __$$_SettingsEmailChangedCopyWithImpl(_$_SettingsEmailChanged _value,
      $Res Function(_$_SettingsEmailChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$_SettingsEmailChanged(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SettingsEmailChanged implements _SettingsEmailChanged {
  const _$_SettingsEmailChanged(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'SettingsEmailEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsEmailChanged &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsEmailChangedCopyWith<_$_SettingsEmailChanged> get copyWith =>
      __$$_SettingsEmailChangedCopyWithImpl<_$_SettingsEmailChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function() submit,
  }) {
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function()? submit,
  }) {
    return emailChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function()? submit,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SettingsEmailChanged value) emailChanged,
    required TResult Function(_SettingsEmailSubmit value) submit,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SettingsEmailChanged value)? emailChanged,
    TResult? Function(_SettingsEmailSubmit value)? submit,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SettingsEmailChanged value)? emailChanged,
    TResult Function(_SettingsEmailSubmit value)? submit,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class _SettingsEmailChanged implements SettingsEmailEvent {
  const factory _SettingsEmailChanged(final String email) =
      _$_SettingsEmailChanged;

  String get email;
  @JsonKey(ignore: true)
  _$$_SettingsEmailChangedCopyWith<_$_SettingsEmailChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SettingsEmailSubmitCopyWith<$Res> {
  factory _$$_SettingsEmailSubmitCopyWith(_$_SettingsEmailSubmit value,
          $Res Function(_$_SettingsEmailSubmit) then) =
      __$$_SettingsEmailSubmitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SettingsEmailSubmitCopyWithImpl<$Res>
    extends _$SettingsEmailEventCopyWithImpl<$Res, _$_SettingsEmailSubmit>
    implements _$$_SettingsEmailSubmitCopyWith<$Res> {
  __$$_SettingsEmailSubmitCopyWithImpl(_$_SettingsEmailSubmit _value,
      $Res Function(_$_SettingsEmailSubmit) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SettingsEmailSubmit implements _SettingsEmailSubmit {
  const _$_SettingsEmailSubmit();

  @override
  String toString() {
    return 'SettingsEmailEvent.submit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SettingsEmailSubmit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function() submit,
  }) {
    return submit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function()? submit,
  }) {
    return submit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function()? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SettingsEmailChanged value) emailChanged,
    required TResult Function(_SettingsEmailSubmit value) submit,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SettingsEmailChanged value)? emailChanged,
    TResult? Function(_SettingsEmailSubmit value)? submit,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SettingsEmailChanged value)? emailChanged,
    TResult Function(_SettingsEmailSubmit value)? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _SettingsEmailSubmit implements SettingsEmailEvent {
  const factory _SettingsEmailSubmit() = _$_SettingsEmailSubmit;
}

/// @nodoc
mixin _$SettingsEmailState {
  String get email => throw _privateConstructorUsedError;
  bool get canSubmit => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsEmailStateCopyWith<SettingsEmailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEmailStateCopyWith<$Res> {
  factory $SettingsEmailStateCopyWith(
          SettingsEmailState value, $Res Function(SettingsEmailState) then) =
      _$SettingsEmailStateCopyWithImpl<$Res, SettingsEmailState>;
  @useResult
  $Res call(
      {String email,
      bool canSubmit,
      bool isLoading,
      bool isSuccess,
      String? errorText});
}

/// @nodoc
class _$SettingsEmailStateCopyWithImpl<$Res, $Val extends SettingsEmailState>
    implements $SettingsEmailStateCopyWith<$Res> {
  _$SettingsEmailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? canSubmit = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? errorText = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      canSubmit: null == canSubmit
          ? _value.canSubmit
          : canSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingsEmailStateCopyWith<$Res>
    implements $SettingsEmailStateCopyWith<$Res> {
  factory _$$_SettingsEmailStateCopyWith(_$_SettingsEmailState value,
          $Res Function(_$_SettingsEmailState) then) =
      __$$_SettingsEmailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      bool canSubmit,
      bool isLoading,
      bool isSuccess,
      String? errorText});
}

/// @nodoc
class __$$_SettingsEmailStateCopyWithImpl<$Res>
    extends _$SettingsEmailStateCopyWithImpl<$Res, _$_SettingsEmailState>
    implements _$$_SettingsEmailStateCopyWith<$Res> {
  __$$_SettingsEmailStateCopyWithImpl(
      _$_SettingsEmailState _value, $Res Function(_$_SettingsEmailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? canSubmit = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? errorText = freezed,
  }) {
    return _then(_$_SettingsEmailState(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      canSubmit: null == canSubmit
          ? _value.canSubmit
          : canSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SettingsEmailState implements _SettingsEmailState {
  const _$_SettingsEmailState(
      {this.email = "",
      this.canSubmit = false,
      this.isLoading = false,
      this.isSuccess = false,
      this.errorText});

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final bool canSubmit;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  final String? errorText;

  @override
  String toString() {
    return 'SettingsEmailState(email: $email, canSubmit: $canSubmit, isLoading: $isLoading, isSuccess: $isSuccess, errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsEmailState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.canSubmit, canSubmit) ||
                other.canSubmit == canSubmit) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, email, canSubmit, isLoading, isSuccess, errorText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsEmailStateCopyWith<_$_SettingsEmailState> get copyWith =>
      __$$_SettingsEmailStateCopyWithImpl<_$_SettingsEmailState>(
          this, _$identity);
}

abstract class _SettingsEmailState implements SettingsEmailState {
  const factory _SettingsEmailState(
      {final String email,
      final bool canSubmit,
      final bool isLoading,
      final bool isSuccess,
      final String? errorText}) = _$_SettingsEmailState;

  @override
  String get email;
  @override
  bool get canSubmit;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  String? get errorText;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsEmailStateCopyWith<_$_SettingsEmailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SettingsPasswordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String password) passwordChanged,
    required TResult Function(String password) passwordConfirmationChanged,
    required TResult Function() submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String password)? passwordConfirmationChanged,
    TResult? Function()? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String password)? passwordChanged,
    TResult Function(String password)? passwordConfirmationChanged,
    TResult Function()? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SettingsPasswordChanged value) passwordChanged,
    required TResult Function(_SettingsPasswordConfirmationChanged value)
        passwordConfirmationChanged,
    required TResult Function(_SettingsPasswordSubmit value) submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SettingsPasswordChanged value)? passwordChanged,
    TResult? Function(_SettingsPasswordConfirmationChanged value)?
        passwordConfirmationChanged,
    TResult? Function(_SettingsPasswordSubmit value)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SettingsPasswordChanged value)? passwordChanged,
    TResult Function(_SettingsPasswordConfirmationChanged value)?
        passwordConfirmationChanged,
    TResult Function(_SettingsPasswordSubmit value)? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsPasswordEventCopyWith<$Res> {
  factory $SettingsPasswordEventCopyWith(SettingsPasswordEvent value,
          $Res Function(SettingsPasswordEvent) then) =
      _$SettingsPasswordEventCopyWithImpl<$Res, SettingsPasswordEvent>;
}

/// @nodoc
class _$SettingsPasswordEventCopyWithImpl<$Res,
        $Val extends SettingsPasswordEvent>
    implements $SettingsPasswordEventCopyWith<$Res> {
  _$SettingsPasswordEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SettingsPasswordChangedCopyWith<$Res> {
  factory _$$_SettingsPasswordChangedCopyWith(_$_SettingsPasswordChanged value,
          $Res Function(_$_SettingsPasswordChanged) then) =
      __$$_SettingsPasswordChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$_SettingsPasswordChangedCopyWithImpl<$Res>
    extends _$SettingsPasswordEventCopyWithImpl<$Res,
        _$_SettingsPasswordChanged>
    implements _$$_SettingsPasswordChangedCopyWith<$Res> {
  __$$_SettingsPasswordChangedCopyWithImpl(_$_SettingsPasswordChanged _value,
      $Res Function(_$_SettingsPasswordChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$_SettingsPasswordChanged(
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SettingsPasswordChanged implements _SettingsPasswordChanged {
  const _$_SettingsPasswordChanged(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'SettingsPasswordEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsPasswordChanged &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsPasswordChangedCopyWith<_$_SettingsPasswordChanged>
      get copyWith =>
          __$$_SettingsPasswordChangedCopyWithImpl<_$_SettingsPasswordChanged>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String password) passwordChanged,
    required TResult Function(String password) passwordConfirmationChanged,
    required TResult Function() submit,
  }) {
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String password)? passwordConfirmationChanged,
    TResult? Function()? submit,
  }) {
    return passwordChanged?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String password)? passwordChanged,
    TResult Function(String password)? passwordConfirmationChanged,
    TResult Function()? submit,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SettingsPasswordChanged value) passwordChanged,
    required TResult Function(_SettingsPasswordConfirmationChanged value)
        passwordConfirmationChanged,
    required TResult Function(_SettingsPasswordSubmit value) submit,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SettingsPasswordChanged value)? passwordChanged,
    TResult? Function(_SettingsPasswordConfirmationChanged value)?
        passwordConfirmationChanged,
    TResult? Function(_SettingsPasswordSubmit value)? submit,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SettingsPasswordChanged value)? passwordChanged,
    TResult Function(_SettingsPasswordConfirmationChanged value)?
        passwordConfirmationChanged,
    TResult Function(_SettingsPasswordSubmit value)? submit,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class _SettingsPasswordChanged implements SettingsPasswordEvent {
  const factory _SettingsPasswordChanged(final String password) =
      _$_SettingsPasswordChanged;

  String get password;
  @JsonKey(ignore: true)
  _$$_SettingsPasswordChangedCopyWith<_$_SettingsPasswordChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SettingsPasswordConfirmationChangedCopyWith<$Res> {
  factory _$$_SettingsPasswordConfirmationChangedCopyWith(
          _$_SettingsPasswordConfirmationChanged value,
          $Res Function(_$_SettingsPasswordConfirmationChanged) then) =
      __$$_SettingsPasswordConfirmationChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$_SettingsPasswordConfirmationChangedCopyWithImpl<$Res>
    extends _$SettingsPasswordEventCopyWithImpl<$Res,
        _$_SettingsPasswordConfirmationChanged>
    implements _$$_SettingsPasswordConfirmationChangedCopyWith<$Res> {
  __$$_SettingsPasswordConfirmationChangedCopyWithImpl(
      _$_SettingsPasswordConfirmationChanged _value,
      $Res Function(_$_SettingsPasswordConfirmationChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$_SettingsPasswordConfirmationChanged(
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SettingsPasswordConfirmationChanged
    implements _SettingsPasswordConfirmationChanged {
  const _$_SettingsPasswordConfirmationChanged(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'SettingsPasswordEvent.passwordConfirmationChanged(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsPasswordConfirmationChanged &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsPasswordConfirmationChangedCopyWith<
          _$_SettingsPasswordConfirmationChanged>
      get copyWith => __$$_SettingsPasswordConfirmationChangedCopyWithImpl<
          _$_SettingsPasswordConfirmationChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String password) passwordChanged,
    required TResult Function(String password) passwordConfirmationChanged,
    required TResult Function() submit,
  }) {
    return passwordConfirmationChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String password)? passwordConfirmationChanged,
    TResult? Function()? submit,
  }) {
    return passwordConfirmationChanged?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String password)? passwordChanged,
    TResult Function(String password)? passwordConfirmationChanged,
    TResult Function()? submit,
    required TResult orElse(),
  }) {
    if (passwordConfirmationChanged != null) {
      return passwordConfirmationChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SettingsPasswordChanged value) passwordChanged,
    required TResult Function(_SettingsPasswordConfirmationChanged value)
        passwordConfirmationChanged,
    required TResult Function(_SettingsPasswordSubmit value) submit,
  }) {
    return passwordConfirmationChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SettingsPasswordChanged value)? passwordChanged,
    TResult? Function(_SettingsPasswordConfirmationChanged value)?
        passwordConfirmationChanged,
    TResult? Function(_SettingsPasswordSubmit value)? submit,
  }) {
    return passwordConfirmationChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SettingsPasswordChanged value)? passwordChanged,
    TResult Function(_SettingsPasswordConfirmationChanged value)?
        passwordConfirmationChanged,
    TResult Function(_SettingsPasswordSubmit value)? submit,
    required TResult orElse(),
  }) {
    if (passwordConfirmationChanged != null) {
      return passwordConfirmationChanged(this);
    }
    return orElse();
  }
}

abstract class _SettingsPasswordConfirmationChanged
    implements SettingsPasswordEvent {
  const factory _SettingsPasswordConfirmationChanged(final String password) =
      _$_SettingsPasswordConfirmationChanged;

  String get password;
  @JsonKey(ignore: true)
  _$$_SettingsPasswordConfirmationChangedCopyWith<
          _$_SettingsPasswordConfirmationChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SettingsPasswordSubmitCopyWith<$Res> {
  factory _$$_SettingsPasswordSubmitCopyWith(_$_SettingsPasswordSubmit value,
          $Res Function(_$_SettingsPasswordSubmit) then) =
      __$$_SettingsPasswordSubmitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SettingsPasswordSubmitCopyWithImpl<$Res>
    extends _$SettingsPasswordEventCopyWithImpl<$Res, _$_SettingsPasswordSubmit>
    implements _$$_SettingsPasswordSubmitCopyWith<$Res> {
  __$$_SettingsPasswordSubmitCopyWithImpl(_$_SettingsPasswordSubmit _value,
      $Res Function(_$_SettingsPasswordSubmit) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SettingsPasswordSubmit implements _SettingsPasswordSubmit {
  const _$_SettingsPasswordSubmit();

  @override
  String toString() {
    return 'SettingsPasswordEvent.submit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsPasswordSubmit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String password) passwordChanged,
    required TResult Function(String password) passwordConfirmationChanged,
    required TResult Function() submit,
  }) {
    return submit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String password)? passwordConfirmationChanged,
    TResult? Function()? submit,
  }) {
    return submit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String password)? passwordChanged,
    TResult Function(String password)? passwordConfirmationChanged,
    TResult Function()? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SettingsPasswordChanged value) passwordChanged,
    required TResult Function(_SettingsPasswordConfirmationChanged value)
        passwordConfirmationChanged,
    required TResult Function(_SettingsPasswordSubmit value) submit,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SettingsPasswordChanged value)? passwordChanged,
    TResult? Function(_SettingsPasswordConfirmationChanged value)?
        passwordConfirmationChanged,
    TResult? Function(_SettingsPasswordSubmit value)? submit,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SettingsPasswordChanged value)? passwordChanged,
    TResult Function(_SettingsPasswordConfirmationChanged value)?
        passwordConfirmationChanged,
    TResult Function(_SettingsPasswordSubmit value)? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _SettingsPasswordSubmit implements SettingsPasswordEvent {
  const factory _SettingsPasswordSubmit() = _$_SettingsPasswordSubmit;
}

/// @nodoc
mixin _$SettingsPasswordState {
  String get password => throw _privateConstructorUsedError;
  String get passwordConfirmation => throw _privateConstructorUsedError;
  bool get passwordHasMinLength => throw _privateConstructorUsedError;
  bool get passwordHasUppercase => throw _privateConstructorUsedError;
  bool get passwordHasLowercase => throw _privateConstructorUsedError;
  bool get passwordHasDigits => throw _privateConstructorUsedError;
  bool get passwordHasSpecialChars => throw _privateConstructorUsedError;
  bool get passwordsMatch => throw _privateConstructorUsedError;
  bool get canSubmit => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsPasswordStateCopyWith<SettingsPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsPasswordStateCopyWith<$Res> {
  factory $SettingsPasswordStateCopyWith(SettingsPasswordState value,
          $Res Function(SettingsPasswordState) then) =
      _$SettingsPasswordStateCopyWithImpl<$Res, SettingsPasswordState>;
  @useResult
  $Res call(
      {String password,
      String passwordConfirmation,
      bool passwordHasMinLength,
      bool passwordHasUppercase,
      bool passwordHasLowercase,
      bool passwordHasDigits,
      bool passwordHasSpecialChars,
      bool passwordsMatch,
      bool canSubmit,
      bool isLoading,
      bool isSuccess,
      String? errorText});
}

/// @nodoc
class _$SettingsPasswordStateCopyWithImpl<$Res,
        $Val extends SettingsPasswordState>
    implements $SettingsPasswordStateCopyWith<$Res> {
  _$SettingsPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? passwordConfirmation = null,
    Object? passwordHasMinLength = null,
    Object? passwordHasUppercase = null,
    Object? passwordHasLowercase = null,
    Object? passwordHasDigits = null,
    Object? passwordHasSpecialChars = null,
    Object? passwordsMatch = null,
    Object? canSubmit = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? errorText = freezed,
  }) {
    return _then(_value.copyWith(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: null == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
      passwordHasMinLength: null == passwordHasMinLength
          ? _value.passwordHasMinLength
          : passwordHasMinLength // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordHasUppercase: null == passwordHasUppercase
          ? _value.passwordHasUppercase
          : passwordHasUppercase // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordHasLowercase: null == passwordHasLowercase
          ? _value.passwordHasLowercase
          : passwordHasLowercase // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordHasDigits: null == passwordHasDigits
          ? _value.passwordHasDigits
          : passwordHasDigits // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordHasSpecialChars: null == passwordHasSpecialChars
          ? _value.passwordHasSpecialChars
          : passwordHasSpecialChars // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordsMatch: null == passwordsMatch
          ? _value.passwordsMatch
          : passwordsMatch // ignore: cast_nullable_to_non_nullable
              as bool,
      canSubmit: null == canSubmit
          ? _value.canSubmit
          : canSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingsPasswordStateCopyWith<$Res>
    implements $SettingsPasswordStateCopyWith<$Res> {
  factory _$$_SettingsPasswordStateCopyWith(_$_SettingsPasswordState value,
          $Res Function(_$_SettingsPasswordState) then) =
      __$$_SettingsPasswordStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String password,
      String passwordConfirmation,
      bool passwordHasMinLength,
      bool passwordHasUppercase,
      bool passwordHasLowercase,
      bool passwordHasDigits,
      bool passwordHasSpecialChars,
      bool passwordsMatch,
      bool canSubmit,
      bool isLoading,
      bool isSuccess,
      String? errorText});
}

/// @nodoc
class __$$_SettingsPasswordStateCopyWithImpl<$Res>
    extends _$SettingsPasswordStateCopyWithImpl<$Res, _$_SettingsPasswordState>
    implements _$$_SettingsPasswordStateCopyWith<$Res> {
  __$$_SettingsPasswordStateCopyWithImpl(_$_SettingsPasswordState _value,
      $Res Function(_$_SettingsPasswordState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? passwordConfirmation = null,
    Object? passwordHasMinLength = null,
    Object? passwordHasUppercase = null,
    Object? passwordHasLowercase = null,
    Object? passwordHasDigits = null,
    Object? passwordHasSpecialChars = null,
    Object? passwordsMatch = null,
    Object? canSubmit = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? errorText = freezed,
  }) {
    return _then(_$_SettingsPasswordState(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: null == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
      passwordHasMinLength: null == passwordHasMinLength
          ? _value.passwordHasMinLength
          : passwordHasMinLength // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordHasUppercase: null == passwordHasUppercase
          ? _value.passwordHasUppercase
          : passwordHasUppercase // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordHasLowercase: null == passwordHasLowercase
          ? _value.passwordHasLowercase
          : passwordHasLowercase // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordHasDigits: null == passwordHasDigits
          ? _value.passwordHasDigits
          : passwordHasDigits // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordHasSpecialChars: null == passwordHasSpecialChars
          ? _value.passwordHasSpecialChars
          : passwordHasSpecialChars // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordsMatch: null == passwordsMatch
          ? _value.passwordsMatch
          : passwordsMatch // ignore: cast_nullable_to_non_nullable
              as bool,
      canSubmit: null == canSubmit
          ? _value.canSubmit
          : canSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SettingsPasswordState implements _SettingsPasswordState {
  const _$_SettingsPasswordState(
      {this.password = "",
      this.passwordConfirmation = "",
      this.passwordHasMinLength = false,
      this.passwordHasUppercase = false,
      this.passwordHasLowercase = false,
      this.passwordHasDigits = false,
      this.passwordHasSpecialChars = false,
      this.passwordsMatch = false,
      this.canSubmit = false,
      this.isLoading = false,
      this.isSuccess = false,
      this.errorText});

  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String passwordConfirmation;
  @override
  @JsonKey()
  final bool passwordHasMinLength;
  @override
  @JsonKey()
  final bool passwordHasUppercase;
  @override
  @JsonKey()
  final bool passwordHasLowercase;
  @override
  @JsonKey()
  final bool passwordHasDigits;
  @override
  @JsonKey()
  final bool passwordHasSpecialChars;
  @override
  @JsonKey()
  final bool passwordsMatch;
  @override
  @JsonKey()
  final bool canSubmit;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  final String? errorText;

  @override
  String toString() {
    return 'SettingsPasswordState(password: $password, passwordConfirmation: $passwordConfirmation, passwordHasMinLength: $passwordHasMinLength, passwordHasUppercase: $passwordHasUppercase, passwordHasLowercase: $passwordHasLowercase, passwordHasDigits: $passwordHasDigits, passwordHasSpecialChars: $passwordHasSpecialChars, passwordsMatch: $passwordsMatch, canSubmit: $canSubmit, isLoading: $isLoading, isSuccess: $isSuccess, errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsPasswordState &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation) &&
            (identical(other.passwordHasMinLength, passwordHasMinLength) ||
                other.passwordHasMinLength == passwordHasMinLength) &&
            (identical(other.passwordHasUppercase, passwordHasUppercase) ||
                other.passwordHasUppercase == passwordHasUppercase) &&
            (identical(other.passwordHasLowercase, passwordHasLowercase) ||
                other.passwordHasLowercase == passwordHasLowercase) &&
            (identical(other.passwordHasDigits, passwordHasDigits) ||
                other.passwordHasDigits == passwordHasDigits) &&
            (identical(
                    other.passwordHasSpecialChars, passwordHasSpecialChars) ||
                other.passwordHasSpecialChars == passwordHasSpecialChars) &&
            (identical(other.passwordsMatch, passwordsMatch) ||
                other.passwordsMatch == passwordsMatch) &&
            (identical(other.canSubmit, canSubmit) ||
                other.canSubmit == canSubmit) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      password,
      passwordConfirmation,
      passwordHasMinLength,
      passwordHasUppercase,
      passwordHasLowercase,
      passwordHasDigits,
      passwordHasSpecialChars,
      passwordsMatch,
      canSubmit,
      isLoading,
      isSuccess,
      errorText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsPasswordStateCopyWith<_$_SettingsPasswordState> get copyWith =>
      __$$_SettingsPasswordStateCopyWithImpl<_$_SettingsPasswordState>(
          this, _$identity);
}

abstract class _SettingsPasswordState implements SettingsPasswordState {
  const factory _SettingsPasswordState(
      {final String password,
      final String passwordConfirmation,
      final bool passwordHasMinLength,
      final bool passwordHasUppercase,
      final bool passwordHasLowercase,
      final bool passwordHasDigits,
      final bool passwordHasSpecialChars,
      final bool passwordsMatch,
      final bool canSubmit,
      final bool isLoading,
      final bool isSuccess,
      final String? errorText}) = _$_SettingsPasswordState;

  @override
  String get password;
  @override
  String get passwordConfirmation;
  @override
  bool get passwordHasMinLength;
  @override
  bool get passwordHasUppercase;
  @override
  bool get passwordHasLowercase;
  @override
  bool get passwordHasDigits;
  @override
  bool get passwordHasSpecialChars;
  @override
  bool get passwordsMatch;
  @override
  bool get canSubmit;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  String? get errorText;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsPasswordStateCopyWith<_$_SettingsPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SettingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function(String errorText) error,
    required TResult Function() success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function(String errorText)? error,
    TResult? Function()? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(String errorText)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'SettingsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function(String errorText) error,
    required TResult Function() success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function(String errorText)? error,
    TResult? Function()? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(String errorText)? error,
    TResult Function()? success,
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
    required TResult Function(_Saving value) saving,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SettingsState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_SavingCopyWith<$Res> {
  factory _$$_SavingCopyWith(_$_Saving value, $Res Function(_$_Saving) then) =
      __$$_SavingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SavingCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$_Saving>
    implements _$$_SavingCopyWith<$Res> {
  __$$_SavingCopyWithImpl(_$_Saving _value, $Res Function(_$_Saving) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Saving implements _Saving {
  const _$_Saving();

  @override
  String toString() {
    return 'SettingsState.saving()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Saving);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function(String errorText) error,
    required TResult Function() success,
  }) {
    return saving();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function(String errorText)? error,
    TResult? Function()? success,
  }) {
    return saving?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(String errorText)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return saving(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return saving?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving(this);
    }
    return orElse();
  }
}

abstract class _Saving implements SettingsState {
  const factory _Saving() = _$_Saving;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorText});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorText = null,
  }) {
    return _then(_$_Error(
      null == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.errorText);

  @override
  final String errorText;

  @override
  String toString() {
    return 'SettingsState.error(errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function(String errorText) error,
    required TResult Function() success,
  }) {
    return error(errorText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function(String errorText)? error,
    TResult? Function()? success,
  }) {
    return error?.call(errorText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(String errorText)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SettingsState {
  const factory _Error(final String errorText) = _$_Error;

  String get errorText;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success();

  @override
  String toString() {
    return 'SettingsState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Success);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function(String errorText) error,
    required TResult Function() success,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function(String errorText)? error,
    TResult? Function()? success,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(String errorText)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements SettingsState {
  const factory _Success() = _$_Success;
}
