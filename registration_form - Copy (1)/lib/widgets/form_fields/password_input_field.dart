import 'package:flutter/material.dart';

class PasswordInputField extends StatelessWidget {
  final String initialValue;
  final ValueChanged<String> onChanged;

  const PasswordInputField({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
        hintText: 'Enter your password',
      ),
    );
  }
}
