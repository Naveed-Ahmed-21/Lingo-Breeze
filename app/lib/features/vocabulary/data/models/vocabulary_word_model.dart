import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/vocabulary_word.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'vocabulary_word_model.freezed.dart';
part 'vocabulary_word_model.g.dart';

class TimestampConverter implements JsonConverter<DateTime?, Object?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Object? json) {
    if (json is Timestamp) {
      return json.toDate();
    } else if (json is String) {
      return DateTime.tryParse(json);
    }
    return null;
  }

  @override
  Object? toJson(DateTime? object) {
    if (object == null) return null;
    return Timestamp.fromDate(object);
  }
}

@freezed
abstract class VocabularyWordModel with _$VocabularyWordModel {
  const VocabularyWordModel._();

  const factory VocabularyWordModel({
    required String id,
    required String word,
    required String meaning,
    required String translation,
    @TimestampConverter() DateTime? createdAt,
  }) = _VocabularyWordModel;

  factory VocabularyWordModel.fromJson(Map<String, dynamic> json) =>
      _$VocabularyWordModelFromJson(json);

  factory VocabularyWordModel.fromEntity(VocabularyWord entity) {
    return VocabularyWordModel(
      id: entity.id,
      word: entity.word,
      meaning: entity.meaning,
      translation: entity.translation,
      createdAt: entity.createdAt,
    );
  }

  VocabularyWord toEntity() {
    return VocabularyWord(
      id: id,
      word: word,
      meaning: meaning,
      translation: translation,
      createdAt: createdAt,
    );
  }
}
