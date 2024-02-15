import 'package:ciphernexa/conts/styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EntryFormField extends StatelessWidget {
  TextEditingController controller;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final ValueChanged? onChanged;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool obscureText;
  final FocusNode? focusNode;
  EntryFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.obscureText = false,
    this.focusNode,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      focusNode: focusNode,
      obscureText: obscureText,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: AppStyles.kHintTextStyle,
      ),
    );
  }
}
