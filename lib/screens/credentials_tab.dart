import 'package:flutter/material.dart';
import '../widgets/navigation_buttons.dart';
import '../widgets/form_fields/email_input_field.dart';
import '../widgets/form_fields/password_input_field.dart';
import '../widgets/form_fields/confirm_password_input_field.dart';
import '../utils/validators.dart'; // make sure this path matches your project structure

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
    return Scaffold(
      body: Column(
        children: [
          // Divider full width
          const Divider(
            thickness: 1,
            height: 32,
            color: Colors.grey,
            indent: 0, // no indent, full width
            endIndent: 0,
          ),
          // Centered "2 out of 3"
          const Center(
            child: Text(
              '2 out of 3',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  key: widget.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      const Text(
                        'Email & Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      const Text(
                        'Login information.',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      const SizedBox(height: 40),
                      EmailInputField(
                        controller: widget.emailController,
                        validator: validateEmail,
                      ),
                      const SizedBox(height: 12),
                      PasswordInputField(
                        controller: widget.passwordController,
                        obscureText: _obscurePassword,
                        toggleVisibility: () {
                          setState(() => _obscurePassword = !_obscurePassword);
                        },
                        validator: validatePassword,
                      ),
                      const SizedBox(height: 12),
                      ConfirmPasswordInputField(
                        controller: widget.confirmPasswordController,
                        originalPasswordController: widget.passwordController,
                        obscureText: _obscureConfirmPassword,
                        toggleVisibility: () {
                          setState(
                            () => _obscureConfirmPassword =
                                !_obscureConfirmPassword,
                          );
                        },
                        validator: (value) => validateConfirmPassword(
                          value,
                          widget.passwordController.text,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: NavigationButtons(
          onBack: widget.onBack,
          onNext: () {
            if (widget.formKey.currentState!.validate()) {
              widget.onNext();
            }
          },
          isFirstTab: false,
          nextLabel: 'Review',
        ),
      ),
    );
  }
}
