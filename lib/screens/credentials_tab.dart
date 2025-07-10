import 'package:flutter/material.dart';
import '../widgets/navigation_buttons.dart';

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

            // Email
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Email Address',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: widget.emailController,
                  decoration: InputDecoration(
                    hintText: 'example@gmail.com',
                    filled: true,
                    fillColor: Color.fromARGB(255, 233, 229, 229),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your email'
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Password
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Password',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: widget.passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: '********',
                    filled: true,
                    fillColor: Color.fromARGB(255, 233, 229, 229),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your password'
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Confirm Password
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Confirm Password',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: widget.confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  decoration: InputDecoration(
                    hintText: '********',
                    filled: true,
                    fillColor: Color.fromARGB(255, 233, 229, 229),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != widget.passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
              ],
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
