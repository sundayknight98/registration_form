import 'package:flutter/material.dart';

class ConfirmPasswordInputField extends StatelessWidget {
  final TextEditingController controller;
  final String originalPassword;
  final bool obscureText;
  final VoidCallback toggleVisibility;

  const ConfirmPasswordInputField({
    super.key,
    required this.controller,
    required this.originalPassword,
    required this.obscureText,
    required this.toggleVisibility,
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
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please confirm your password';
            }
            if (value != originalPassword) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
      ],
    );
  }
}
