import 'package:flutter/material.dart';

class NavigationButtons extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onNext;
  final bool isFirstTab;
  final bool isLastTab;
  final String nextLabel;

  const NavigationButtons({
    super.key,
    this.onBack,
    this.onNext,
    this.isFirstTab = false,
    this.isLastTab = false,
    this.nextLabel = 'Next',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isFirstTab
          ? MainAxisAlignment.end
          : MainAxisAlignment.spaceBetween,
      children: [
        if (!isFirstTab)
          ElevatedButton(
            onPressed: onBack,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300],
              foregroundColor: Colors.black87,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Back'),
          ),
        ElevatedButton(
          onPressed: onNext,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(nextLabel),
        ),
      ],
    );
  }
}
