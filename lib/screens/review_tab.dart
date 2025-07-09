import 'package:flutter/material.dart';
import '../widgets/navigation_buttons.dart';

class ReviewTab extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onSubmit;
  final String firstName;
  final String lastName;
  final String birthdate;
  final String age;
  final String bio;
  final String email;

  const ReviewTab({
    super.key,
    required this.onBack,
    required this.onSubmit,
    required this.firstName,
    required this.lastName,
    required this.birthdate,
    required this.age,
    required this.bio,
    required this.email,
  });

  Widget _buildReviewItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Text(value, style: const TextStyle(fontSize: 15)),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '3 out of 3',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          const Text(
            'Review Details',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'Please double-check your entries.',
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildReviewItem('First Name', firstName),
                  _buildReviewItem('Last Name', lastName),
                  _buildReviewItem('Birthdate', birthdate),
                  _buildReviewItem('Age', age),
                  _buildReviewItem('Short Bio', bio),
                  _buildReviewItem('Email', email),
                ],
              ),
            ),
          ),
          NavigationButtons(
            onBack: onBack,
            onNext: onSubmit,
            nextLabel: 'Submit',
          ),
        ],
      ),
    );
  }
}
