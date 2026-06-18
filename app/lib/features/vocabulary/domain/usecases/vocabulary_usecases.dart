import '../entities/vocabulary_word.dart';
import '../repositories/vocabulary_repository.dart';

class GetAvailableWords {
  final VocabularyRepository repository;

  GetAvailableWords(this.repository);

  Future<List<VocabularyWord>> call() async {
    return await repository.getAvailableWords();
  }
}

class GetSavedWords {
  final VocabularyRepository repository;

  GetSavedWords(this.repository);

  Future<List<VocabularyWord>> call() async {
    return await repository.getSavedWords();
  }
}

class SaveWord {
  final VocabularyRepository repository;

  SaveWord(this.repository);

  Future<void> call(VocabularyWord word) async {
    return await repository.saveWord(word);
  }
}
