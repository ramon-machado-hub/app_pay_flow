import 'package:app_pay_flow/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:app_pay_flow/modules/home/home_page.dart';
import 'package:app_pay_flow/modules/splash/splash_page.dart';
import 'package:app_pay_flow/shared/models/user_model.dart';
import 'package:app_pay_flow/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'modules/insert_boleto/insert_boleto_page.dart';
import 'modules/login/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {

  AppWidget(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.background));
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
        "/home": (context) => HomePage(
          user: ModalRoute.of(context)!.settings.arguments as UserModel,
        ),
        "/login": (context) => Login_Page(),
        "/splash": (context) => SplashPage(),
        "/barcode_scanner": (context) => BarcodeScannerPage(),
        "/insert_boleto": (context) => InsertBoletoPage(
          barcode: ModalRoute.of(context)!= null
              ? ModalRoute.of(context)!.settings.arguments.toString() : null,
        ),
      }
    );
  }
}