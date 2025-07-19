bool _isValidGmail(String email) {
  final gmailRegex = RegExp(r'^[\w-\.]+@gmail\.com$');
  return gmailRegex.hasMatch(email);
}

String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your email';
  }

  final trimmed = value.trim();
  if (!trimmed.contains('@') || !trimmed.contains('.')) {
    return 'Email must contain @ and .';
  }

  if (!_isValidGmail(trimmed)) {
    return 'Email must be a valid Gmail address (e.g., yourname@gmail.com)';
  }

  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) return 'Please enter a password';

  final password = value.trim();
  List<String> errors = [];

  if (password.length < 8) errors.add('• At least 8 characters');
  if (!RegExp(r'[A-Z]').hasMatch(password))
    errors.add('• One uppercase letter');
  if (!RegExp(r'[a-z]').hasMatch(password))
    errors.add('• One lowercase letter');
  if (!RegExp(r'[0-9]').hasMatch(password)) errors.add('• One number');
  if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password))
    errors.add('• One special character');

  return errors.isNotEmpty ? 'Password must have:\n${errors.join('\n')}' : null;
}

String? validateConfirmPassword(String? value, String originalPassword) {
  if (value == null || value.isEmpty) return 'Please confirm your password';
  if (value.trim() != originalPassword.trim()) return 'Passwords do not match';
  return null;
}
