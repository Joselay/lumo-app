// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'concession_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConcessionModel {

 String get id; String get name; String get description;@JsonKey(name: 'concession_type') String get concessionType;@JsonKey(fromJson: _priceFromJson) double get price;@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'is_available') bool get isAvailable;@JsonKey(name: 'is_combo') bool get isCombo;@JsonKey(name: 'combo_items') String? get comboItems;
/// Create a copy of ConcessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConcessionModelCopyWith<ConcessionModel> get copyWith => _$ConcessionModelCopyWithImpl<ConcessionModel>(this as ConcessionModel, _$identity);

  /// Serializes this ConcessionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConcessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.concessionType, concessionType) || other.concessionType == concessionType)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.isCombo, isCombo) || other.isCombo == isCombo)&&(identical(other.comboItems, comboItems) || other.comboItems == comboItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,concessionType,price,imageUrl,isAvailable,isCombo,comboItems);

@override
String toString() {
  return 'ConcessionModel(id: $id, name: $name, description: $description, concessionType: $concessionType, price: $price, imageUrl: $imageUrl, isAvailable: $isAvailable, isCombo: $isCombo, comboItems: $comboItems)';
}


}

/// @nodoc
abstract mixin class $ConcessionModelCopyWith<$Res>  {
  factory $ConcessionModelCopyWith(ConcessionModel value, $Res Function(ConcessionModel) _then) = _$ConcessionModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description,@JsonKey(name: 'concession_type') String concessionType,@JsonKey(fromJson: _priceFromJson) double price,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'is_available') bool isAvailable,@JsonKey(name: 'is_combo') bool isCombo,@JsonKey(name: 'combo_items') String? comboItems
});




}
/// @nodoc
class _$ConcessionModelCopyWithImpl<$Res>
    implements $ConcessionModelCopyWith<$Res> {
  _$ConcessionModelCopyWithImpl(this._self, this._then);

  final ConcessionModel _self;
  final $Res Function(ConcessionModel) _then;

/// Create a copy of ConcessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? concessionType = null,Object? price = null,Object? imageUrl = freezed,Object? isAvailable = null,Object? isCombo = null,Object? comboItems = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,concessionType: null == concessionType ? _self.concessionType : concessionType // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,isCombo: null == isCombo ? _self.isCombo : isCombo // ignore: cast_nullable_to_non_nullable
as bool,comboItems: freezed == comboItems ? _self.comboItems : comboItems // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConcessionModel].
extension ConcessionModelPatterns on ConcessionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConcessionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConcessionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConcessionModel value)  $default,){
final _that = this;
switch (_that) {
case _ConcessionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConcessionModel value)?  $default,){
final _that = this;
switch (_that) {
case _ConcessionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description, @JsonKey(name: 'concession_type')  String concessionType, @JsonKey(fromJson: _priceFromJson)  double price, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'is_combo')  bool isCombo, @JsonKey(name: 'combo_items')  String? comboItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConcessionModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description, @JsonKey(name: 'concession_type')  String concessionType, @JsonKey(fromJson: _priceFromJson)  double price, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'is_combo')  bool isCombo, @JsonKey(name: 'combo_items')  String? comboItems)  $default,) {final _that = this;
switch (_that) {
case _ConcessionModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description, @JsonKey(name: 'concession_type')  String concessionType, @JsonKey(fromJson: _priceFromJson)  double price, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'is_combo')  bool isCombo, @JsonKey(name: 'combo_items')  String? comboItems)?  $default,) {final _that = this;
switch (_that) {
case _ConcessionModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.concessionType,_that.price,_that.imageUrl,_that.isAvailable,_that.isCombo,_that.comboItems);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConcessionModel extends ConcessionModel {
  const _ConcessionModel({required this.id, required this.name, required this.description, @JsonKey(name: 'concession_type') required this.concessionType, @JsonKey(fromJson: _priceFromJson) required this.price, @JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'is_available') required this.isAvailable, @JsonKey(name: 'is_combo') required this.isCombo, @JsonKey(name: 'combo_items') this.comboItems}): super._();
  factory _ConcessionModel.fromJson(Map<String, dynamic> json) => _$ConcessionModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override@JsonKey(name: 'concession_type') final  String concessionType;
@override@JsonKey(fromJson: _priceFromJson) final  double price;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override@JsonKey(name: 'is_available') final  bool isAvailable;
@override@JsonKey(name: 'is_combo') final  bool isCombo;
@override@JsonKey(name: 'combo_items') final  String? comboItems;

/// Create a copy of ConcessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConcessionModelCopyWith<_ConcessionModel> get copyWith => __$ConcessionModelCopyWithImpl<_ConcessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConcessionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConcessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.concessionType, concessionType) || other.concessionType == concessionType)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.isCombo, isCombo) || other.isCombo == isCombo)&&(identical(other.comboItems, comboItems) || other.comboItems == comboItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,concessionType,price,imageUrl,isAvailable,isCombo,comboItems);

@override
String toString() {
  return 'ConcessionModel(id: $id, name: $name, description: $description, concessionType: $concessionType, price: $price, imageUrl: $imageUrl, isAvailable: $isAvailable, isCombo: $isCombo, comboItems: $comboItems)';
}


}

/// @nodoc
abstract mixin class _$ConcessionModelCopyWith<$Res> implements $ConcessionModelCopyWith<$Res> {
  factory _$ConcessionModelCopyWith(_ConcessionModel value, $Res Function(_ConcessionModel) _then) = __$ConcessionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description,@JsonKey(name: 'concession_type') String concessionType,@JsonKey(fromJson: _priceFromJson) double price,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'is_available') bool isAvailable,@JsonKey(name: 'is_combo') bool isCombo,@JsonKey(name: 'combo_items') String? comboItems
});




}
/// @nodoc
class __$ConcessionModelCopyWithImpl<$Res>
    implements _$ConcessionModelCopyWith<$Res> {
  __$ConcessionModelCopyWithImpl(this._self, this._then);

  final _ConcessionModel _self;
  final $Res Function(_ConcessionModel) _then;

/// Create a copy of ConcessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? concessionType = null,Object? price = null,Object? imageUrl = freezed,Object? isAvailable = null,Object? isCombo = null,Object? comboItems = freezed,}) {
  return _then(_ConcessionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,concessionType: null == concessionType ? _self.concessionType : concessionType // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,isCombo: null == isCombo ? _self.isCombo : isCombo // ignore: cast_nullable_to_non_nullable
as bool,comboItems: freezed == comboItems ? _self.comboItems : comboItems // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BookingConcessionInputModel {

@JsonKey(name: 'concession_id') String get concessionId; int get quantity;
/// Create a copy of BookingConcessionInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingConcessionInputModelCopyWith<BookingConcessionInputModel> get copyWith => _$BookingConcessionInputModelCopyWithImpl<BookingConcessionInputModel>(this as BookingConcessionInputModel, _$identity);

  /// Serializes this BookingConcessionInputModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingConcessionInputModel&&(identical(other.concessionId, concessionId) || other.concessionId == concessionId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,concessionId,quantity);

@override
String toString() {
  return 'BookingConcessionInputModel(concessionId: $concessionId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $BookingConcessionInputModelCopyWith<$Res>  {
  factory $BookingConcessionInputModelCopyWith(BookingConcessionInputModel value, $Res Function(BookingConcessionInputModel) _then) = _$BookingConcessionInputModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'concession_id') String concessionId, int quantity
});




}
/// @nodoc
class _$BookingConcessionInputModelCopyWithImpl<$Res>
    implements $BookingConcessionInputModelCopyWith<$Res> {
  _$BookingConcessionInputModelCopyWithImpl(this._self, this._then);

  final BookingConcessionInputModel _self;
  final $Res Function(BookingConcessionInputModel) _then;

/// Create a copy of BookingConcessionInputModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? concessionId = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
concessionId: null == concessionId ? _self.concessionId : concessionId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingConcessionInputModel].
extension BookingConcessionInputModelPatterns on BookingConcessionInputModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingConcessionInputModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingConcessionInputModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingConcessionInputModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingConcessionInputModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingConcessionInputModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingConcessionInputModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'concession_id')  String concessionId,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingConcessionInputModel() when $default != null:
return $default(_that.concessionId,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'concession_id')  String concessionId,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _BookingConcessionInputModel():
return $default(_that.concessionId,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'concession_id')  String concessionId,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _BookingConcessionInputModel() when $default != null:
return $default(_that.concessionId,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingConcessionInputModel implements BookingConcessionInputModel {
  const _BookingConcessionInputModel({@JsonKey(name: 'concession_id') required this.concessionId, required this.quantity});
  factory _BookingConcessionInputModel.fromJson(Map<String, dynamic> json) => _$BookingConcessionInputModelFromJson(json);

@override@JsonKey(name: 'concession_id') final  String concessionId;
@override final  int quantity;

/// Create a copy of BookingConcessionInputModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingConcessionInputModelCopyWith<_BookingConcessionInputModel> get copyWith => __$BookingConcessionInputModelCopyWithImpl<_BookingConcessionInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingConcessionInputModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingConcessionInputModel&&(identical(other.concessionId, concessionId) || other.concessionId == concessionId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,concessionId,quantity);

@override
String toString() {
  return 'BookingConcessionInputModel(concessionId: $concessionId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$BookingConcessionInputModelCopyWith<$Res> implements $BookingConcessionInputModelCopyWith<$Res> {
  factory _$BookingConcessionInputModelCopyWith(_BookingConcessionInputModel value, $Res Function(_BookingConcessionInputModel) _then) = __$BookingConcessionInputModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'concession_id') String concessionId, int quantity
});




}
/// @nodoc
class __$BookingConcessionInputModelCopyWithImpl<$Res>
    implements _$BookingConcessionInputModelCopyWith<$Res> {
  __$BookingConcessionInputModelCopyWithImpl(this._self, this._then);

  final _BookingConcessionInputModel _self;
  final $Res Function(_BookingConcessionInputModel) _then;

/// Create a copy of BookingConcessionInputModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? concessionId = null,Object? quantity = null,}) {
  return _then(_BookingConcessionInputModel(
concessionId: null == concessionId ? _self.concessionId : concessionId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
