import 'package:google_sign_in/google_sign_in.dart';

import 'login_state.dart';
import 'models/user_model.dart';

class LoginController {
  UserModel? user;
  LoginState state = LoginStateEmpty();

  Future<void> googleSignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    try {
      this.state = LoginStateLoading();
      final account = await _googleSignIn.signIn();
      user = UserModel.gooogle(account!);

      this.state = LoginStateSuccess(user: user!);

      print(user);
    } catch (error) {
      state = LoginStateFailure(message: error.toString());
    }
  }
}
