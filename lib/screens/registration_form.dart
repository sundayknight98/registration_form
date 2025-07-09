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
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final _personalFormKey = GlobalKey<FormState>();
  final _credentialsFormKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _ageController = TextEditingController();
  final _bioController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _nextPage() {
    if (_currentPage == 0 && !_personalFormKey.currentState!.validate()) return;
    if (_currentPage == 1 && !_credentialsFormKey.currentState!.validate())
      return;

    if (_currentPage < 2) {
      setState(() => _currentPage++);
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() => _currentPage--);
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _submit() {
    if (_personalFormKey.currentState!.validate() &&
        _credentialsFormKey.currentState!.validate()) {
      print('First Name: ${_firstNameController.text}');
      print('Last Name: ${_lastNameController.text}');
      print('Birthdate: ${_birthdateController.text}');
      print('Age: ${_ageController.text}');
      print('Bio: ${_bioController.text}');
      print('Email: ${_emailController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FD),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Registration',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '${_currentPage + 1} out of 3',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const Divider(height: 30),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  PersonalInfoTab(
                    formKey: _personalFormKey,
                    firstNameController: _firstNameController,
                    lastNameController: _lastNameController,
                    birthdateController: _birthdateController,
                    ageController: _ageController,
                    bioController: _bioController,
                    onNext: _nextPage,
                  ),
                  CredentialsTab(
                    formKey: _credentialsFormKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    confirmPasswordController: _confirmPasswordController,
                    onBack: _previousPage,
                    onNext: _nextPage,
                  ),
                  ReviewTab(
                    firstName: _firstNameController.text,
                    lastName: _lastNameController.text,
                    birthdate: _birthdateController.text,
                    age: _ageController.text,
                    email: _emailController.text,
                    bio: _bioController.text,
                    onBack: _previousPage,
                    onSubmit: _submit,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
