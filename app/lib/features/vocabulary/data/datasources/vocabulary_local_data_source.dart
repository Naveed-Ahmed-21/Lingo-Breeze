import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/vocabulary_word_model.dart';

abstract class VocabularyLocalDataSource {
  Future<List<VocabularyWordModel>> getSavedWords();
  Future<void> saveWord(VocabularyWordModel word);
}

class VocabularyLocalDataSourceImpl implements VocabularyLocalDataSource {
  final FirebaseFirestore firestore;

  VocabularyLocalDataSourceImpl(this.firestore);

  @override
  Future<List<VocabularyWordModel>> getSavedWords() async {
    final snapshot = await firestore
        .collection('vocabulary')
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs.map((doc) => VocabularyWordModel.fromJson(doc.data())).toList();
  }

  @override
  Future<void> saveWord(VocabularyWordModel word) async {
    final docRef = firestore.collection('vocabulary').doc();
    final wordWithIdAndDate = word.copyWith(
      id: docRef.id,
      createdAt: DateTime.now(),
    );
    await docRef.set(wordWithIdAndDate.toJson());
  }
}
