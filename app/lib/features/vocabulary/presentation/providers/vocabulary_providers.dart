import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/datasources/vocabulary_local_data_source.dart';
import '../../data/datasources/vocabulary_remote_data_source.dart';
import '../../data/repositories/vocabulary_repository_impl.dart';
import '../../domain/entities/vocabulary_word.dart';
import '../../domain/repositories/vocabulary_repository.dart';
import '../../domain/usecases/vocabulary_usecases.dart';

// Core
final dioClientProvider = Provider<DioClient>((ref) => DioClient());
final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

// Data Sources
final remoteDataSourceProvider = Provider<VocabularyRemoteDataSource>((ref) {
  return VocabularyRemoteDataSourceImpl(ref.read(dioClientProvider));
});

final localDataSourceProvider = Provider<VocabularyLocalDataSource>((ref) {
  return VocabularyLocalDataSourceImpl(ref.read(firestoreProvider));
});

// Repository
final vocabularyRepositoryProvider = Provider<VocabularyRepository>((ref) {
  return VocabularyRepositoryImpl(
    remoteDataSource: ref.read(remoteDataSourceProvider),
    localDataSource: ref.read(localDataSourceProvider),
  );
});

// Use Cases
final getAvailableWordsProvider = Provider<GetAvailableWords>((ref) {
  return GetAvailableWords(ref.read(vocabularyRepositoryProvider));
});

final getSavedWordsProvider = Provider<GetSavedWords>((ref) {
  return GetSavedWords(ref.read(vocabularyRepositoryProvider));
});

final saveWordProvider = Provider<SaveWord>((ref) {
  return SaveWord(ref.read(vocabularyRepositoryProvider));
});

// StateNotifier
class VocabularyState {
  final bool isLoading;
  final List<VocabularyWord> words;
  final String? error;

  VocabularyState({
    this.isLoading = false,
    this.words = const [],
    this.error,
  });

  VocabularyState copyWith({
    bool? isLoading,
    List<VocabularyWord>? words,
    String? error,
  }) {
    return VocabularyState(
      isLoading: isLoading ?? this.isLoading,
      words: words ?? this.words,
      error: error,
    );
  }
}

class VocabularyNotifier extends StateNotifier<VocabularyState> {
  final GetSavedWords getSavedWords;
  final SaveWord saveWordUseCase;

  VocabularyNotifier({
    required this.getSavedWords,
    required this.saveWordUseCase,
  }) : super(VocabularyState()) {
    fetchSavedWords();
  }

  Future<void> fetchSavedWords() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final words = await getSavedWords();
      state = state.copyWith(isLoading: false, words: words, error: null);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> saveWord(VocabularyWord word) async {
    try {
      await saveWordUseCase(word);
      await fetchSavedWords(); // Refresh list after saving
    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }
}

final vocabularyNotifierProvider = StateNotifierProvider<VocabularyNotifier, VocabularyState>((ref) {
  return VocabularyNotifier(
    getSavedWords: ref.read(getSavedWordsProvider),
    saveWordUseCase: ref.read(saveWordProvider),
  );
});

final availableWordsFutureProvider = FutureProvider.autoDispose<List<VocabularyWord>>((ref) async {
  final getWords = ref.read(getAvailableWordsProvider);
  return await getWords();
});
