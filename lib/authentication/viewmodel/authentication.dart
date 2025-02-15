import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  // firbaseinstance

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // current user
  User? get CurrentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // login function email and password pass on parameater
  Future<void> Login(_Email, _Password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: _Email, password: _Password);
  }

  // signup function email and password pass on parameater
  Future<void> signup(_email, _Password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: _email, password: _Password);
  }

  // account log out function
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<UserCredential> signInWithGoogle() async {
    print('this is google authentcation ');
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
