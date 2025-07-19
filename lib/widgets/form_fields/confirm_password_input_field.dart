import 'package:flutter/material.dart';

class ConfirmPasswordInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController originalPasswordController;
  final bool obscureText;
  final VoidCallback toggleVisibility;
  final String? Function(String?)? validator;

  const ConfirmPasswordInputField({
    super.key,
    required this.controller,
    required this.originalPasswordController,
    required this.obscureText,
    required this.toggleVisibility,
    this.validator,
  });

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
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            hintText: '********',
            filled: true,
            fillColor: const Color.fromARGB(255, 233, 229, 229),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
              onPressed: toggleVisibility,
            ),
          ),
        ),
      ],
    );
  }
}
