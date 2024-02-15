import 'package:ciphernexa/conts/styles.dart';

import 'package:flutter/material.dart';

import '../utils/size_box.dart';

class RegistrationInfo extends StatelessWidget {
  
  final String accountText;
  final String text;
  final VoidCallback onTap;
  const RegistrationInfo({
    super.key,
    required this.accountText,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          accountText,
          style: AppStyles.kCreateAccount,
        ),
        buildSizeBox(0, 5),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text,
            style: AppStyles.kSignUpText,
          ),
        )
      ],
    );
  }
}
