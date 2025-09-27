// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthenticationStarted value)?  authenticationStarted,TResult Function( LoginButtonPressed value)?  loginButtonPressed,TResult Function( RegisterButtonPressed value)?  registerButtonPressed,TResult Function( LogoutButtonPressed value)?  logoutButtonPressed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthenticationStarted() when authenticationStarted != null:
return authenticationStarted(_that);case LoginButtonPressed() when loginButtonPressed != null:
return loginButtonPressed(_that);case RegisterButtonPressed() when registerButtonPressed != null:
return registerButtonPressed(_that);case LogoutButtonPressed() when logoutButtonPressed != null:
return logoutButtonPressed(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthenticationStarted value)  authenticationStarted,required TResult Function( LoginButtonPressed value)  loginButtonPressed,required TResult Function( RegisterButtonPressed value)  registerButtonPressed,required TResult Function( LogoutButtonPressed value)  logoutButtonPressed,}){
final _that = this;
switch (_that) {
case AuthenticationStarted():
return authenticationStarted(_that);case LoginButtonPressed():
return loginButtonPressed(_that);case RegisterButtonPressed():
return registerButtonPressed(_that);case LogoutButtonPressed():
return logoutButtonPressed(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthenticationStarted value)?  authenticationStarted,TResult? Function( LoginButtonPressed value)?  loginButtonPressed,TResult? Function( RegisterButtonPressed value)?  registerButtonPressed,TResult? Function( LogoutButtonPressed value)?  logoutButtonPressed,}){
final _that = this;
switch (_that) {
case AuthenticationStarted() when authenticationStarted != null:
return authenticationStarted(_that);case LoginButtonPressed() when loginButtonPressed != null:
return loginButtonPressed(_that);case RegisterButtonPressed() when registerButtonPressed != null:
return registerButtonPressed(_that);case LogoutButtonPressed() when logoutButtonPressed != null:
return logoutButtonPressed(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  authenticationStarted,TResult Function( String email,  String password)?  loginButtonPressed,TResult Function( String username,  String email,  String firstName,  String lastName,  String password,  String passwordConfirm,  String phoneNumber)?  registerButtonPressed,TResult Function( String refreshToken)?  logoutButtonPressed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthenticationStarted() when authenticationStarted != null:
return authenticationStarted();case LoginButtonPressed() when loginButtonPressed != null:
return loginButtonPressed(_that.email,_that.password);case RegisterButtonPressed() when registerButtonPressed != null:
return registerButtonPressed(_that.username,_that.email,_that.firstName,_that.lastName,_that.password,_that.passwordConfirm,_that.phoneNumber);case LogoutButtonPressed() when logoutButtonPressed != null:
return logoutButtonPressed(_that.refreshToken);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  authenticationStarted,required TResult Function( String email,  String password)  loginButtonPressed,required TResult Function( String username,  String email,  String firstName,  String lastName,  String password,  String passwordConfirm,  String phoneNumber)  registerButtonPressed,required TResult Function( String refreshToken)  logoutButtonPressed,}) {final _that = this;
switch (_that) {
case AuthenticationStarted():
return authenticationStarted();case LoginButtonPressed():
return loginButtonPressed(_that.email,_that.password);case RegisterButtonPressed():
return registerButtonPressed(_that.username,_that.email,_that.firstName,_that.lastName,_that.password,_that.passwordConfirm,_that.phoneNumber);case LogoutButtonPressed():
return logoutButtonPressed(_that.refreshToken);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  authenticationStarted,TResult? Function( String email,  String password)?  loginButtonPressed,TResult? Function( String username,  String email,  String firstName,  String lastName,  String password,  String passwordConfirm,  String phoneNumber)?  registerButtonPressed,TResult? Function( String refreshToken)?  logoutButtonPressed,}) {final _that = this;
switch (_that) {
case AuthenticationStarted() when authenticationStarted != null:
return authenticationStarted();case LoginButtonPressed() when loginButtonPressed != null:
return loginButtonPressed(_that.email,_that.password);case RegisterButtonPressed() when registerButtonPressed != null:
return registerButtonPressed(_that.username,_that.email,_that.firstName,_that.lastName,_that.password,_that.passwordConfirm,_that.phoneNumber);case LogoutButtonPressed() when logoutButtonPressed != null:
return logoutButtonPressed(_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc


class AuthenticationStarted implements AuthEvent {
  const AuthenticationStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.authenticationStarted()';
}


}




/// @nodoc


class LoginButtonPressed implements AuthEvent {
  const LoginButtonPressed({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginButtonPressedCopyWith<LoginButtonPressed> get copyWith => _$LoginButtonPressedCopyWithImpl<LoginButtonPressed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginButtonPressed&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.loginButtonPressed(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginButtonPressedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $LoginButtonPressedCopyWith(LoginButtonPressed value, $Res Function(LoginButtonPressed) _then) = _$LoginButtonPressedCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$LoginButtonPressedCopyWithImpl<$Res>
    implements $LoginButtonPressedCopyWith<$Res> {
  _$LoginButtonPressedCopyWithImpl(this._self, this._then);

  final LoginButtonPressed _self;
  final $Res Function(LoginButtonPressed) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(LoginButtonPressed(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RegisterButtonPressed implements AuthEvent {
  const RegisterButtonPressed({required this.username, required this.email, required this.firstName, required this.lastName, required this.password, required this.passwordConfirm, required this.phoneNumber});
  

 final  String username;
 final  String email;
 final  String firstName;
 final  String lastName;
 final  String password;
 final  String passwordConfirm;
 final  String phoneNumber;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterButtonPressedCopyWith<RegisterButtonPressed> get copyWith => _$RegisterButtonPressedCopyWithImpl<RegisterButtonPressed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterButtonPressed&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordConfirm, passwordConfirm) || other.passwordConfirm == passwordConfirm)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}


@override
int get hashCode => Object.hash(runtimeType,username,email,firstName,lastName,password,passwordConfirm,phoneNumber);

@override
String toString() {
  return 'AuthEvent.registerButtonPressed(username: $username, email: $email, firstName: $firstName, lastName: $lastName, password: $password, passwordConfirm: $passwordConfirm, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class $RegisterButtonPressedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $RegisterButtonPressedCopyWith(RegisterButtonPressed value, $Res Function(RegisterButtonPressed) _then) = _$RegisterButtonPressedCopyWithImpl;
@useResult
$Res call({
 String username, String email, String firstName, String lastName, String password, String passwordConfirm, String phoneNumber
});




}
/// @nodoc
class _$RegisterButtonPressedCopyWithImpl<$Res>
    implements $RegisterButtonPressedCopyWith<$Res> {
  _$RegisterButtonPressedCopyWithImpl(this._self, this._then);

  final RegisterButtonPressed _self;
  final $Res Function(RegisterButtonPressed) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? username = null,Object? email = null,Object? firstName = null,Object? lastName = null,Object? password = null,Object? passwordConfirm = null,Object? phoneNumber = null,}) {
  return _then(RegisterButtonPressed(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirm: null == passwordConfirm ? _self.passwordConfirm : passwordConfirm // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LogoutButtonPressed implements AuthEvent {
  const LogoutButtonPressed({required this.refreshToken});
  

 final  String refreshToken;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoutButtonPressedCopyWith<LogoutButtonPressed> get copyWith => _$LogoutButtonPressedCopyWithImpl<LogoutButtonPressed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutButtonPressed&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}


@override
int get hashCode => Object.hash(runtimeType,refreshToken);

@override
String toString() {
  return 'AuthEvent.logoutButtonPressed(refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $LogoutButtonPressedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $LogoutButtonPressedCopyWith(LogoutButtonPressed value, $Res Function(LogoutButtonPressed) _then) = _$LogoutButtonPressedCopyWithImpl;
@useResult
$Res call({
 String refreshToken
});




}
/// @nodoc
class _$LogoutButtonPressedCopyWithImpl<$Res>
    implements $LogoutButtonPressedCopyWith<$Res> {
  _$LogoutButtonPressedCopyWithImpl(this._self, this._then);

  final LogoutButtonPressed _self;
  final $Res Function(LogoutButtonPressed) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? refreshToken = null,}) {
  return _then(LogoutButtonPressed(
refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
