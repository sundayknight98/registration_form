import 'package:flutter/material.dart';
import '../widgets/navigation_buttons.dart';

class ReviewTab extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String birthdate;
  final String age;
  final String bio;
  final String email;
  final String password;
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
    required this.password,
    required this.onBack,
    required this.onSubmit,
  });

  Widget _buildInfoTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 16, color: Colors.black),
          children: [
            TextSpan(
              text: '$title: ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value.isEmpty ? 'N/A' : value),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 40),
      child: Form(
        // Optional: You can pass a formKey here if you plan validations
        child: ListView(
          children: [
            const SizedBox(height: 10),
            const Text(
              'Review Information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const Text(
              'Please review all your information before you continue.',
              style: TextStyle(
                color: Color.fromARGB(255, 163, 160, 160),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 22),
            _buildInfoTile("First Name", firstName),
            _buildInfoTile("Last Name", lastName),
            _buildInfoTile("Birthdate", birthdate),
            _buildInfoTile("Age", age),
            _buildInfoTile("Email", email),
            const SizedBox(height: 50),
            _buildInfoTile("Bio", bio),
            const SizedBox(height: 20),
            NavigationButtons(
              onBack: onBack,
              onNext: onSubmit,
              isFirstTab: false,
            ),
          ],
        ),
      ),
    );
  }
}
