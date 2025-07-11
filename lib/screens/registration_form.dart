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
  int _currentTabIndex = 0;

  // Controllers
  final _personalInfoFormKey = GlobalKey<FormState>();
  final _credentialsFormKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void _goToNextTab() {
    if (_currentTabIndex == 0 &&
        _personalInfoFormKey.currentState!.validate()) {
      setState(() => _currentTabIndex = 1);
    } else if (_currentTabIndex == 1 &&
        _credentialsFormKey.currentState!.validate()) {
      setState(() => _currentTabIndex = 2);
    }
  }

  void _goToPreviousTab() {
    if (_currentTabIndex > 0) {
      setState(() => _currentTabIndex--);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget currentTab;

    switch (_currentTabIndex) {
      case 0:
        currentTab = PersonalInfoTab(
          formKey: _personalInfoFormKey,
          firstNameController: firstNameController,
          lastNameController: lastNameController,
          birthdateController: birthdateController,
          ageController: ageController,
          bioController: bioController,
          onNext: _goToNextTab,
        );
        break;

      case 1:
        currentTab = CredentialsTab(
          formKey: _credentialsFormKey,
          emailController: emailController,
          passwordController: passwordController,
          confirmPasswordController: confirmPasswordController,
          onNext: _goToNextTab,
          onBack: _goToPreviousTab,
        );
        break;

      case 2:
        currentTab = ReviewTab(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          birthdate: birthdateController.text,
          age: ageController.text,
          bio: bioController.text,
          email: emailController.text,
          onBack: _goToPreviousTab,
        );
        break;

      default:
        currentTab = const Center(child: Text("Unknown tab"));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Registration Form'), centerTitle: true),
      body: currentTab,
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    birthdateController.dispose();
    ageController.dispose();
    bioController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
