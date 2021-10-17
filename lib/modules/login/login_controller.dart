import 'package:app_pay_flow/shared/auth/auth_controller.dart';
import 'package:app_pay_flow/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController{
  final authController = AuthController();
  Future <void> googleSignin(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      final user =
          UserModel(
              name: response!.displayName!,
              photoURL: response.photoUrl,
              email: response.email);
      authController.setUser(context, user);
      print('entrou');

    } catch (error) {
      authController.setUser(context, null);
      print(error);
    }
  }
}