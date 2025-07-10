import 'package:flutter/material.dart';

class NavigationButtons extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback onNext;
  final bool isFirstTab;

  const NavigationButtons({
    super.key,
    this.onBack,
    required this.onNext,
    this.isFirstTab = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!isFirstTab)
            Expanded(
              child: ElevatedButton(
                onPressed: onBack,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 167, 167, 167),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Back'),
              ),
            ),
          if (!isFirstTab) const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}
