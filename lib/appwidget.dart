import 'package:app_pay_flow/modules/home/home_page.dart';
import 'package:app_pay_flow/modules/splash/splash_page.dart';
import 'package:app_pay_flow/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'modules/login/login_page.dart';


class AppWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Pay Flow',
      theme: ThemeData(primaryColor: AppColors.primary,),
      initialRoute: "/splash",
      routes: {
        "/home": (context) => HomePage(),
        "/login": (context) => Login_Page(),
        "/splash": (context) => SplashPage(),
      }
    );
  }
}