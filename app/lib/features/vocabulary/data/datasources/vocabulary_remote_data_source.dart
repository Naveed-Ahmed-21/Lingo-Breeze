import '../../../../core/network/dio_client.dart';
import '../models/vocabulary_word_model.dart';

abstract class VocabularyRemoteDataSource {
  Future<List<VocabularyWordModel>> getAvailableWords();
}

class VocabularyRemoteDataSourceImpl implements VocabularyRemoteDataSource {
  final DioClient client;

  VocabularyRemoteDataSourceImpl(this.client);

  @override
  Future<List<VocabularyWordModel>> getAvailableWords() async {
    final response = await client.get('/words');
    final List<dynamic> data = response.data;
    return data.map((json) {
      // API returns 'id' as int, our model expects String. So we map it properly here.
      final jsonMap = json as Map<String, dynamic>;
      jsonMap['id'] = jsonMap['id'].toString();
      return VocabularyWordModel.fromJson(jsonMap);
    }).toList();
  }
}
