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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 40),
      child: Form(
        key: widget.formKey,
        child: ListView(
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

            // Email Input
            EmailInputField(controller: widget.emailController),
            const SizedBox(height: 12),

            // Password Input
            PasswordInputField(
              controller: widget.passwordController, // FIXED NAME
              obscureText: _obscurePassword,
              toggleVisibility: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
            const SizedBox(height: 12),

            // Confirm Password Input
            ConfirmPasswordInputField(
              controller: widget.confirmPasswordController, // FIXED NAME
              passwordController: widget.passwordController, // FIXED NAME
              obscureText: _obscureConfirmPassword,
              toggleVisibility: () {
                setState(() {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                });
              },
            ),
            const SizedBox(height: 20),

            NavigationButtons(
              onBack: widget.onBack,
              onNext: widget.onNext,
              isFirstTab: false,
            ),
          ],
        ),
      ),
    );
  }
}
