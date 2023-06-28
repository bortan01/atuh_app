import 'package:auth_app/services/api_status.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GooogleSignInServices {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  static Future<Object> signIngWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      final googlekey = await account?.authentication;
      final idToken = googlekey?.idToken;
      // LLAMAR SERVICO REST
      
      
      return Success(response: account);

    } catch (e) {
      return Failure(errorResponse: e.toString());
    }
  }

  static Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
