import 'package:flutter/material.dart';
import '../widgets/navigation_buttons.dart';

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
            _buildLabeledField(
              label: 'First Name',
              controller: widget.firstNameController,
              hint: 'Enter first name',
            ),

            const SizedBox(height: 12),

            // Last Name
            _buildLabeledField(
              label: 'Last Name',
              controller: widget.lastNameController,
              hint: 'Enter last name',
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

                            // Age calculation
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
                            validator: (value) => value == null || value.isEmpty
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
                  child: _buildLabeledField(
                    label: 'Age',
                    controller: widget.ageController,
                    hint: '00',
                    inputType: TextInputType.number,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Bio
            _buildLabeledField(
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

  Widget _buildLabeledField({
    required String label,
    required TextEditingController controller,
    String? hint,
    int maxLines = 1,
    TextInputType inputType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: inputType,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: const Color.fromARGB(255, 233, 229, 229),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) =>
              value == null || value.isEmpty ? 'Required' : null,
        ),
      ],
    );
  }
}
