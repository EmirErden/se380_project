import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final VoidCallback? toggleVisibility;
  final bool showPassword;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.toggleVisibility,
    required this.showPassword,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: Colors.black),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        suffixIcon: toggleVisibility != null
            ? GestureDetector(
          onTap: toggleVisibility,
          child: Icon(
            obscureText && !showPassword
                ? Icons.visibility_off
                : Icons.visibility,
          ),
        )
            : null,
      ),
    );
  }
}
