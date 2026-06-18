// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_word_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VocabularyWordModel _$VocabularyWordModelFromJson(Map<String, dynamic> json) =>
    _VocabularyWordModel(
      id: json['id'] as String,
      word: json['word'] as String,
      meaning: json['meaning'] as String,
      translation: json['translation'] as String,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$VocabularyWordModelToJson(
  _VocabularyWordModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'word': instance.word,
  'meaning': instance.meaning,
  'translation': instance.translation,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
};
