import 'package:flutter/material.dart';

class SettingsTextField extends StatelessWidget {
  final String label;
  final String value;
  final bool isPassword;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;

  const SettingsTextField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.isPassword = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller ?? TextEditingController(text: value),
      obscureText: isPassword,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isPassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  // Password visibility toggle will be handled by parent
                },
              )
            : null,
      ),
    );
  }
} 