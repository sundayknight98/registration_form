import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_form/bloc/user_identity_bloc.dart';
import 'package:registration_form/bloc/user_identity_event.dart';
import 'package:registration_form/bloc/user_identity_state.dart';

class PersonalInfoTab extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController birthdateController;
  final TextEditingController ageController;
  final TextEditingController bioController;

  const PersonalInfoTab({
    super.key,
    required this.formKey,
    required this.firstNameController,
    required this.lastNameController,
    required this.birthdateController,
    required this.ageController,
    required this.bioController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserIdentityBloc, UserIdentityState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const Text(
                  'Let\'s get to know you!',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(labelText: 'First Name'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                  onChanged: (value) => context.read<UserIdentityBloc>().add(
                    UpdateFirstNameEvent(value),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(labelText: 'Last Name'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                  onChanged: (value) => context.read<UserIdentityBloc>().add(
                    UpdateLastNameEvent(value),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: birthdateController,
                        decoration: const InputDecoration(
                          labelText: 'Birthdate',
                        ),
                        validator: (value) =>
                            value == null || value.isEmpty ? 'Required' : null,
                        onChanged: (value) => context
                            .read<UserIdentityBloc>()
                            .add(UpdateBirthdateEvent(value)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        controller: ageController,
                        decoration: const InputDecoration(labelText: 'Age'),
                        validator: (value) =>
                            value == null || value.isEmpty ? 'Required' : null,
                        keyboardType: TextInputType.number,
                        onChanged: (value) => context
                            .read<UserIdentityBloc>()
                            .add(UpdateAgeEvent(value)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: bioController,
                  decoration: const InputDecoration(labelText: 'Bio'),
                  maxLines: 3,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                  onChanged: (value) => context.read<UserIdentityBloc>().add(
                    UpdateBioEvent(value),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<UserIdentityBloc>().add(NextStepEvent());
                      }
                    },
                    child: const Text('Next'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
