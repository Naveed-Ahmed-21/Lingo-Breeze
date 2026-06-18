import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:app/features/vocabulary/domain/entities/vocabulary_word.dart';
import 'package:app/features/vocabulary/domain/usecases/vocabulary_usecases.dart';
import 'package:app/features/vocabulary/presentation/providers/vocabulary_providers.dart';

@GenerateNiceMocks([
  MockSpec<GetSavedWords>(),
  MockSpec<SaveWord>(),
])
import 'vocabulary_notifier_test.mocks.dart';

void main() {
  late MockGetSavedWords mockGetSavedWords;
  late MockSaveWord mockSaveWord;
  late VocabularyNotifier notifier;

  final tWord = VocabularyWord(
    id: '1',
    word: 'Apple',
    meaning: 'A fruit',
    translation: 'Manzana',
  );
  final tWordsList = [tWord];

  setUp(() {
    mockGetSavedWords = MockGetSavedWords();
    mockSaveWord = MockSaveWord();
    // Default mock setup: when notifier is created, it calls fetchSavedWords()
    when(mockGetSavedWords.call()).thenAnswer((_) async => tWordsList);
  });

  group('VocabularyNotifier', () {
    test('should have initial state with words fetched on construction', () async {
      notifier = VocabularyNotifier(
        getSavedWords: mockGetSavedWords,
        saveWordUseCase: mockSaveWord,
      );

      // Give it a moment to run the async initialization
      await Future.delayed(Duration.zero);

      expect(notifier.state.isLoading, isFalse);
      expect(notifier.state.words, equals(tWordsList));
      expect(notifier.state.error, isNull);
      verify(mockGetSavedWords.call()).called(1);
    });

    test('should emit loading then error state when fetch fails', () async {
      when(mockGetSavedWords.call()).thenThrow(Exception('Firestore error'));

      notifier = VocabularyNotifier(
        getSavedWords: mockGetSavedWords,
        saveWordUseCase: mockSaveWord,
      );

      await Future.delayed(Duration.zero);

      expect(notifier.state.isLoading, isFalse);
      expect(notifier.state.words, isEmpty);
      expect(notifier.state.error, contains('Firestore error'));
    });

    test('should call saveWordUseCase and refresh words list on saveWord success', () async {
      notifier = VocabularyNotifier(
        getSavedWords: mockGetSavedWords,
        saveWordUseCase: mockSaveWord,
      );
      await Future.delayed(Duration.zero);

      when(mockSaveWord.call(tWord)).thenAnswer((_) async => {});

      await notifier.saveWord(tWord);

      verify(mockSaveWord.call(tWord)).called(1);
      // It should call getSavedWords twice: once on construction, once after saveWord
      verify(mockGetSavedWords.call()).called(2);
    });
  });
}
