import 'package:flutter/services.dart';

class TitleCaseFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    final selection = newValue.selection;

    if (text.isEmpty) return newValue;

    final words = text.split(' ');
    final formattedWords = words
        .map((word) {
          if (word.isEmpty) return word;
          return word[0].toUpperCase() + word.substring(1).toLowerCase();
        })
        .join(' ');

    return TextEditingValue(text: formattedWords, selection: selection);
  }
}
