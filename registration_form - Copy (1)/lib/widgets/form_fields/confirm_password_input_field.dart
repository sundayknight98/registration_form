import 'package:flutter/material.dart';

class ConfirmPasswordInputField extends StatelessWidget {
  final String initialValue;
  final String password;
  final ValueChanged<String> onChanged;

  const ConfirmPasswordInputField({
    super.key,
    required this.initialValue,
    required this.password,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        border: const OutlineInputBorder(),
        hintText: 'Re-enter your password',
        errorText: (initialValue.isNotEmpty && initialValue != password)
            ? 'Passwords do not match'
            : null,
      ),
    );
  }
}
