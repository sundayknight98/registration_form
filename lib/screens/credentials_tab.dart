import 'package:flutter/material.dart';
import '../widgets/navigation_buttons.dart';
import '../widgets/form_fields/email_input_field.dart';
import '../widgets/form_fields/password_input_field.dart';
import '../widgets/form_fields/confirm_password_input_field.dart';

class CredentialsTab extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const CredentialsTab({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onNext,
    required this.onBack,
  });

  @override
  State<CredentialsTab> createState() => _CredentialsTabState();
}

class _CredentialsTabState extends State<CredentialsTab> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _passwordsMatch = true;

  @override
  void initState() {
    super.initState();
    widget.passwordController.addListener(_checkPasswordsMatch);
    widget.confirmPasswordController.addListener(_checkPasswordsMatch);
  }

  void _checkPasswordsMatch() {
    final password = widget.passwordController.text;
    final confirm = widget.confirmPasswordController.text;
    setState(() {
      _passwordsMatch = password.isNotEmpty && password == confirm;
    });
  }

  @override
  void dispose() {
    widget.passwordController.removeListener(_checkPasswordsMatch);
    widget.confirmPasswordController.removeListener(_checkPasswordsMatch);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            key: widget.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Email & Password',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const Text(
                  'Login information.',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 40),
                EmailInputField(controller: widget.emailController),
                const SizedBox(height: 12),
                PasswordInputField(
                  controller: widget.passwordController,
                  obscureText: _obscurePassword,
                  toggleVisibility: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                const SizedBox(height: 12),
                ConfirmPasswordInputField(
                  controller: widget.confirmPasswordController,
                  originalPasswordController: widget.passwordController,
                  obscureText: _obscureConfirmPassword,
                  toggleVisibility: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
                if (_passwordsMatch &&
                    widget.confirmPasswordController.text.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4, left: 2),
                    child: Row(
                      children: const [
                        Icon(Icons.check_circle, color: Colors.green, size: 18),
                        SizedBox(width: 6),
                        Text(
                          "Passwords match",
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: NavigationButtons(
          onBack: widget.onBack,
          onNext: widget.onNext,
          isFirstTab: false,
        ),
      ),
    );
  }
}
