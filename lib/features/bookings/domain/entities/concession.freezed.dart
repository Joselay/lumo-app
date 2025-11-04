// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'concession.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Concession {

 String get id; String get name; String get description; ConcessionType get concessionType; double get price; String? get imageUrl; bool get isAvailable; bool get isCombo; String? get comboItems;
/// Create a copy of Concession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConcessionCopyWith<Concession> get copyWith => _$ConcessionCopyWithImpl<Concession>(this as Concession, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Concession&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.concessionType, concessionType) || other.concessionType == concessionType)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.isCombo, isCombo) || other.isCombo == isCombo)&&(identical(other.comboItems, comboItems) || other.comboItems == comboItems));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,concessionType,price,imageUrl,isAvailable,isCombo,comboItems);

@override
String toString() {
  return 'Concession(id: $id, name: $name, description: $description, concessionType: $concessionType, price: $price, imageUrl: $imageUrl, isAvailable: $isAvailable, isCombo: $isCombo, comboItems: $comboItems)';
}


}

/// @nodoc
abstract mixin class $ConcessionCopyWith<$Res>  {
  factory $ConcessionCopyWith(Concession value, $Res Function(Concession) _then) = _$ConcessionCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, ConcessionType concessionType, double price, String? imageUrl, bool isAvailable, bool isCombo, String? comboItems
});




}
/// @nodoc
class _$ConcessionCopyWithImpl<$Res>
    implements $ConcessionCopyWith<$Res> {
  _$ConcessionCopyWithImpl(this._self, this._then);

  final Concession _self;
  final $Res Function(Concession) _then;

/// Create a copy of Concession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? concessionType = null,Object? price = null,Object? imageUrl = freezed,Object? isAvailable = null,Object? isCombo = null,Object? comboItems = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,concessionType: null == concessionType ? _self.concessionType : concessionType // ignore: cast_nullable_to_non_nullable
as ConcessionType,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,isCombo: null == isCombo ? _self.isCombo : isCombo // ignore: cast_nullable_to_non_nullable
as bool,comboItems: freezed == comboItems ? _self.comboItems : comboItems // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Concession].
extension ConcessionPatterns on Concession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Concession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Concession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Concession value)  $default,){
final _that = this;
switch (_that) {
case _Concession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Concession value)?  $default,){
final _that = this;
switch (_that) {
case _Concession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  ConcessionType concessionType,  double price,  String? imageUrl,  bool isAvailable,  bool isCombo,  String? comboItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Concession() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.concessionType,_that.price,_that.imageUrl,_that.isAvailable,_that.isCombo,_that.comboItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  ConcessionType concessionType,  double price,  String? imageUrl,  bool isAvailable,  bool isCombo,  String? comboItems)  $default,) {final _that = this;
switch (_that) {
case _Concession():
return $default(_that.id,_that.name,_that.description,_that.concessionType,_that.price,_that.imageUrl,_that.isAvailable,_that.isCombo,_that.comboItems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  ConcessionType concessionType,  double price,  String? imageUrl,  bool isAvailable,  bool isCombo,  String? comboItems)?  $default,) {final _that = this;
switch (_that) {
case _Concession() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.concessionType,_that.price,_that.imageUrl,_that.isAvailable,_that.isCombo,_that.comboItems);case _:
  return null;

}
}

}

/// @nodoc


class _Concession implements Concession {
  const _Concession({required this.id, required this.name, required this.description, required this.concessionType, required this.price, this.imageUrl, required this.isAvailable, required this.isCombo, this.comboItems});
  

@override final  String id;
@override final  String name;
@override final  String description;
@override final  ConcessionType concessionType;
@override final  double price;
@override final  String? imageUrl;
@override final  bool isAvailable;
@override final  bool isCombo;
@override final  String? comboItems;

/// Create a copy of Concession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConcessionCopyWith<_Concession> get copyWith => __$ConcessionCopyWithImpl<_Concession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Concession&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.concessionType, concessionType) || other.concessionType == concessionType)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.isCombo, isCombo) || other.isCombo == isCombo)&&(identical(other.comboItems, comboItems) || other.comboItems == comboItems));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,concessionType,price,imageUrl,isAvailable,isCombo,comboItems);

@override
String toString() {
  return 'Concession(id: $id, name: $name, description: $description, concessionType: $concessionType, price: $price, imageUrl: $imageUrl, isAvailable: $isAvailable, isCombo: $isCombo, comboItems: $comboItems)';
}


}

/// @nodoc
abstract mixin class _$ConcessionCopyWith<$Res> implements $ConcessionCopyWith<$Res> {
  factory _$ConcessionCopyWith(_Concession value, $Res Function(_Concession) _then) = __$ConcessionCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, ConcessionType concessionType, double price, String? imageUrl, bool isAvailable, bool isCombo, String? comboItems
});




}
/// @nodoc
class __$ConcessionCopyWithImpl<$Res>
    implements _$ConcessionCopyWith<$Res> {
  __$ConcessionCopyWithImpl(this._self, this._then);

  final _Concession _self;
  final $Res Function(_Concession) _then;

/// Create a copy of Concession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? concessionType = null,Object? price = null,Object? imageUrl = freezed,Object? isAvailable = null,Object? isCombo = null,Object? comboItems = freezed,}) {
  return _then(_Concession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,concessionType: null == concessionType ? _self.concessionType : concessionType // ignore: cast_nullable_to_non_nullable
as ConcessionType,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,isCombo: null == isCombo ? _self.isCombo : isCombo // ignore: cast_nullable_to_non_nullable
as bool,comboItems: freezed == comboItems ? _self.comboItems : comboItems // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ConcessionSelection {

 Concession get concession; int get quantity;
/// Create a copy of ConcessionSelection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConcessionSelectionCopyWith<ConcessionSelection> get copyWith => _$ConcessionSelectionCopyWithImpl<ConcessionSelection>(this as ConcessionSelection, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConcessionSelection&&(identical(other.concession, concession) || other.concession == concession)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,concession,quantity);

@override
String toString() {
  return 'ConcessionSelection(concession: $concession, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $ConcessionSelectionCopyWith<$Res>  {
  factory $ConcessionSelectionCopyWith(ConcessionSelection value, $Res Function(ConcessionSelection) _then) = _$ConcessionSelectionCopyWithImpl;
@useResult
$Res call({
 Concession concession, int quantity
});


$ConcessionCopyWith<$Res> get concession;

}
/// @nodoc
class _$ConcessionSelectionCopyWithImpl<$Res>
    implements $ConcessionSelectionCopyWith<$Res> {
  _$ConcessionSelectionCopyWithImpl(this._self, this._then);

  final ConcessionSelection _self;
  final $Res Function(ConcessionSelection) _then;

/// Create a copy of ConcessionSelection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? concession = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
concession: null == concession ? _self.concession : concession // ignore: cast_nullable_to_non_nullable
as Concession,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ConcessionSelection
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConcessionCopyWith<$Res> get concession {
  
  return $ConcessionCopyWith<$Res>(_self.concession, (value) {
    return _then(_self.copyWith(concession: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConcessionSelection].
extension ConcessionSelectionPatterns on ConcessionSelection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConcessionSelection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConcessionSelection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConcessionSelection value)  $default,){
final _that = this;
switch (_that) {
case _ConcessionSelection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConcessionSelection value)?  $default,){
final _that = this;
switch (_that) {
case _ConcessionSelection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Concession concession,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConcessionSelection() when $default != null:
return $default(_that.concession,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Concession concession,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _ConcessionSelection():
return $default(_that.concession,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Concession concession,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _ConcessionSelection() when $default != null:
return $default(_that.concession,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc


class _ConcessionSelection extends ConcessionSelection {
  const _ConcessionSelection({required this.concession, required this.quantity}): super._();
  

@override final  Concession concession;
@override final  int quantity;

/// Create a copy of ConcessionSelection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConcessionSelectionCopyWith<_ConcessionSelection> get copyWith => __$ConcessionSelectionCopyWithImpl<_ConcessionSelection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConcessionSelection&&(identical(other.concession, concession) || other.concession == concession)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,concession,quantity);

@override
String toString() {
  return 'ConcessionSelection(concession: $concession, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$ConcessionSelectionCopyWith<$Res> implements $ConcessionSelectionCopyWith<$Res> {
  factory _$ConcessionSelectionCopyWith(_ConcessionSelection value, $Res Function(_ConcessionSelection) _then) = __$ConcessionSelectionCopyWithImpl;
@override @useResult
$Res call({
 Concession concession, int quantity
});


@override $ConcessionCopyWith<$Res> get concession;

}
/// @nodoc
class __$ConcessionSelectionCopyWithImpl<$Res>
    implements _$ConcessionSelectionCopyWith<$Res> {
  __$ConcessionSelectionCopyWithImpl(this._self, this._then);

  final _ConcessionSelection _self;
  final $Res Function(_ConcessionSelection) _then;

/// Create a copy of ConcessionSelection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? concession = null,Object? quantity = null,}) {
  return _then(_ConcessionSelection(
concession: null == concession ? _self.concession : concession // ignore: cast_nullable_to_non_nullable
as Concession,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ConcessionSelection
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConcessionCopyWith<$Res> get concession {
  
  return $ConcessionCopyWith<$Res>(_self.concession, (value) {
    return _then(_self.copyWith(concession: value));
  });
}
}

// dart format on
