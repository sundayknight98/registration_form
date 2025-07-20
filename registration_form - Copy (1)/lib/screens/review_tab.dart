import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_form/bloc/user_identity_bloc.dart';
import 'package:registration_form/bloc/user_identity_event.dart';
import 'package:registration_form/bloc/user_identity_state.dart';
import 'package:registration_form/widgets/navigation_buttons.dart';
import 'package:registration_form/widgets/review/info_row.dart';
import 'package:registration_form/widgets/section_header.dart';

class ReviewTab extends StatelessWidget {
  const ReviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserIdentityBloc, UserIdentityState>(
      listenWhen: (previous, current) =>
          previous.isSubmissionSuccess != current.isSubmissionSuccess,
      listener: (context, state) {
        if (state.isSubmissionSuccess) {
          showDialog(
            context: context,
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                title: const Text("Success"),
                content: const Text(
                  "Your registration was submitted successfully!",
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.read<UserIdentityBloc>().add(
                        ResetSubmissionEvent(),
                      );
                      Navigator.of(dialogContext).pop();
                    },
                    child: const Text("OK"),
                  ),
                ],
              );
            },
          );
        }
      },
      builder: (context, state) {
        final user = state.user;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                title: 'User Registration',
                subtitle: 'Review your information before submitting.',
              ),
              const Divider(height: 32, thickness: 1),
              const Text(
                'Step 3 out of 3',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              InfoRow(label: 'First Name', value: user.firstName),
              InfoRow(label: 'Last Name', value: user.lastName),
              InfoRow(label: 'Birthdate', value: user.birthdate),
              InfoRow(label: 'Age', value: user.age),
              InfoRow(label: 'Bio', value: user.bio),
              InfoRow(label: 'Email', value: user.email),
              const Spacer(),
              NavigationButtons(
                isFirstStep: false,
                isLastStep: true,
                onBack: () {
                  context.read<UserIdentityBloc>().add(PreviousStepEvent());
                },
                onNext: () {
                  context.read<UserIdentityBloc>().add(SubmitFormEvent());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
