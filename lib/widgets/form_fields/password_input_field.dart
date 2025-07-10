import 'package:flutter/material.dart';

class PasswordInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback toggleVisibility;

  const PasswordInputField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.toggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
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
              return 'Please enter your password';
            }

            final password = value.trim();
            List<String> errors = [];

            if (password.length < 8) {
              errors.add('• At least 8 characters');
            }
            if (!RegExp(r'[A-Z]').hasMatch(password)) {
              errors.add('• At least one uppercase letter');
            }
            if (!RegExp(r'[a-z]').hasMatch(password)) {
              errors.add('• At least one lowercase letter');
            }
            if (!RegExp(r'[0-9]').hasMatch(password)) {
              errors.add('• At least one number');
            }
            if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password)) {
              errors.add('• At least one special character');
            }

            if (errors.isNotEmpty) {
              return 'Password must have:\n${errors.join('\n')}';
            }

            return null;
          },
        ),
      ],
    );
  }
}
