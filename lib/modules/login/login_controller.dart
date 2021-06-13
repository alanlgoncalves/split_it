import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login_state.dart';
import 'models/user_model.dart';

class LoginController {
  LoginState state = LoginStateEmpty();
  VoidCallback onUpdate;

  LoginController({required this.onUpdate});

  Future<void> googleSignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    try {
      this.state = LoginStateLoading();
      this.onUpdate();
      final account = await _googleSignIn.signIn();

      this.state = LoginStateSuccess(user: UserModel.gooogle(account!));
      this.onUpdate();
    } catch (error) {
      state = LoginStateFailure(message: error.toString());
      this.onUpdate();
    }
  }
}
