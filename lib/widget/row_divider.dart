
import 'package:flutter/material.dart';

import '../conts/color.dart';
import '../conts/styles.dart';

class RowDivider extends StatelessWidget {
  const RowDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            endIndent: 10,
            color: AppColors.kGreyColor.withOpacity(0.5),
          ),
        ),
        Text(
          'OR',
          style: AppStyles.kCreateAccount.copyWith(
            color: AppColors.kGreyColor.withOpacity(0.5),
          ),
        ),
        Expanded(
          child: Divider(
            indent: 10,
            color: AppColors.kGreyColor.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
