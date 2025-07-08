import 'package:flutter/material.dart';
import '../widgets/navigation_buttons.dart';

class ReviewTab extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController birthdateController;
  final TextEditingController ageController;
  final TextEditingController bioController;
  final TextEditingController emailController;
  final VoidCallback onBack;
  final VoidCallback onSubmit;

  const ReviewTab({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.birthdateController,
    required this.ageController,
    required this.bioController,
    required this.emailController,
    required this.onBack,
    required this.onSubmit,
  });

  Widget _buildInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          text: "$label: ",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('3 out of 3', textAlign: TextAlign.center),
        const SizedBox(height: 12),
        const Text(
          'Review Information',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        _buildInfo('First Name', firstNameController.text),
        _buildInfo('Last Name', lastNameController.text),
        _buildInfo('Birthdate', birthdateController.text),
        _buildInfo('Age', ageController.text),
        _buildInfo('Email', emailController.text),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            text: 'Bio – Describe yourself: ',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: bioController.text,
                style: const TextStyle(fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: NavigationButton(label: 'Back', onPressed: onBack),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: NavigationButton(
                label: 'Continue',
                onPressed: onSubmit,
                isPrimary: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
