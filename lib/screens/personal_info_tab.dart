import 'package:flutter/material.dart';
import '../widgets/navigation_buttons.dart';
import '../widgets/section_header.dart';
import '../widgets/form_fields/labeled_input_field.dart';
import 'package:flutter/services.dart';

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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Form(
            key: widget.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
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
                          GestureDetector(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime(2000, 1, 1),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              );
                              if (pickedDate != null) {
                                String formattedDate =
                                    '${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.year}';
                                widget.birthdateController.text = formattedDate;
                                DateTime today = DateTime.now();
                                int age = today.year - pickedDate.year;
                                if (today.month < pickedDate.month ||
                                    (today.month == pickedDate.month &&
                                        today.day < pickedDate.day)) {
                                  age--;
                                }
                                widget.ageController.text = age.toString();
                              }
                            },
                            child: AbsorbPointer(
                              child: TextFormField(
                                controller: widget.birthdateController,
                                decoration: InputDecoration(
                                  hintText: 'mm/dd/yyyy',
                                  filled: true,
                                  fillColor: const Color.fromARGB(
                                    255,
                                    233,
                                    229,
                                    229,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                validator: (value) =>
                                    value == null || value.isEmpty
                                    ? 'Required'
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: LabeledInputField(
                        label: 'Age',
                        controller: widget.ageController,
                        hint: '00',
                        inputType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(2),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                LabeledInputField(
                  label: 'Bio – Describe yourself',
                  controller: widget.bioController,
                  hint: 'Tell us something about yourself...',
                  maxLines: 5,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: NavigationButtons(
          onBack: null,
          onNext: widget.onNext,
          isFirstTab: true,
        ),
      ),
    );
  }
}
