import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/main.dart';
import 'package:app/features/vocabulary/domain/entities/vocabulary_word.dart';
import 'package:app/features/vocabulary/domain/usecases/vocabulary_usecases.dart';
import 'package:app/features/vocabulary/presentation/providers/vocabulary_providers.dart';

class FakeGetSavedWords implements GetSavedWords {
  @override
  get repository => throw UnimplementedError();

  @override
  Future<List<VocabularyWord>> call() async => [];
}

class FakeSaveWord implements SaveWord {
  @override
  get repository => throw UnimplementedError();

  @override
  Future<void> call(VocabularyWord word) async {}
}

void main() {
  testWidgets('My Vocabulary screen shows app bar and empty state', (WidgetTester tester) async {
    // Build our app and trigger a frame with mocked dependencies
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          getSavedWordsProvider.overrideWithValue(FakeGetSavedWords()),
          saveWordProvider.overrideWithValue(FakeSaveWord()),
        ],
        child: const LingoBreezeApp(),
      ),
    );

    await tester.pumpAndSettle();

    // Verify that the App Bar title is displayed
    expect(find.text('My Vocabulary'), findsOneWidget);

    // Verify that the empty state text is displayed since there are no saved words
    expect(find.text("You haven't saved any words yet."), findsOneWidget);
  });
}
