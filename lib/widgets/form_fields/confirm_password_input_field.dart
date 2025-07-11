import 'package:flutter/material.dart';

class ConfirmPasswordInputField extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController originalPasswordController;
  final bool obscureText;
  final VoidCallback toggleVisibility;

  const ConfirmPasswordInputField({
    super.key,
    required this.controller,
    required this.originalPasswordController,
    required this.obscureText,
    required this.toggleVisibility,
  });

  @override
  State<ConfirmPasswordInputField> createState() =>
      _ConfirmPasswordInputFieldState();
}

class _ConfirmPasswordInputFieldState extends State<ConfirmPasswordInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Confirm Password',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            hintText: '********',
            filled: true,
            fillColor: const Color.fromARGB(255, 233, 229, 229),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                widget.obscureText ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: widget.toggleVisibility,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please confirm your password';
            }
            if (value != widget.originalPasswordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
      ],
    );
  }
}
