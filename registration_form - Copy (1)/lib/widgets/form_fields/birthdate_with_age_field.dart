import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/user_identity_bloc.dart';
import '../../../bloc/user_identity_event.dart';

class BirthdateWithAgeField extends StatelessWidget {
  final TextEditingController birthdateController;
  final TextEditingController ageController;
  final void Function(String)? onAgeChanged;
  final void Function(String)? onBirthdateChanged;

  const BirthdateWithAgeField({
    super.key,
    required this.birthdateController,
    required this.ageController,
    this.onBirthdateChanged,
    this.onAgeChanged,
  });

  void _pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      final formattedDate =
          '${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.year}';
      birthdateController.text = formattedDate;

      final today = DateTime.now();
      int age = today.year - pickedDate.year;
      if (today.month < pickedDate.month ||
          (today.month == pickedDate.month && today.day < pickedDate.day)) {
        age--;
      }
      ageController.text = age.toString();

      final bloc = context.read<UserIdentityBloc>();
      bloc.add(UpdateBirthdateEvent(formattedDate));
      bloc.add(UpdateAgeEvent(age.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Birthdate
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Birthdate',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: () => _pickDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: birthdateController,
                    decoration: InputDecoration(
                      hintText: 'mm/dd/yyyy',
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
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        // Age
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Age',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '00',
                  filled: true,
                  fillColor: const Color.fromARGB(255, 233, 229, 229),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  context.read<UserIdentityBloc>().add(UpdateAgeEvent(value));
                },
                validator: (value) =>
                    value == null || value.isEmpty ? 'Required' : null,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
