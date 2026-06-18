import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/error_state_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../providers/vocabulary_providers.dart';
import '../widgets/add_word_bottom_sheet.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/vocabulary_card.dart';

class VocabularyScreen extends ConsumerWidget {
  const VocabularyScreen({super.key});

  void _showAddWordBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const AddWordBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(vocabularyNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Vocabulary'),
        toolbarHeight: 60,
      ),
      body: _buildBody(context, ref, state),
      floatingActionButton: state.words.isNotEmpty
          ? FloatingActionButton(
              onPressed: () => _showAddWordBottomSheet(context),
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, VocabularyState state) {
    if (state.isLoading && state.words.isEmpty) {
      return const LoadingWidget();
    }

    if (state.error != null && state.words.isEmpty) {
      return ErrorStateWidget(
        errorMessage: state.error!,
        onRetry: () => ref.read(vocabularyNotifierProvider.notifier).fetchSavedWords(),
      );
    }

    if (state.words.isEmpty) {
      return EmptyStateWidget(
        onAddPressed: () => _showAddWordBottomSheet(context),
      );
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(vocabularyNotifierProvider.notifier).fetchSavedWords(),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: state.words.length,
        itemBuilder: (context, index) {
          final word = state.words[index];
          return VocabularyCard(word: word);
        },
      ),
    );
  }
}
