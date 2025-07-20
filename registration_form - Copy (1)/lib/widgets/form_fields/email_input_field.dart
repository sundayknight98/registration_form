import 'package:flutter/material.dart';

class EmailInputField extends StatelessWidget {
  final String initialValue;
  final ValueChanged<String> onChanged;

  const EmailInputField({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
        hintText: 'Enter your email',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
