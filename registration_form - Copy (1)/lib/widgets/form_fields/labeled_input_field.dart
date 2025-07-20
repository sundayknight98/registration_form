import 'package:flutter/material.dart';

class LabeledInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final String fieldKey;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final int maxLines;

  const LabeledInputField({
    super.key,
    required this.label,
    required this.hintText,
    required this.fieldKey,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: Key(fieldKey),
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
