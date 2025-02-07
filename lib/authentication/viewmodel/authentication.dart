import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_task_app/authentication/view/login_page.dart';

class Authentication {
  // firbaseinstance
  final FirebaseAuth _FirebaseAuth = FirebaseAuth.instance;

  // current user
  User? get CurrentUser => _FirebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _FirebaseAuth.authStateChanges();

  // login function email and password pass on parameater
  Future<void> Login(_Email, _Password) async {
    await _FirebaseAuth.signInWithEmailAndPassword(
        email: _Email, password: _Password);
  }

  // signup function email and password pass on parameater
  Future<void> signup(_email, _Password) async {
    await _FirebaseAuth.createUserWithEmailAndPassword(
        email: _email, password: _Password);
  }

  // account log out function
  Future<void> signOut() async {
    await _FirebaseAuth.signOut();
  }
}
