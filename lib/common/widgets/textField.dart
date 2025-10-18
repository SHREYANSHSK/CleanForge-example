import 'package:example/common/resources/app_resources/app_sizes.dart';
import 'package:flutter/material.dart';

Widget buildTextField({
  required TextEditingController controller,
  required String label,
  required String hintText,
  String? initialValue,
  String? Function(String?)? validator,
  bool obscureText = false,
  TextInputType? keyboardType,
  Widget? suffixIcon,
  bool readOnly = false,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: AppSizes.h8,
    children: [
      Text(label),
      TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        keyboardType: keyboardType,
        initialValue: initialValue,
        readOnly: readOnly,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
        ),
      ),
    ],
  );
}
