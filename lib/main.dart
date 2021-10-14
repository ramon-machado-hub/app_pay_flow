import 'package:app_pay_flow/modules/home/home_page.dart';
import 'package:app_pay_flow/modules/login/login_page.dart';
import 'package:app_pay_flow/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Pay Flow',
      theme: ThemeData(primaryColor: AppColors.primary,),
      home: HomePage(),
    );
  }
}
