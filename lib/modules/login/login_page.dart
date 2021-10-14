import 'package:app_pay_flow/shared/themes/app_colors.dart';
import 'package:app_pay_flow/shared/themes/app_images.dart';
import 'package:app_pay_flow/shared/themes/app_text_styles.dart';
import 'package:app_pay_flow/shared/widgets/social_login/social_login_button.dart';
import 'package:flutter/material.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  _Login_PageState createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.35,
                color: AppColors.primary,
              ),
            Positioned(
                top: 30,
                left: 0,
                right: 0,
                child: Image.asset(
                  AppImages.person,
                  width: 208,
                  height: 300,
                )),

              Positioned(
                  bottom: size.height * 0.03,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.logoMini),
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 20, left: 60, right: 60),
                        child: Text(
                          "Organize seus boletos em um só lugar",
                          textAlign: TextAlign.center,
                          style: TextStyles.titleHome,
                        ),
                      ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 40, right: 40, top: 20),
                      child: SocialLoginButton(
                        onTap: () {
                          print("clicou");
                        },
                      ),
                    )
                  ],
                )),
          ],
        )

      ),

    );
  }
}
