
import 'package:app_pay_flow/shared/themes/app_colors.dart';
import 'package:app_pay_flow/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Center(
          child: Text('Pay Flow',
            style: TextStyles.titleRegular),
        ),
      ),
    );
  }
}
