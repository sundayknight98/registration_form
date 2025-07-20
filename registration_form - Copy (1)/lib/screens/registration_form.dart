import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_form/bloc/user_identity_bloc.dart';
import 'package:registration_form/bloc/user_identity_event.dart';
import 'package:registration_form/bloc/user_identity_state.dart';
import 'package:registration_form/screens/personal_info_tab.dart';
import 'package:registration_form/screens/credentials_tab.dart';
import 'package:registration_form/screens/review_tab.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Personal Info Controllers
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void _nextStep() {
    context.read<UserIdentityBloc>().add(NextStepEvent());
    _tabController.animateTo(_tabController.index + 1);
  }

  void _previousStep() {
    context.read<UserIdentityBloc>().add(PreviousStepEvent());
    _tabController.animateTo(_tabController.index - 1);
  }

  void _submit() {
    context.read<UserIdentityBloc>().add(SubmitFormEvent());
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Success'),
        content: const Text('Your form has been submitted successfully!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<UserIdentityBloc>().add(ResetSubmissionEvent());
              _tabController.animateTo(0);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _birthdateController.dispose();
    _ageController.dispose();
    _bioController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserIdentityBloc, UserIdentityState>(
      listener: (context, state) {
        if (state.isSubmissionSuccess) {
          _showSuccessDialog(context);
        }
      },
      builder: (context, state) {
        final currentStep = state.currentStep;

        return Scaffold(
          appBar: AppBar(
            title: const Text('User Registration'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Step ${currentStep + 1} of 3',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    PersonalInfoTab(
                      formKey: _formKey,
                      firstNameController: _firstNameController,
                      lastNameController: _lastNameController,
                      birthdateController: _birthdateController,
                      ageController: _ageController,
                      bioController: _bioController,
                    ),
                    CredentialsTab(
                      onNext: _nextStep,
                      onBack: _previousStep,
                      isLastStep: false,
                    ),
                    const ReviewTab(),
                  ],
                ),
              ),
              if (currentStep > 0)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (currentStep > 0)
                        SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: _previousStep,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[400],
                              foregroundColor: Colors.black,
                            ),
                            child: const Text('Back'),
                          ),
                        ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: currentStep == 2 ? _submit : _nextStep,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                          ),
                          child: Text(
                            currentStep == 1
                                ? 'Review'
                                : currentStep == 2
                                ? 'Submit'
                                : 'Next',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
