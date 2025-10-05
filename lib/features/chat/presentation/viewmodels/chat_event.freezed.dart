// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent()';
}


}

/// @nodoc
class $ChatEventCopyWith<$Res>  {
$ChatEventCopyWith(ChatEvent _, $Res Function(ChatEvent) __);
}


/// Adds pattern-matching-related methods to [ChatEvent].
extension ChatEventPatterns on ChatEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SendMessage value)?  sendMessage,TResult Function( ClearMessages value)?  clearMessages,TResult Function( ClearError value)?  clearError,TResult Function( LoadSessions value)?  loadSessions,TResult Function( LoadSession value)?  loadSession,TResult Function( DeleteSession value)?  deleteSession,TResult Function( RenameSession value)?  renameSession,TResult Function( ArchiveSession value)?  archiveSession,TResult Function( UnarchiveSession value)?  unarchiveSession,TResult Function( LoadArchivedSessions value)?  loadArchivedSessions,TResult Function( CreateNewSession value)?  createNewSession,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SendMessage() when sendMessage != null:
return sendMessage(_that);case ClearMessages() when clearMessages != null:
return clearMessages(_that);case ClearError() when clearError != null:
return clearError(_that);case LoadSessions() when loadSessions != null:
return loadSessions(_that);case LoadSession() when loadSession != null:
return loadSession(_that);case DeleteSession() when deleteSession != null:
return deleteSession(_that);case RenameSession() when renameSession != null:
return renameSession(_that);case ArchiveSession() when archiveSession != null:
return archiveSession(_that);case UnarchiveSession() when unarchiveSession != null:
return unarchiveSession(_that);case LoadArchivedSessions() when loadArchivedSessions != null:
return loadArchivedSessions(_that);case CreateNewSession() when createNewSession != null:
return createNewSession(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SendMessage value)  sendMessage,required TResult Function( ClearMessages value)  clearMessages,required TResult Function( ClearError value)  clearError,required TResult Function( LoadSessions value)  loadSessions,required TResult Function( LoadSession value)  loadSession,required TResult Function( DeleteSession value)  deleteSession,required TResult Function( RenameSession value)  renameSession,required TResult Function( ArchiveSession value)  archiveSession,required TResult Function( UnarchiveSession value)  unarchiveSession,required TResult Function( LoadArchivedSessions value)  loadArchivedSessions,required TResult Function( CreateNewSession value)  createNewSession,}){
final _that = this;
switch (_that) {
case SendMessage():
return sendMessage(_that);case ClearMessages():
return clearMessages(_that);case ClearError():
return clearError(_that);case LoadSessions():
return loadSessions(_that);case LoadSession():
return loadSession(_that);case DeleteSession():
return deleteSession(_that);case RenameSession():
return renameSession(_that);case ArchiveSession():
return archiveSession(_that);case UnarchiveSession():
return unarchiveSession(_that);case LoadArchivedSessions():
return loadArchivedSessions(_that);case CreateNewSession():
return createNewSession(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SendMessage value)?  sendMessage,TResult? Function( ClearMessages value)?  clearMessages,TResult? Function( ClearError value)?  clearError,TResult? Function( LoadSessions value)?  loadSessions,TResult? Function( LoadSession value)?  loadSession,TResult? Function( DeleteSession value)?  deleteSession,TResult? Function( RenameSession value)?  renameSession,TResult? Function( ArchiveSession value)?  archiveSession,TResult? Function( UnarchiveSession value)?  unarchiveSession,TResult? Function( LoadArchivedSessions value)?  loadArchivedSessions,TResult? Function( CreateNewSession value)?  createNewSession,}){
final _that = this;
switch (_that) {
case SendMessage() when sendMessage != null:
return sendMessage(_that);case ClearMessages() when clearMessages != null:
return clearMessages(_that);case ClearError() when clearError != null:
return clearError(_that);case LoadSessions() when loadSessions != null:
return loadSessions(_that);case LoadSession() when loadSession != null:
return loadSession(_that);case DeleteSession() when deleteSession != null:
return deleteSession(_that);case RenameSession() when renameSession != null:
return renameSession(_that);case ArchiveSession() when archiveSession != null:
return archiveSession(_that);case UnarchiveSession() when unarchiveSession != null:
return unarchiveSession(_that);case LoadArchivedSessions() when loadArchivedSessions != null:
return loadArchivedSessions(_that);case CreateNewSession() when createNewSession != null:
return createNewSession(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String content)?  sendMessage,TResult Function()?  clearMessages,TResult Function()?  clearError,TResult Function()?  loadSessions,TResult Function( String sessionId)?  loadSession,TResult Function( String sessionId)?  deleteSession,TResult Function( String sessionId,  String newTitle)?  renameSession,TResult Function( String sessionId)?  archiveSession,TResult Function( String sessionId)?  unarchiveSession,TResult Function()?  loadArchivedSessions,TResult Function()?  createNewSession,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SendMessage() when sendMessage != null:
return sendMessage(_that.content);case ClearMessages() when clearMessages != null:
return clearMessages();case ClearError() when clearError != null:
return clearError();case LoadSessions() when loadSessions != null:
return loadSessions();case LoadSession() when loadSession != null:
return loadSession(_that.sessionId);case DeleteSession() when deleteSession != null:
return deleteSession(_that.sessionId);case RenameSession() when renameSession != null:
return renameSession(_that.sessionId,_that.newTitle);case ArchiveSession() when archiveSession != null:
return archiveSession(_that.sessionId);case UnarchiveSession() when unarchiveSession != null:
return unarchiveSession(_that.sessionId);case LoadArchivedSessions() when loadArchivedSessions != null:
return loadArchivedSessions();case CreateNewSession() when createNewSession != null:
return createNewSession();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String content)  sendMessage,required TResult Function()  clearMessages,required TResult Function()  clearError,required TResult Function()  loadSessions,required TResult Function( String sessionId)  loadSession,required TResult Function( String sessionId)  deleteSession,required TResult Function( String sessionId,  String newTitle)  renameSession,required TResult Function( String sessionId)  archiveSession,required TResult Function( String sessionId)  unarchiveSession,required TResult Function()  loadArchivedSessions,required TResult Function()  createNewSession,}) {final _that = this;
switch (_that) {
case SendMessage():
return sendMessage(_that.content);case ClearMessages():
return clearMessages();case ClearError():
return clearError();case LoadSessions():
return loadSessions();case LoadSession():
return loadSession(_that.sessionId);case DeleteSession():
return deleteSession(_that.sessionId);case RenameSession():
return renameSession(_that.sessionId,_that.newTitle);case ArchiveSession():
return archiveSession(_that.sessionId);case UnarchiveSession():
return unarchiveSession(_that.sessionId);case LoadArchivedSessions():
return loadArchivedSessions();case CreateNewSession():
return createNewSession();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String content)?  sendMessage,TResult? Function()?  clearMessages,TResult? Function()?  clearError,TResult? Function()?  loadSessions,TResult? Function( String sessionId)?  loadSession,TResult? Function( String sessionId)?  deleteSession,TResult? Function( String sessionId,  String newTitle)?  renameSession,TResult? Function( String sessionId)?  archiveSession,TResult? Function( String sessionId)?  unarchiveSession,TResult? Function()?  loadArchivedSessions,TResult? Function()?  createNewSession,}) {final _that = this;
switch (_that) {
case SendMessage() when sendMessage != null:
return sendMessage(_that.content);case ClearMessages() when clearMessages != null:
return clearMessages();case ClearError() when clearError != null:
return clearError();case LoadSessions() when loadSessions != null:
return loadSessions();case LoadSession() when loadSession != null:
return loadSession(_that.sessionId);case DeleteSession() when deleteSession != null:
return deleteSession(_that.sessionId);case RenameSession() when renameSession != null:
return renameSession(_that.sessionId,_that.newTitle);case ArchiveSession() when archiveSession != null:
return archiveSession(_that.sessionId);case UnarchiveSession() when unarchiveSession != null:
return unarchiveSession(_that.sessionId);case LoadArchivedSessions() when loadArchivedSessions != null:
return loadArchivedSessions();case CreateNewSession() when createNewSession != null:
return createNewSession();case _:
  return null;

}
}

}

/// @nodoc


class SendMessage implements ChatEvent {
  const SendMessage(this.content);
  

 final  String content;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendMessageCopyWith<SendMessage> get copyWith => _$SendMessageCopyWithImpl<SendMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMessage&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString() {
  return 'ChatEvent.sendMessage(content: $content)';
}


}

/// @nodoc
abstract mixin class $SendMessageCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $SendMessageCopyWith(SendMessage value, $Res Function(SendMessage) _then) = _$SendMessageCopyWithImpl;
@useResult
$Res call({
 String content
});




}
/// @nodoc
class _$SendMessageCopyWithImpl<$Res>
    implements $SendMessageCopyWith<$Res> {
  _$SendMessageCopyWithImpl(this._self, this._then);

  final SendMessage _self;
  final $Res Function(SendMessage) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? content = null,}) {
  return _then(SendMessage(
null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClearMessages implements ChatEvent {
  const ClearMessages();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearMessages);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.clearMessages()';
}


}




/// @nodoc


class ClearError implements ChatEvent {
  const ClearError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.clearError()';
}


}




/// @nodoc


class LoadSessions implements ChatEvent {
  const LoadSessions();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadSessions);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.loadSessions()';
}


}




/// @nodoc


class LoadSession implements ChatEvent {
  const LoadSession(this.sessionId);
  

 final  String sessionId;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadSessionCopyWith<LoadSession> get copyWith => _$LoadSessionCopyWithImpl<LoadSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadSession&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId);

@override
String toString() {
  return 'ChatEvent.loadSession(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $LoadSessionCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $LoadSessionCopyWith(LoadSession value, $Res Function(LoadSession) _then) = _$LoadSessionCopyWithImpl;
@useResult
$Res call({
 String sessionId
});




}
/// @nodoc
class _$LoadSessionCopyWithImpl<$Res>
    implements $LoadSessionCopyWith<$Res> {
  _$LoadSessionCopyWithImpl(this._self, this._then);

  final LoadSession _self;
  final $Res Function(LoadSession) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,}) {
  return _then(LoadSession(
null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DeleteSession implements ChatEvent {
  const DeleteSession(this.sessionId);
  

 final  String sessionId;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteSessionCopyWith<DeleteSession> get copyWith => _$DeleteSessionCopyWithImpl<DeleteSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteSession&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId);

@override
String toString() {
  return 'ChatEvent.deleteSession(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $DeleteSessionCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $DeleteSessionCopyWith(DeleteSession value, $Res Function(DeleteSession) _then) = _$DeleteSessionCopyWithImpl;
@useResult
$Res call({
 String sessionId
});




}
/// @nodoc
class _$DeleteSessionCopyWithImpl<$Res>
    implements $DeleteSessionCopyWith<$Res> {
  _$DeleteSessionCopyWithImpl(this._self, this._then);

  final DeleteSession _self;
  final $Res Function(DeleteSession) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,}) {
  return _then(DeleteSession(
null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RenameSession implements ChatEvent {
  const RenameSession(this.sessionId, this.newTitle);
  

 final  String sessionId;
 final  String newTitle;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RenameSessionCopyWith<RenameSession> get copyWith => _$RenameSessionCopyWithImpl<RenameSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RenameSession&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.newTitle, newTitle) || other.newTitle == newTitle));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId,newTitle);

@override
String toString() {
  return 'ChatEvent.renameSession(sessionId: $sessionId, newTitle: $newTitle)';
}


}

/// @nodoc
abstract mixin class $RenameSessionCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $RenameSessionCopyWith(RenameSession value, $Res Function(RenameSession) _then) = _$RenameSessionCopyWithImpl;
@useResult
$Res call({
 String sessionId, String newTitle
});




}
/// @nodoc
class _$RenameSessionCopyWithImpl<$Res>
    implements $RenameSessionCopyWith<$Res> {
  _$RenameSessionCopyWithImpl(this._self, this._then);

  final RenameSession _self;
  final $Res Function(RenameSession) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? newTitle = null,}) {
  return _then(RenameSession(
null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,null == newTitle ? _self.newTitle : newTitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ArchiveSession implements ChatEvent {
  const ArchiveSession(this.sessionId);
  

 final  String sessionId;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArchiveSessionCopyWith<ArchiveSession> get copyWith => _$ArchiveSessionCopyWithImpl<ArchiveSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArchiveSession&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId);

@override
String toString() {
  return 'ChatEvent.archiveSession(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $ArchiveSessionCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $ArchiveSessionCopyWith(ArchiveSession value, $Res Function(ArchiveSession) _then) = _$ArchiveSessionCopyWithImpl;
@useResult
$Res call({
 String sessionId
});




}
/// @nodoc
class _$ArchiveSessionCopyWithImpl<$Res>
    implements $ArchiveSessionCopyWith<$Res> {
  _$ArchiveSessionCopyWithImpl(this._self, this._then);

  final ArchiveSession _self;
  final $Res Function(ArchiveSession) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,}) {
  return _then(ArchiveSession(
null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UnarchiveSession implements ChatEvent {
  const UnarchiveSession(this.sessionId);
  

 final  String sessionId;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnarchiveSessionCopyWith<UnarchiveSession> get copyWith => _$UnarchiveSessionCopyWithImpl<UnarchiveSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnarchiveSession&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId);

@override
String toString() {
  return 'ChatEvent.unarchiveSession(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $UnarchiveSessionCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $UnarchiveSessionCopyWith(UnarchiveSession value, $Res Function(UnarchiveSession) _then) = _$UnarchiveSessionCopyWithImpl;
@useResult
$Res call({
 String sessionId
});




}
/// @nodoc
class _$UnarchiveSessionCopyWithImpl<$Res>
    implements $UnarchiveSessionCopyWith<$Res> {
  _$UnarchiveSessionCopyWithImpl(this._self, this._then);

  final UnarchiveSession _self;
  final $Res Function(UnarchiveSession) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,}) {
  return _then(UnarchiveSession(
null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoadArchivedSessions implements ChatEvent {
  const LoadArchivedSessions();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadArchivedSessions);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.loadArchivedSessions()';
}


}




/// @nodoc


class CreateNewSession implements ChatEvent {
  const CreateNewSession();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateNewSession);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.createNewSession()';
}


}




// dart format on
