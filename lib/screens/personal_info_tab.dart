import 'package:flutter/material.dart';
import '../widgets/form_input.dart';
import '../widgets/navigation_buttons.dart';

class PersonalInfoTab extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController birthdateController;
  final TextEditingController ageController;
  final TextEditingController bioController;
  final VoidCallback onNext;

  const PersonalInfoTab({
    super.key,
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
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '1 out of 3',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          const Text(
            'Personal Information',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'Input your personal information. All fields are required.',
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          const SizedBox(height: 24),

          FormInput(label: 'First Name', controller: firstNameController),
          const SizedBox(height: 16),
          FormInput(label: 'Last Name', controller: lastNameController),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                flex: 2,
                child: FormInput(
                  label: 'Birthdate',
                  controller: birthdateController,
                  hintText: 'mm/dd/yyyy',
                  keyboardType: TextInputType.datetime,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: FormInput(
                  label: 'Age',
                  controller: ageController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          FormInput(
            label: 'Bio – Describe yourself',
            controller: bioController,
            maxLines: 5,
          ),
          const SizedBox(height: 32),

          Align(
            alignment: Alignment.centerRight,
            child: NavigationButtons(showBack: false, onNext: onNext),
          ),
        ],
      ),
    );
  }
}
