import 'package:firebase_auth/firebase_auth.dart';

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
}
