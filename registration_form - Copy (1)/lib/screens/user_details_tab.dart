import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:registration_form/widgets/form_fields/birthdate_with_age_field.dart';
import 'package:registration_form/widgets/form_fields/labeled_input_field.dart';
import 'package:registration_form/widgets/navigation_buttons.dart';
import 'package:registration_form/utils/validators.dart';

class UserDetailsTab extends StatelessWidget {
  final TextEditingController birthdateController;
  final TextEditingController ageController;
  final TextEditingController bioController;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const UserDetailsTab({
    super.key,
    required this.birthdateController,
    required this.ageController,
    required this.bioController,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BirthdateWithAgeField(
            birthdateController: birthdateController,
            ageController: ageController,
          ),
          const SizedBox(height: 16),
          LabeledInputField(
            label: 'Bio',
            hintText: 'Tell us about yourself',
            fieldKey: 'bio',
            controller: bioController,
            keyboardType: TextInputType.multiline,
            maxLines: 4,
            validator: bioValidator,
          ),
          const SizedBox(height: 16),
          NavigationButtons(onBack: onBack, onNext: onNext, isLastStep: false),
        ],
      ),
    );
  }
}
