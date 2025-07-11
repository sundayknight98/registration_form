import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for input formatters

class LabeledInputField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final int maxLines;
  final TextInputType inputType;
  final List<TextInputFormatter>? inputFormatters; // <-- Added support

  const LabeledInputField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.maxLines = 1,
    this.inputType = TextInputType.text,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          maxLines: maxLines,
          inputFormatters: inputFormatters, // <-- Applied here
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: const Color.fromARGB(255, 233, 229, 229),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) =>
              value == null || value.isEmpty ? 'Required' : null,
        ),
      ],
    );
  }
}
