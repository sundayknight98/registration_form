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
      padding: const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 40),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            const SizedBox(height: 10),
            const Text(
              'Personal Information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const Text(
              'Input your personal information. All fields are required.',
              style: TextStyle(
                color: Color.fromARGB(255, 163, 160, 160),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),

            // First Name
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'First Name',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    hintText: 'Enter first name',
                    filled: true,
                    fillColor: Color.fromARGB(255, 233, 229, 229),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Last Name
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Last Name',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    hintText: 'Enter last name',
                    filled: true,
                    fillColor: Color.fromARGB(255, 233, 229, 229),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Birthdate and Age
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Birthdate',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: birthdateController,
                        decoration: InputDecoration(
                          hintText: 'mm/dd/yyyy',
                          filled: true,
                          fillColor: Color.fromARGB(255, 233, 229, 229),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) =>
                            value == null || value.isEmpty ? 'Required' : null,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Age',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '00',
                          filled: true,
                          fillColor: Color.fromARGB(255, 233, 229, 229),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) =>
                            value == null || value.isEmpty ? 'Required' : null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Bio
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bio – Describe yourself',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: bioController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Tell us something about yourself...',
                    filled: true,
                    fillColor: Color.fromARGB(255, 233, 229, 229),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
              ],
            ),
            const SizedBox(height: 20),
            NavigationButtons(onBack: null, onNext: onNext, isFirstTab: true),
          ],
        ),
      ),
    );
  }
}
