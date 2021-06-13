import 'package:google_sign_in/google_sign_in.dart';

class UserModel {
  final String id;
  final String? name;
  final String email;
  final String? photoUrl;

  UserModel({required this.id, this.name, required this.email, this.photoUrl});

  factory UserModel.gooogle(GoogleSignInAccount account) {
    return UserModel(
        id: account.id,
        name: account.displayName,
        email: account.email,
        photoUrl: account.photoUrl);
  }
}
