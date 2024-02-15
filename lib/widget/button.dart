import 'package:flutter/material.dart';

import '../conts/color.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  final VoidCallback? onPressed;

  final Widget? child;
  Button({
    super.key,
    this.onPressed,
    this.child,
  });

  bool isShowError = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimaryColor,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: child);
  }
}
