import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
//import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return null;
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential = await _auth.signInWithCredential(credential);
    return userCredential.user;
  }

  // Future<User?> signInWithFacebook() async {
  //   final LoginResult result = await FacebookAuth.instance.login();
  //   if (result.status != LoginStatus.success) {
  //     return null;
  //   }

  //   final AuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
  //   final UserCredential userCredential = await _auth.signInWithCredential(credential);
  //   return userCredential.user;
  // }

  // Future<User?> signInWithApple() async {
  //   final credential = await SignInWithApple.getAppleIDCredential(scopes: [
  //     AppleIDAuthorizationScopes.email,
  //     AppleIDAuthorizationScopes.fullName,
  //   ]);

  //   final oauthCredential = OAuthProvider("apple.com").credential(
  //     idToken: credential.identityToken,
  //     accessToken: credential.authorizationCode,
  //   );

  //   final UserCredential userCredential = await _auth.signInWithCredential(oauthCredential);
  //   return userCredential.user;
  // }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
