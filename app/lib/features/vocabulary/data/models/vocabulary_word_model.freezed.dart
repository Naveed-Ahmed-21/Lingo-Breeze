// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vocabulary_word_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VocabularyWordModel {

 String get id; String get word; String get meaning; String get translation;@TimestampConverter() DateTime? get createdAt;
/// Create a copy of VocabularyWordModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VocabularyWordModelCopyWith<VocabularyWordModel> get copyWith => _$VocabularyWordModelCopyWithImpl<VocabularyWordModel>(this as VocabularyWordModel, _$identity);

  /// Serializes this VocabularyWordModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VocabularyWordModel&&(identical(other.id, id) || other.id == id)&&(identical(other.word, word) || other.word == word)&&(identical(other.meaning, meaning) || other.meaning == meaning)&&(identical(other.translation, translation) || other.translation == translation)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,word,meaning,translation,createdAt);

@override
String toString() {
  return 'VocabularyWordModel(id: $id, word: $word, meaning: $meaning, translation: $translation, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $VocabularyWordModelCopyWith<$Res>  {
  factory $VocabularyWordModelCopyWith(VocabularyWordModel value, $Res Function(VocabularyWordModel) _then) = _$VocabularyWordModelCopyWithImpl;
@useResult
$Res call({
 String id, String word, String meaning, String translation,@TimestampConverter() DateTime? createdAt
});




}
/// @nodoc
class _$VocabularyWordModelCopyWithImpl<$Res>
    implements $VocabularyWordModelCopyWith<$Res> {
  _$VocabularyWordModelCopyWithImpl(this._self, this._then);

  final VocabularyWordModel _self;
  final $Res Function(VocabularyWordModel) _then;

/// Create a copy of VocabularyWordModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? word = null,Object? meaning = null,Object? translation = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,meaning: null == meaning ? _self.meaning : meaning // ignore: cast_nullable_to_non_nullable
as String,translation: null == translation ? _self.translation : translation // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [VocabularyWordModel].
extension VocabularyWordModelPatterns on VocabularyWordModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VocabularyWordModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VocabularyWordModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VocabularyWordModel value)  $default,){
final _that = this;
switch (_that) {
case _VocabularyWordModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VocabularyWordModel value)?  $default,){
final _that = this;
switch (_that) {
case _VocabularyWordModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String word,  String meaning,  String translation, @TimestampConverter()  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VocabularyWordModel() when $default != null:
return $default(_that.id,_that.word,_that.meaning,_that.translation,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String word,  String meaning,  String translation, @TimestampConverter()  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _VocabularyWordModel():
return $default(_that.id,_that.word,_that.meaning,_that.translation,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String word,  String meaning,  String translation, @TimestampConverter()  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _VocabularyWordModel() when $default != null:
return $default(_that.id,_that.word,_that.meaning,_that.translation,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VocabularyWordModel extends VocabularyWordModel {
  const _VocabularyWordModel({required this.id, required this.word, required this.meaning, required this.translation, @TimestampConverter() this.createdAt}): super._();
  factory _VocabularyWordModel.fromJson(Map<String, dynamic> json) => _$VocabularyWordModelFromJson(json);

@override final  String id;
@override final  String word;
@override final  String meaning;
@override final  String translation;
@override@TimestampConverter() final  DateTime? createdAt;

/// Create a copy of VocabularyWordModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VocabularyWordModelCopyWith<_VocabularyWordModel> get copyWith => __$VocabularyWordModelCopyWithImpl<_VocabularyWordModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VocabularyWordModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VocabularyWordModel&&(identical(other.id, id) || other.id == id)&&(identical(other.word, word) || other.word == word)&&(identical(other.meaning, meaning) || other.meaning == meaning)&&(identical(other.translation, translation) || other.translation == translation)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,word,meaning,translation,createdAt);

@override
String toString() {
  return 'VocabularyWordModel(id: $id, word: $word, meaning: $meaning, translation: $translation, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$VocabularyWordModelCopyWith<$Res> implements $VocabularyWordModelCopyWith<$Res> {
  factory _$VocabularyWordModelCopyWith(_VocabularyWordModel value, $Res Function(_VocabularyWordModel) _then) = __$VocabularyWordModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String word, String meaning, String translation,@TimestampConverter() DateTime? createdAt
});




}
/// @nodoc
class __$VocabularyWordModelCopyWithImpl<$Res>
    implements _$VocabularyWordModelCopyWith<$Res> {
  __$VocabularyWordModelCopyWithImpl(this._self, this._then);

  final _VocabularyWordModel _self;
  final $Res Function(_VocabularyWordModel) _then;

/// Create a copy of VocabularyWordModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? word = null,Object? meaning = null,Object? translation = null,Object? createdAt = freezed,}) {
  return _then(_VocabularyWordModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,meaning: null == meaning ? _self.meaning : meaning // ignore: cast_nullable_to_non_nullable
as String,translation: null == translation ? _self.translation : translation // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
