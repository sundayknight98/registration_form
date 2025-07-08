import 'package:flutter/material.dart';
import 'screens/personal_info_tab.dart';
import 'screens/credentials_tab.dart';
import 'screens/review_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final birthdateController = TextEditingController();
  final ageController = TextEditingController();
  final bioController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKeys = [GlobalKey<FormState>(), GlobalKey<FormState>()];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void nextTab() {
    if (_tabController.index == 0 && formKeys[0].currentState!.validate()) {
      _tabController.animateTo(1);
    } else if (_tabController.index == 1 &&
        formKeys[1].currentState!.validate()) {
      if (!emailController.text.endsWith('@gmail.com')) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Email must end with @gmail.com")),
        );
        return;
      }
      _tabController.animateTo(2);
    }
  }

  void previousTab() => _tabController.animateTo(_tabController.index - 1);

  void submitData() {
    final data = {
      'firstName': firstNameController.text,
      'lastName': lastNameController.text,
      'birthdate': birthdateController.text,
      'age': ageController.text,
      'bio': bioController.text,
      'email': emailController.text,
    };
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Submitted Data"),
        content: Text(data.toString()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF7FF),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 360,
            margin: const EdgeInsets.symmetric(vertical: 24),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                PersonalTab(
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  birthdateController: birthdateController,
                  ageController: ageController,
                  bioController: bioController,
                  onNext: nextTab,
                  formKey: formKeys[0],
                ),
                CredentialsTab(
                  emailController: emailController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                  onBack: previousTab,
                  onNext: nextTab,
                  formKey: formKeys[1],
                ),
                ReviewTab(
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  birthdateController: birthdateController,
                  ageController: ageController,
                  bioController: bioController,
                  emailController: emailController,
                  onBack: previousTab,
                  onSubmit: submitData,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
