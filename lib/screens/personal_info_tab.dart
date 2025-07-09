import 'package:flutter/material.dart';
import '../widgets/navigation_buttons.dart';

class PersonalInfoTab extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController birthdateController;
  final TextEditingController ageController;
  final TextEditingController bioController;
  final VoidCallback onNext;

  const PersonalInfoTab({
    super.key,
    required this.formKey,
    required this.firstNameController,
    required this.lastNameController,
    required this.birthdateController,
    required this.ageController,
    required this.bioController,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            const SizedBox(height: 10),
            const Center(
              child: Text(
                '1 out of 3',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'Personal Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(height: 4),
            const Center(
              child: Text(
                'Input your personal information. All fields are required.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: firstNameController,
              decoration: InputDecoration(
                labelText: 'First Name',
                hintText: 'Enter first name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) =>
                  value == null || value.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: lastNameController,
              decoration: InputDecoration(
                labelText: 'Last Name',
                hintText: 'Enter last name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) =>
                  value == null || value.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: birthdateController,
                    decoration: InputDecoration(
                      labelText: 'Birthdate',
                      hintText: 'mm/dd/yyyy',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Required' : null,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: ageController,
                    decoration: InputDecoration(
                      labelText: 'Age',
                      hintText: '00',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Required' : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: bioController,
              decoration: InputDecoration(
                labelText: 'Bio – Describe yourself',
                hintText: 'Tell us something about yourself...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              maxLines: 3,
              validator: (value) =>
                  value == null || value.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 20),
            NavigationButtons(onBack: null, onNext: onNext, isFirstTab: true),
          ],
        ),
      ),
    );
  }
}
