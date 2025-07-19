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

  const ReviewTab({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.birthdate,
    required this.age,
    required this.bio,
    required this.email,
    required this.onBack,
  });

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              '$title:',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Expanded(
            child: Text(
              value.isEmpty ? 'N/A' : value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Divider(thickness: 1, height: 32, color: Colors.grey),
          const Center(
            child: Text(
              '3 out of 3',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'Review Information',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const Text(
                      'Please review all your information before you continue.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 163, 160, 160),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 22),
                    _buildInfoRow("First Name", firstName),
                    _buildInfoRow("Last Name", lastName),
                    _buildInfoRow("Birthdate", birthdate),
                    _buildInfoRow("Age", age),
                    _buildInfoRow("Email", email),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          children: [
                            const TextSpan(
                              text: 'Bio - Describe yourself: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: bio.isEmpty ? 'N/A' : bio),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: NavigationButtons(
          onBack: onBack,
          onNext: () {
            final jsonData = {
              "firstName": firstName,
              "lastName": lastName,
              "birthdate": birthdate,
              "age": age,
              "bio": bio,
              "email": email,
            };

            print('User Data as JSON:');
            print(jsonData);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Data submitted successfully!')),
            );
          },
          nextLabel: 'Continue',
        ),
      ),
    );
  }
}
