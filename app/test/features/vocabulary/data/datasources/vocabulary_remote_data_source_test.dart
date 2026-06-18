import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:app/core/network/dio_client.dart';
import 'package:app/features/vocabulary/data/datasources/vocabulary_remote_data_source.dart';
import 'package:app/features/vocabulary/data/models/vocabulary_word_model.dart';

@GenerateNiceMocks([MockSpec<DioClient>()])
import 'vocabulary_remote_data_source_test.mocks.dart';

void main() {
  late VocabularyRemoteDataSourceImpl dataSource;
  late MockDioClient mockDioClient;

  setUp(() {
    mockDioClient = MockDioClient();
    dataSource = VocabularyRemoteDataSourceImpl(mockDioClient);
  });

  group('getAvailableWords', () {
    final tWordModel = VocabularyWordModel(
      id: '1',
      word: 'Apple',
      meaning: 'A fruit',
      translation: 'Manzana',
    );

    final tJsonResponse = [
      {
        "id": 1,
        "word": "Apple",
        "meaning": "A fruit",
        "translation": "Manzana"
      }
    ];

    test(
      'should perform a GET request on /words URL and return List of VocabularyWordModel',
      () async {
        // arrange
        when(mockDioClient.get('/words')).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: '/words'),
            data: tJsonResponse,
            statusCode: 200,
          ),
        );

        // act
        final result = await dataSource.getAvailableWords();

        // assert
        verify(mockDioClient.get('/words'));
        expect(result, equals([tWordModel]));
      },
    );

    test(
      'should throw an Exception when the response code is 404 or other',
      () async {
        // arrange
        when(mockDioClient.get('/words')).thenThrow(Exception('Network error'));

        // act
        final call = dataSource.getAvailableWords;

        // assert
        expect(() => call(), throwsException);
      },
    );
  });
}
