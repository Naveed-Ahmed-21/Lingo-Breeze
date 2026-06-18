import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_primary_button.dart';

class EmptyStateWidget extends StatelessWidget {
  final VoidCallback onAddPressed;

  const EmptyStateWidget({
    super.key,
    required this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.menu_book_rounded,
              size: 80,
              color: Colors.grey,
            ),
            const SizedBox(height: 24),
            Text(
              "You haven't saved any words yet.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                  ),
            ),
            const SizedBox(height: 32),
            CustomPrimaryButton(
              text: 'Add Your First Word',
              onPressed: onAddPressed,
            ),
          ],
        ),
      ),
    );
  }
}
