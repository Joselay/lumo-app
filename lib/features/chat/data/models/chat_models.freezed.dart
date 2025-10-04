// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatMessage {

 String get role; String get content; String? get id;@JsonKey(name: 'tool_calls') List<ToolCall>? get toolCalls;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<ChatMessage> get copyWith => _$ChatMessageCopyWithImpl<ChatMessage>(this as ChatMessage, _$identity);

  /// Serializes this ChatMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessage&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.toolCalls, toolCalls)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,content,id,const DeepCollectionEquality().hash(toolCalls),createdAt);

@override
String toString() {
  return 'ChatMessage(role: $role, content: $content, id: $id, toolCalls: $toolCalls, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ChatMessageCopyWith<$Res>  {
  factory $ChatMessageCopyWith(ChatMessage value, $Res Function(ChatMessage) _then) = _$ChatMessageCopyWithImpl;
@useResult
$Res call({
 String role, String content, String? id,@JsonKey(name: 'tool_calls') List<ToolCall>? toolCalls,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$ChatMessageCopyWithImpl<$Res>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._self, this._then);

  final ChatMessage _self;
  final $Res Function(ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = null,Object? content = null,Object? id = freezed,Object? toolCalls = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,toolCalls: freezed == toolCalls ? _self.toolCalls : toolCalls // ignore: cast_nullable_to_non_nullable
as List<ToolCall>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatMessage].
extension ChatMessagePatterns on ChatMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessage value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessage():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessage value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String role,  String content,  String? id, @JsonKey(name: 'tool_calls')  List<ToolCall>? toolCalls, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.role,_that.content,_that.id,_that.toolCalls,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String role,  String content,  String? id, @JsonKey(name: 'tool_calls')  List<ToolCall>? toolCalls, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _ChatMessage():
return $default(_that.role,_that.content,_that.id,_that.toolCalls,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String role,  String content,  String? id, @JsonKey(name: 'tool_calls')  List<ToolCall>? toolCalls, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.role,_that.content,_that.id,_that.toolCalls,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatMessage implements ChatMessage {
  const _ChatMessage({required this.role, required this.content, this.id, @JsonKey(name: 'tool_calls') final  List<ToolCall>? toolCalls, @JsonKey(name: 'created_at') this.createdAt}): _toolCalls = toolCalls;
  factory _ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);

@override final  String role;
@override final  String content;
@override final  String? id;
 final  List<ToolCall>? _toolCalls;
@override@JsonKey(name: 'tool_calls') List<ToolCall>? get toolCalls {
  final value = _toolCalls;
  if (value == null) return null;
  if (_toolCalls is EqualUnmodifiableListView) return _toolCalls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessageCopyWith<_ChatMessage> get copyWith => __$ChatMessageCopyWithImpl<_ChatMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessage&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._toolCalls, _toolCalls)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,content,id,const DeepCollectionEquality().hash(_toolCalls),createdAt);

@override
String toString() {
  return 'ChatMessage(role: $role, content: $content, id: $id, toolCalls: $toolCalls, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ChatMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory _$ChatMessageCopyWith(_ChatMessage value, $Res Function(_ChatMessage) _then) = __$ChatMessageCopyWithImpl;
@override @useResult
$Res call({
 String role, String content, String? id,@JsonKey(name: 'tool_calls') List<ToolCall>? toolCalls,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$ChatMessageCopyWithImpl<$Res>
    implements _$ChatMessageCopyWith<$Res> {
  __$ChatMessageCopyWithImpl(this._self, this._then);

  final _ChatMessage _self;
  final $Res Function(_ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = null,Object? content = null,Object? id = freezed,Object? toolCalls = freezed,Object? createdAt = freezed,}) {
  return _then(_ChatMessage(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,toolCalls: freezed == toolCalls ? _self._toolCalls : toolCalls // ignore: cast_nullable_to_non_nullable
as List<ToolCall>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ToolCall {

 String get name; Map<String, dynamic> get arguments; String get result;
/// Create a copy of ToolCall
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolCallCopyWith<ToolCall> get copyWith => _$ToolCallCopyWithImpl<ToolCall>(this as ToolCall, _$identity);

  /// Serializes this ToolCall to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolCall&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.arguments, arguments)&&(identical(other.result, result) || other.result == result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(arguments),result);

@override
String toString() {
  return 'ToolCall(name: $name, arguments: $arguments, result: $result)';
}


}

/// @nodoc
abstract mixin class $ToolCallCopyWith<$Res>  {
  factory $ToolCallCopyWith(ToolCall value, $Res Function(ToolCall) _then) = _$ToolCallCopyWithImpl;
@useResult
$Res call({
 String name, Map<String, dynamic> arguments, String result
});




}
/// @nodoc
class _$ToolCallCopyWithImpl<$Res>
    implements $ToolCallCopyWith<$Res> {
  _$ToolCallCopyWithImpl(this._self, this._then);

  final ToolCall _self;
  final $Res Function(ToolCall) _then;

/// Create a copy of ToolCall
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? arguments = null,Object? result = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,arguments: null == arguments ? _self.arguments : arguments // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ToolCall].
extension ToolCallPatterns on ToolCall {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolCall value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolCall() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolCall value)  $default,){
final _that = this;
switch (_that) {
case _ToolCall():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolCall value)?  $default,){
final _that = this;
switch (_that) {
case _ToolCall() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  Map<String, dynamic> arguments,  String result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolCall() when $default != null:
return $default(_that.name,_that.arguments,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  Map<String, dynamic> arguments,  String result)  $default,) {final _that = this;
switch (_that) {
case _ToolCall():
return $default(_that.name,_that.arguments,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  Map<String, dynamic> arguments,  String result)?  $default,) {final _that = this;
switch (_that) {
case _ToolCall() when $default != null:
return $default(_that.name,_that.arguments,_that.result);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToolCall implements ToolCall {
  const _ToolCall({required this.name, required final  Map<String, dynamic> arguments, required this.result}): _arguments = arguments;
  factory _ToolCall.fromJson(Map<String, dynamic> json) => _$ToolCallFromJson(json);

@override final  String name;
 final  Map<String, dynamic> _arguments;
@override Map<String, dynamic> get arguments {
  if (_arguments is EqualUnmodifiableMapView) return _arguments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_arguments);
}

@override final  String result;

/// Create a copy of ToolCall
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolCallCopyWith<_ToolCall> get copyWith => __$ToolCallCopyWithImpl<_ToolCall>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolCallToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolCall&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._arguments, _arguments)&&(identical(other.result, result) || other.result == result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_arguments),result);

@override
String toString() {
  return 'ToolCall(name: $name, arguments: $arguments, result: $result)';
}


}

/// @nodoc
abstract mixin class _$ToolCallCopyWith<$Res> implements $ToolCallCopyWith<$Res> {
  factory _$ToolCallCopyWith(_ToolCall value, $Res Function(_ToolCall) _then) = __$ToolCallCopyWithImpl;
@override @useResult
$Res call({
 String name, Map<String, dynamic> arguments, String result
});




}
/// @nodoc
class __$ToolCallCopyWithImpl<$Res>
    implements _$ToolCallCopyWith<$Res> {
  __$ToolCallCopyWithImpl(this._self, this._then);

  final _ToolCall _self;
  final $Res Function(_ToolCall) _then;

/// Create a copy of ToolCall
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? arguments = null,Object? result = null,}) {
  return _then(_ToolCall(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,arguments: null == arguments ? _self._arguments : arguments // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ChatRequest {

 String get message;@JsonKey(name: 'session_id') String? get sessionId;@JsonKey(name: 'conversation_history') List<ChatMessage> get conversationHistory;
/// Create a copy of ChatRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatRequestCopyWith<ChatRequest> get copyWith => _$ChatRequestCopyWithImpl<ChatRequest>(this as ChatRequest, _$identity);

  /// Serializes this ChatRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRequest&&(identical(other.message, message) || other.message == message)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&const DeepCollectionEquality().equals(other.conversationHistory, conversationHistory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,sessionId,const DeepCollectionEquality().hash(conversationHistory));

@override
String toString() {
  return 'ChatRequest(message: $message, sessionId: $sessionId, conversationHistory: $conversationHistory)';
}


}

/// @nodoc
abstract mixin class $ChatRequestCopyWith<$Res>  {
  factory $ChatRequestCopyWith(ChatRequest value, $Res Function(ChatRequest) _then) = _$ChatRequestCopyWithImpl;
@useResult
$Res call({
 String message,@JsonKey(name: 'session_id') String? sessionId,@JsonKey(name: 'conversation_history') List<ChatMessage> conversationHistory
});




}
/// @nodoc
class _$ChatRequestCopyWithImpl<$Res>
    implements $ChatRequestCopyWith<$Res> {
  _$ChatRequestCopyWithImpl(this._self, this._then);

  final ChatRequest _self;
  final $Res Function(ChatRequest) _then;

/// Create a copy of ChatRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? sessionId = freezed,Object? conversationHistory = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,conversationHistory: null == conversationHistory ? _self.conversationHistory : conversationHistory // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatRequest].
extension ChatRequestPatterns on ChatRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatRequest() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatRequest value)  $default,){
final _that = this;
switch (_that) {
case _ChatRequest():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ChatRequest() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message, @JsonKey(name: 'session_id')  String? sessionId, @JsonKey(name: 'conversation_history')  List<ChatMessage> conversationHistory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatRequest() when $default != null:
return $default(_that.message,_that.sessionId,_that.conversationHistory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message, @JsonKey(name: 'session_id')  String? sessionId, @JsonKey(name: 'conversation_history')  List<ChatMessage> conversationHistory)  $default,) {final _that = this;
switch (_that) {
case _ChatRequest():
return $default(_that.message,_that.sessionId,_that.conversationHistory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message, @JsonKey(name: 'session_id')  String? sessionId, @JsonKey(name: 'conversation_history')  List<ChatMessage> conversationHistory)?  $default,) {final _that = this;
switch (_that) {
case _ChatRequest() when $default != null:
return $default(_that.message,_that.sessionId,_that.conversationHistory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatRequest implements ChatRequest {
  const _ChatRequest({required this.message, @JsonKey(name: 'session_id') this.sessionId, @JsonKey(name: 'conversation_history') final  List<ChatMessage> conversationHistory = const []}): _conversationHistory = conversationHistory;
  factory _ChatRequest.fromJson(Map<String, dynamic> json) => _$ChatRequestFromJson(json);

@override final  String message;
@override@JsonKey(name: 'session_id') final  String? sessionId;
 final  List<ChatMessage> _conversationHistory;
@override@JsonKey(name: 'conversation_history') List<ChatMessage> get conversationHistory {
  if (_conversationHistory is EqualUnmodifiableListView) return _conversationHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conversationHistory);
}


/// Create a copy of ChatRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatRequestCopyWith<_ChatRequest> get copyWith => __$ChatRequestCopyWithImpl<_ChatRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatRequest&&(identical(other.message, message) || other.message == message)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&const DeepCollectionEquality().equals(other._conversationHistory, _conversationHistory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,sessionId,const DeepCollectionEquality().hash(_conversationHistory));

@override
String toString() {
  return 'ChatRequest(message: $message, sessionId: $sessionId, conversationHistory: $conversationHistory)';
}


}

/// @nodoc
abstract mixin class _$ChatRequestCopyWith<$Res> implements $ChatRequestCopyWith<$Res> {
  factory _$ChatRequestCopyWith(_ChatRequest value, $Res Function(_ChatRequest) _then) = __$ChatRequestCopyWithImpl;
@override @useResult
$Res call({
 String message,@JsonKey(name: 'session_id') String? sessionId,@JsonKey(name: 'conversation_history') List<ChatMessage> conversationHistory
});




}
/// @nodoc
class __$ChatRequestCopyWithImpl<$Res>
    implements _$ChatRequestCopyWith<$Res> {
  __$ChatRequestCopyWithImpl(this._self, this._then);

  final _ChatRequest _self;
  final $Res Function(_ChatRequest) _then;

/// Create a copy of ChatRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? sessionId = freezed,Object? conversationHistory = null,}) {
  return _then(_ChatRequest(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,conversationHistory: null == conversationHistory ? _self._conversationHistory : conversationHistory // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,
  ));
}


}


/// @nodoc
mixin _$ChatResponse {

 bool get success; String get response; String get error;@JsonKey(name: 'tool_calls') List<ToolCall> get toolCalls;@JsonKey(name: 'session_id') String? get sessionId;
/// Create a copy of ChatResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatResponseCopyWith<ChatResponse> get copyWith => _$ChatResponseCopyWithImpl<ChatResponse>(this as ChatResponse, _$identity);

  /// Serializes this ChatResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.response, response) || other.response == response)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.toolCalls, toolCalls)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,response,error,const DeepCollectionEquality().hash(toolCalls),sessionId);

@override
String toString() {
  return 'ChatResponse(success: $success, response: $response, error: $error, toolCalls: $toolCalls, sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $ChatResponseCopyWith<$Res>  {
  factory $ChatResponseCopyWith(ChatResponse value, $Res Function(ChatResponse) _then) = _$ChatResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String response, String error,@JsonKey(name: 'tool_calls') List<ToolCall> toolCalls,@JsonKey(name: 'session_id') String? sessionId
});




}
/// @nodoc
class _$ChatResponseCopyWithImpl<$Res>
    implements $ChatResponseCopyWith<$Res> {
  _$ChatResponseCopyWithImpl(this._self, this._then);

  final ChatResponse _self;
  final $Res Function(ChatResponse) _then;

/// Create a copy of ChatResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? response = null,Object? error = null,Object? toolCalls = null,Object? sessionId = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,toolCalls: null == toolCalls ? _self.toolCalls : toolCalls // ignore: cast_nullable_to_non_nullable
as List<ToolCall>,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatResponse].
extension ChatResponsePatterns on ChatResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatResponse value)  $default,){
final _that = this;
switch (_that) {
case _ChatResponse():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ChatResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String response,  String error, @JsonKey(name: 'tool_calls')  List<ToolCall> toolCalls, @JsonKey(name: 'session_id')  String? sessionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatResponse() when $default != null:
return $default(_that.success,_that.response,_that.error,_that.toolCalls,_that.sessionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String response,  String error, @JsonKey(name: 'tool_calls')  List<ToolCall> toolCalls, @JsonKey(name: 'session_id')  String? sessionId)  $default,) {final _that = this;
switch (_that) {
case _ChatResponse():
return $default(_that.success,_that.response,_that.error,_that.toolCalls,_that.sessionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String response,  String error, @JsonKey(name: 'tool_calls')  List<ToolCall> toolCalls, @JsonKey(name: 'session_id')  String? sessionId)?  $default,) {final _that = this;
switch (_that) {
case _ChatResponse() when $default != null:
return $default(_that.success,_that.response,_that.error,_that.toolCalls,_that.sessionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatResponse implements ChatResponse {
  const _ChatResponse({required this.success, required this.response, this.error = '', @JsonKey(name: 'tool_calls') final  List<ToolCall> toolCalls = const [], @JsonKey(name: 'session_id') this.sessionId}): _toolCalls = toolCalls;
  factory _ChatResponse.fromJson(Map<String, dynamic> json) => _$ChatResponseFromJson(json);

@override final  bool success;
@override final  String response;
@override@JsonKey() final  String error;
 final  List<ToolCall> _toolCalls;
@override@JsonKey(name: 'tool_calls') List<ToolCall> get toolCalls {
  if (_toolCalls is EqualUnmodifiableListView) return _toolCalls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_toolCalls);
}

@override@JsonKey(name: 'session_id') final  String? sessionId;

/// Create a copy of ChatResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatResponseCopyWith<_ChatResponse> get copyWith => __$ChatResponseCopyWithImpl<_ChatResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.response, response) || other.response == response)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other._toolCalls, _toolCalls)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,response,error,const DeepCollectionEquality().hash(_toolCalls),sessionId);

@override
String toString() {
  return 'ChatResponse(success: $success, response: $response, error: $error, toolCalls: $toolCalls, sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class _$ChatResponseCopyWith<$Res> implements $ChatResponseCopyWith<$Res> {
  factory _$ChatResponseCopyWith(_ChatResponse value, $Res Function(_ChatResponse) _then) = __$ChatResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String response, String error,@JsonKey(name: 'tool_calls') List<ToolCall> toolCalls,@JsonKey(name: 'session_id') String? sessionId
});




}
/// @nodoc
class __$ChatResponseCopyWithImpl<$Res>
    implements _$ChatResponseCopyWith<$Res> {
  __$ChatResponseCopyWithImpl(this._self, this._then);

  final _ChatResponse _self;
  final $Res Function(_ChatResponse) _then;

/// Create a copy of ChatResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? response = null,Object? error = null,Object? toolCalls = null,Object? sessionId = freezed,}) {
  return _then(_ChatResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,toolCalls: null == toolCalls ? _self._toolCalls : toolCalls // ignore: cast_nullable_to_non_nullable
as List<ToolCall>,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ChatSession {

 String get id; String get title;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'messages_count') int get messagesCount;@JsonKey(name: 'last_message') ChatMessage? get lastMessage;
/// Create a copy of ChatSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatSessionCopyWith<ChatSession> get copyWith => _$ChatSessionCopyWithImpl<ChatSession>(this as ChatSession, _$identity);

  /// Serializes this ChatSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatSession&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.messagesCount, messagesCount) || other.messagesCount == messagesCount)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,createdAt,updatedAt,isActive,messagesCount,lastMessage);

@override
String toString() {
  return 'ChatSession(id: $id, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, messagesCount: $messagesCount, lastMessage: $lastMessage)';
}


}

/// @nodoc
abstract mixin class $ChatSessionCopyWith<$Res>  {
  factory $ChatSessionCopyWith(ChatSession value, $Res Function(ChatSession) _then) = _$ChatSessionCopyWithImpl;
@useResult
$Res call({
 String id, String title,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'messages_count') int messagesCount,@JsonKey(name: 'last_message') ChatMessage? lastMessage
});


$ChatMessageCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class _$ChatSessionCopyWithImpl<$Res>
    implements $ChatSessionCopyWith<$Res> {
  _$ChatSessionCopyWithImpl(this._self, this._then);

  final ChatSession _self;
  final $Res Function(ChatSession) _then;

/// Create a copy of ChatSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? createdAt = null,Object? updatedAt = null,Object? isActive = null,Object? messagesCount = null,Object? lastMessage = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,messagesCount: null == messagesCount ? _self.messagesCount : messagesCount // ignore: cast_nullable_to_non_nullable
as int,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as ChatMessage?,
  ));
}
/// Create a copy of ChatSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $ChatMessageCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatSession].
extension ChatSessionPatterns on ChatSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatSession() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatSession value)  $default,){
final _that = this;
switch (_that) {
case _ChatSession():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatSession value)?  $default,){
final _that = this;
switch (_that) {
case _ChatSession() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'messages_count')  int messagesCount, @JsonKey(name: 'last_message')  ChatMessage? lastMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatSession() when $default != null:
return $default(_that.id,_that.title,_that.createdAt,_that.updatedAt,_that.isActive,_that.messagesCount,_that.lastMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'messages_count')  int messagesCount, @JsonKey(name: 'last_message')  ChatMessage? lastMessage)  $default,) {final _that = this;
switch (_that) {
case _ChatSession():
return $default(_that.id,_that.title,_that.createdAt,_that.updatedAt,_that.isActive,_that.messagesCount,_that.lastMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'messages_count')  int messagesCount, @JsonKey(name: 'last_message')  ChatMessage? lastMessage)?  $default,) {final _that = this;
switch (_that) {
case _ChatSession() when $default != null:
return $default(_that.id,_that.title,_that.createdAt,_that.updatedAt,_that.isActive,_that.messagesCount,_that.lastMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatSession implements ChatSession {
  const _ChatSession({required this.id, required this.title, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'messages_count') required this.messagesCount, @JsonKey(name: 'last_message') this.lastMessage});
  factory _ChatSession.fromJson(Map<String, dynamic> json) => _$ChatSessionFromJson(json);

@override final  String id;
@override final  String title;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'messages_count') final  int messagesCount;
@override@JsonKey(name: 'last_message') final  ChatMessage? lastMessage;

/// Create a copy of ChatSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatSessionCopyWith<_ChatSession> get copyWith => __$ChatSessionCopyWithImpl<_ChatSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatSession&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.messagesCount, messagesCount) || other.messagesCount == messagesCount)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,createdAt,updatedAt,isActive,messagesCount,lastMessage);

@override
String toString() {
  return 'ChatSession(id: $id, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, messagesCount: $messagesCount, lastMessage: $lastMessage)';
}


}

/// @nodoc
abstract mixin class _$ChatSessionCopyWith<$Res> implements $ChatSessionCopyWith<$Res> {
  factory _$ChatSessionCopyWith(_ChatSession value, $Res Function(_ChatSession) _then) = __$ChatSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, String title,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'messages_count') int messagesCount,@JsonKey(name: 'last_message') ChatMessage? lastMessage
});


@override $ChatMessageCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class __$ChatSessionCopyWithImpl<$Res>
    implements _$ChatSessionCopyWith<$Res> {
  __$ChatSessionCopyWithImpl(this._self, this._then);

  final _ChatSession _self;
  final $Res Function(_ChatSession) _then;

/// Create a copy of ChatSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? createdAt = null,Object? updatedAt = null,Object? isActive = null,Object? messagesCount = null,Object? lastMessage = freezed,}) {
  return _then(_ChatSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,messagesCount: null == messagesCount ? _self.messagesCount : messagesCount // ignore: cast_nullable_to_non_nullable
as int,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as ChatMessage?,
  ));
}

/// Create a copy of ChatSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $ChatMessageCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}


/// @nodoc
mixin _$ChatSessionDetail {

 String get id; String get title;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(name: 'is_active') bool get isActive; List<ChatMessage> get messages;
/// Create a copy of ChatSessionDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatSessionDetailCopyWith<ChatSessionDetail> get copyWith => _$ChatSessionDetailCopyWithImpl<ChatSessionDetail>(this as ChatSessionDetail, _$identity);

  /// Serializes this ChatSessionDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatSessionDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.messages, messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,createdAt,updatedAt,isActive,const DeepCollectionEquality().hash(messages));

@override
String toString() {
  return 'ChatSessionDetail(id: $id, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, messages: $messages)';
}


}

/// @nodoc
abstract mixin class $ChatSessionDetailCopyWith<$Res>  {
  factory $ChatSessionDetailCopyWith(ChatSessionDetail value, $Res Function(ChatSessionDetail) _then) = _$ChatSessionDetailCopyWithImpl;
@useResult
$Res call({
 String id, String title,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'is_active') bool isActive, List<ChatMessage> messages
});




}
/// @nodoc
class _$ChatSessionDetailCopyWithImpl<$Res>
    implements $ChatSessionDetailCopyWith<$Res> {
  _$ChatSessionDetailCopyWithImpl(this._self, this._then);

  final ChatSessionDetail _self;
  final $Res Function(ChatSessionDetail) _then;

/// Create a copy of ChatSessionDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? createdAt = null,Object? updatedAt = null,Object? isActive = null,Object? messages = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatSessionDetail].
extension ChatSessionDetailPatterns on ChatSessionDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatSessionDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatSessionDetail() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatSessionDetail value)  $default,){
final _that = this;
switch (_that) {
case _ChatSessionDetail():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatSessionDetail value)?  $default,){
final _that = this;
switch (_that) {
case _ChatSessionDetail() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'is_active')  bool isActive,  List<ChatMessage> messages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatSessionDetail() when $default != null:
return $default(_that.id,_that.title,_that.createdAt,_that.updatedAt,_that.isActive,_that.messages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'is_active')  bool isActive,  List<ChatMessage> messages)  $default,) {final _that = this;
switch (_that) {
case _ChatSessionDetail():
return $default(_that.id,_that.title,_that.createdAt,_that.updatedAt,_that.isActive,_that.messages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'is_active')  bool isActive,  List<ChatMessage> messages)?  $default,) {final _that = this;
switch (_that) {
case _ChatSessionDetail() when $default != null:
return $default(_that.id,_that.title,_that.createdAt,_that.updatedAt,_that.isActive,_that.messages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatSessionDetail implements ChatSessionDetail {
  const _ChatSessionDetail({required this.id, required this.title, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'is_active') required this.isActive, required final  List<ChatMessage> messages}): _messages = messages;
  factory _ChatSessionDetail.fromJson(Map<String, dynamic> json) => _$ChatSessionDetailFromJson(json);

@override final  String id;
@override final  String title;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override@JsonKey(name: 'is_active') final  bool isActive;
 final  List<ChatMessage> _messages;
@override List<ChatMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of ChatSessionDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatSessionDetailCopyWith<_ChatSessionDetail> get copyWith => __$ChatSessionDetailCopyWithImpl<_ChatSessionDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatSessionDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatSessionDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other._messages, _messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,createdAt,updatedAt,isActive,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'ChatSessionDetail(id: $id, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, messages: $messages)';
}


}

/// @nodoc
abstract mixin class _$ChatSessionDetailCopyWith<$Res> implements $ChatSessionDetailCopyWith<$Res> {
  factory _$ChatSessionDetailCopyWith(_ChatSessionDetail value, $Res Function(_ChatSessionDetail) _then) = __$ChatSessionDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String title,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'is_active') bool isActive, List<ChatMessage> messages
});




}
/// @nodoc
class __$ChatSessionDetailCopyWithImpl<$Res>
    implements _$ChatSessionDetailCopyWith<$Res> {
  __$ChatSessionDetailCopyWithImpl(this._self, this._then);

  final _ChatSessionDetail _self;
  final $Res Function(_ChatSessionDetail) _then;

/// Create a copy of ChatSessionDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? createdAt = null,Object? updatedAt = null,Object? isActive = null,Object? messages = null,}) {
  return _then(_ChatSessionDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,
  ));
}


}

// dart format on
