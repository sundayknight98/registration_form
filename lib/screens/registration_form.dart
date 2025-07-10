import 'package:flutter/material.dart';
import 'personal_info_tab.dart';
import 'credentials_tab.dart';
import 'review_tab.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  int _currentStep = 0;

  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _ageController = TextEditingController();
  final _bioController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _nextStep() {
    if (_currentStep == 0 && !_formKey1.currentState!.validate()) return;
    if (_currentStep == 1 && !_formKey2.currentState!.validate()) return;

    if (_currentStep < 2) {
      setState(() => _currentStep++);
    }
  }

  void _backStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    }
  }

  void _submitForm() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Registration Submitted'),
        content: const Text(
          'Your information has been submitted successfully.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Column(
      children: [
        const Text("Registration", style: TextStyle(fontSize: 14)),
        const SizedBox(height: 20),
        Container(
          height: 2,
          color: Colors.grey.shade300,
          width: double.infinity,
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            "${_currentStep + 1} out of 3",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget currentTab;

    switch (_currentStep) {
      case 0:
        currentTab = PersonalInfoTab(
          formKey: _formKey1,
          firstNameController: _firstNameController,
          lastNameController: _lastNameController,
          birthdateController: _birthdateController,
          ageController: _ageController,
          bioController: _bioController,
          onNext: _nextStep,
        );
        break;
      case 1:
        currentTab = CredentialsTab(
          formKey: _formKey2,
          emailController: _emailController,
          passwordController: _passwordController,
          confirmPasswordController: _confirmPasswordController,
          onBack: _backStep,
          onNext: _nextStep,
        );
        break;
      case 2:
        currentTab = ReviewTab(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          birthdate: _birthdateController.text,
          age: _ageController.text,
          bio: _bioController.text,
          email: _emailController.text,
          password: _passwordController.text,
          onBack: _backStep,
          onSubmit: _submitForm,
        );
        break;
      default:
        currentTab = const SizedBox();
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildProgressIndicator(),
            const SizedBox(height: 4),
            Expanded(child: currentTab),
          ],
        ),
      ),
    );
  }
}
