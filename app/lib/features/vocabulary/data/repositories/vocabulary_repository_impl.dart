import '../../domain/entities/vocabulary_word.dart';
import '../../domain/repositories/vocabulary_repository.dart';
import '../datasources/vocabulary_local_data_source.dart';
import '../datasources/vocabulary_remote_data_source.dart';
import '../models/vocabulary_word_model.dart';

class VocabularyRepositoryImpl implements VocabularyRepository {
  final VocabularyRemoteDataSource remoteDataSource;
  final VocabularyLocalDataSource localDataSource;

  VocabularyRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<VocabularyWord>> getAvailableWords() async {
    final models = await remoteDataSource.getAvailableWords();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<VocabularyWord>> getSavedWords() async {
    final models = await localDataSource.getSavedWords();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<void> saveWord(VocabularyWord word) async {
    final model = VocabularyWordModel.fromEntity(word);
    await localDataSource.saveWord(model);
  }
}
