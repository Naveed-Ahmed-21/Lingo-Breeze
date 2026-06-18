import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:app/features/vocabulary/domain/entities/vocabulary_word.dart';
import 'package:app/features/vocabulary/domain/repositories/vocabulary_repository.dart';
import 'package:app/features/vocabulary/domain/usecases/vocabulary_usecases.dart';

@GenerateNiceMocks([MockSpec<VocabularyRepository>()])
import 'vocabulary_usecases_test.mocks.dart';

void main() {
  late MockVocabularyRepository mockRepository;
  late GetAvailableWords getAvailableWords;
  late GetSavedWords getSavedWords;
  late SaveWord saveWord;

  setUp(() {
    mockRepository = MockVocabularyRepository();
    getAvailableWords = GetAvailableWords(mockRepository);
    getSavedWords = GetSavedWords(mockRepository);
    saveWord = SaveWord(mockRepository);
  });

  final tWord = VocabularyWord(
    id: '1',
    word: 'Apple',
    meaning: 'A fruit',
    translation: 'Manzana',
  );

  final tWordsList = [tWord];

  group('GetAvailableWords', () {
    test('should get available words from the repository', () async {
      // arrange
      when(mockRepository.getAvailableWords())
          .thenAnswer((_) async => tWordsList);
      // act
      final result = await getAvailableWords();
      // assert
      expect(result, tWordsList);
      verify(mockRepository.getAvailableWords());
      verifyNoMoreInteractions(mockRepository);
    });
  });

  group('GetSavedWords', () {
    test('should get saved words from the repository', () async {
      // arrange
      when(mockRepository.getSavedWords())
          .thenAnswer((_) async => tWordsList);
      // act
      final result = await getSavedWords();
      // assert
      expect(result, tWordsList);
      verify(mockRepository.getSavedWords());
      verifyNoMoreInteractions(mockRepository);
    });
  });

  group('SaveWord', () {
    test('should pass the word to the repository to be saved', () async {
      // arrange
      when(mockRepository.saveWord(tWord)).thenAnswer((_) async => {});
      // act
      await saveWord(tWord);
      // assert
      verify(mockRepository.saveWord(tWord));
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
