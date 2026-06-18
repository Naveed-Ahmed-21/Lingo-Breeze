import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/custom_primary_button.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../domain/entities/vocabulary_word.dart';
import '../providers/vocabulary_providers.dart';

class AddWordBottomSheet extends ConsumerStatefulWidget {
  const AddWordBottomSheet({super.key});

  @override
  ConsumerState<AddWordBottomSheet> createState() => _AddWordBottomSheetState();
}

class _AddWordBottomSheetState extends ConsumerState<AddWordBottomSheet> {
  VocabularyWord? selectedWord;
  bool isSaving = false;

  void _saveWord() async {
    if (selectedWord == null) return;
    
    setState(() {
      isSaving = true;
    });

    try {
      await ref.read(vocabularyNotifierProvider.notifier).saveWord(selectedWord!);
      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Word saved successfully!')),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isSaving = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving word: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableWordsAsync = ref.watch(availableWordsFutureProvider);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 24,
        right: 24,
        top: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add New Word',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          availableWordsAsync.when(
            data: (words) {
              if (words.isEmpty) {
                return const Text('No words available from server.');
              }
              return DropdownButtonFormField<VocabularyWord>(
                decoration: InputDecoration(
                  labelText: 'Select a word',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                initialValue: selectedWord,
                items: words.map((word) {
                  return DropdownMenuItem(
                    value: word,
                    child: Text(word.word),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedWord = value;
                  });
                },
              );
            },
            loading: () => const SizedBox(
              height: 60,
              child: LoadingWidget(),
            ),
            error: (err, stack) => Text('Error fetching words: $err',
                style: const TextStyle(color: Colors.red)),
          ),
          const SizedBox(height: 24),
          if (selectedWord != null) ...[
            Text('Meaning: ${selectedWord!.meaning}'),
            const SizedBox(height: 8),
            Text('Translation: ${selectedWord!.translation}'),
            const SizedBox(height: 24),
          ],
          isSaving
              ? const SizedBox(
                  height: 48,
                  child: LoadingWidget(),
                )
              : CustomPrimaryButton(
                  text: 'Save Word',
                  onPressed: selectedWord == null ? () {} : _saveWord,
                ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
