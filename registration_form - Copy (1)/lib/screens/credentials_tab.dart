import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_identity_bloc.dart';
import '../bloc/user_identity_event.dart';
import '../widgets/form_fields/email_input_field.dart';
import '../widgets/form_fields/password_input_field.dart';
import '../widgets/form_fields/confirm_password_input_field.dart';
import '../widgets/navigation_buttons.dart';
import '../widgets/section_header.dart';

class CredentialsTab extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;
  final bool isLastStep;

  const CredentialsTab({
    super.key,
    required this.onNext,
    required this.onBack,
    required this.isLastStep,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserIdentityBloc>();
    final state = bloc.state;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Credentials',
            subtitle: 'Secure your account by filling in your credentials.',
          ),
          const SizedBox(height: 16),

          EmailInputField(
            initialValue: state.user.email,
            onChanged: (value) {
              bloc.add(UpdateUserFieldEvent(field: 'email', value: value));
            },
          ),
          const SizedBox(height: 16),

          PasswordInputField(
            initialValue: state.user.password,
            onChanged: (value) {
              bloc.add(UpdateUserFieldEvent(field: 'password', value: value));
            },
          ),
          const SizedBox(height: 16),

          ConfirmPasswordInputField(
            initialValue: state.user.confirmPassword,
            password: state.user.password,
            onChanged: (value) {
              bloc.add(
                UpdateUserFieldEvent(field: 'confirmPassword', value: value),
              );
            },
          ),

          const Spacer(),

          NavigationButtons(
            onNext: onNext,
            onBack: onBack,
            isLastStep: isLastStep,
          ),
        ],
      ),
    );
  }
}
