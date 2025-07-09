import 'package:flutter/material.dart';
import '../widgets/navigation_buttons.dart';

class ReviewTab extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String birthdate;
  final String age;
  final String bio;
  final String email;
  final VoidCallback onBack;
  final VoidCallback onSubmit;

  const ReviewTab({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.birthdate,
    required this.age,
    required this.bio,
    required this.email,
    required this.onBack,
    required this.onSubmit,
  });

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title:", style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(value, style: const TextStyle(color: Colors.black87)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const Text(
            'Review Your Information',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildInfoRow('First Name', firstName),
          _buildInfoRow('Last Name', lastName),
          _buildInfoRow('Birthdate', birthdate),
          _buildInfoRow('Age', age),
          _buildInfoRow('Bio', bio),
          _buildInfoRow('Email', email),
          const SizedBox(height: 20),
          NavigationButtons(
            onBack: onBack,
            onNext: onSubmit,
            isFirstTab: false,
            nextLabel: 'Submit',
          ),
        ],
      ),
    );
  }
}
