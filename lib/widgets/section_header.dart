import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            color: Color.fromARGB(255, 163, 160, 160),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
