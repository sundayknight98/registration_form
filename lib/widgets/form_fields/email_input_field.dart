import 'package:flutter/material.dart';

class EmailInputField extends StatelessWidget {
  final TextEditingController controller;

  const EmailInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email Address',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'example@gmail.com',
            filled: true,
            fillColor: const Color.fromARGB(255, 233, 229, 229),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!value.endsWith('@gmail.com')) {
              return 'This is not a valid Gmail address';
            }
            return null;
          },
        ),
      ],
    );
  }
}
