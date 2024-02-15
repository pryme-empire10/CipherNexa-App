
import 'package:flutter/material.dart';

import '../conts/styles.dart';

class HeaderTextContainer extends StatelessWidget {
  const HeaderTextContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, top: 30),
      child: Text(
        'cipherNexa',
        style: AppStyles.kHeader,
      ),
    );
  }
}
