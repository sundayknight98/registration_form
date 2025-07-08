import 'package:flutter/material.dart';
import '../widgets/form_input.dart';
import '../widgets/navigation_buttons.dart';

class PersonalTab extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController birthdateController;
  final TextEditingController ageController;
  final TextEditingController bioController;
  final VoidCallback onNext;
  final GlobalKey<FormState> formKey;

  const PersonalTab({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.birthdateController,
    required this.ageController,
    required this.bioController,
    required this.onNext,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('1 out of 3', textAlign: TextAlign.center),
        const SizedBox(height: 12),
        const Text(
          'Personal Information',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Form(
          key: formKey,
          child: Column(
            children: [
              FormFieldWidget(
                controller: firstNameController,
                hint: 'First Name',
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              FormFieldWidget(
                controller: lastNameController,
                hint: 'Last Name',
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: FormFieldWidget(
                      controller: birthdateController,
                      hint: 'mm/dd/yyyy',
                      keyboardType: TextInputType.datetime,
                      validator: (val) => val!.isEmpty ? 'Required' : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: FormFieldWidget(
                      controller: ageController,
                      hint: 'Age',
                      keyboardType: TextInputType.number,
                      validator: (val) => val!.isEmpty ? 'Required' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              FormFieldWidget(
                controller: bioController,
                hint: 'Bio – Describe yourself',
                maxLines: 4,
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 24),
              NavigationButton(
                label: 'Next',
                onPressed: onNext,
                isPrimary: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
