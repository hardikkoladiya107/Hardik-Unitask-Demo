import 'package:flutter/material.dart';
import 'package:unitask_practicle_hardik/other/extensions.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.controller,
  });

  String? hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  ValueChanged<String>? onChanged;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.4),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
      ),
    ).appPadding(
      left: 16,
      right: 16,
    );
  }
}
