import 'package:flutter/material.dart';
import '../widgets/navigation_buttons.dart';
import '../widgets/section_header.dart';
import '../widgets/form_fields/labeled_input_field.dart';
import '../widgets/form_fields/birthdate_with_age_field.dart'; // ← NEW

class PersonalInfoTab extends StatefulWidget {
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
  State<PersonalInfoTab> createState() => _PersonalInfoTabState();
}

class _PersonalInfoTabState extends State<PersonalInfoTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 40),
      child: Form(
        key: widget.formKey,
        child: ListView(
          children: [
            const SizedBox(height: 10),
            const SectionHeader(
              title: 'Personal Information',
              subtitle:
                  'Input your personal information. All fields are required.',
            ),
            const SizedBox(height: 20),

            LabeledInputField(
              label: 'First Name',
              controller: widget.firstNameController,
              hint: 'Enter first name',
            ),
            const SizedBox(height: 12),

            LabeledInputField(
              label: 'Last Name',
              controller: widget.lastNameController,
              hint: 'Enter last name',
            ),
            const SizedBox(height: 12),

            BirthdateWithAgeField(
              birthdateController: widget.birthdateController,
              ageController: widget.ageController,
            ),
            const SizedBox(height: 12),

            LabeledInputField(
              label: 'Bio – Describe yourself',
              controller: widget.bioController,
              hint: 'Tell us something about yourself...',
              maxLines: 3,
            ),

            const SizedBox(height: 20),
            NavigationButtons(
              onBack: null,
              onNext: widget.onNext,
              isFirstTab: true,
            ),
          ],
        ),
      ),
    );
  }
}
