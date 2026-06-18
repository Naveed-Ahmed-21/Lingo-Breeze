import '../entities/vocabulary_word.dart';

abstract class VocabularyRepository {
  Future<List<VocabularyWord>> getAvailableWords();
  Future<List<VocabularyWord>> getSavedWords();
  Future<void> saveWord(VocabularyWord word);
}
