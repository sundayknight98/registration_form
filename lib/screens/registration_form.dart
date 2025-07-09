import 'package:flutter/material.dart';
import 'credentials_tab.dart';
import 'personal_info_tab.dart';
import 'review_tab.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  // Controllers for all form fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void nextTab() {
    if (_tabController.index < 2) {
      _tabController.animateTo(_tabController.index + 1);
    }
  }

  void previousTab() {
    if (_tabController.index > 0) {
      _tabController.animateTo(_tabController.index - 1);
    }
  }

  void handleSubmit() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Form Submitted"),
        content: Text("Thank you, ${firstNameController.text}!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            PersonalInfoTab(
              firstNameController: firstNameController,
              lastNameController: lastNameController,
              birthdateController: birthdateController,
              ageController: ageController,
              bioController: bioController,
              onNext: nextTab,
            ),
            CredentialsTab(
              emailController: emailController,
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
              onBack: previousTab,
              onNext: nextTab,
            ),
            ReviewTab(
              onBack: previousTab,
              onSubmit: handleSubmit,
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              birthdate: birthdateController.text,
              age: ageController.text,
              bio: bioController.text,
              email: emailController.text,
            ),
          ],
        ),
      ),
    );
  }
}
