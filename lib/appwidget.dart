import 'package:app_pay_flow/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:app_pay_flow/modules/home/home_page.dart';
import 'package:app_pay_flow/modules/splash/splash_page.dart';
import 'package:app_pay_flow/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'modules/login/login_page.dart';


class AppWidget extends StatelessWidget {

  AppWidget(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Pay Flow',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: "/splash",
      routes: {
        "/home": (context) => HomePage(),
        "/login": (context) => Login_Page(),
        "/splash": (context) => SplashPage(),
        "/barcode_scanner": (context) => BarcodeScannerPage(),
      }
    );
  }
}