import 'package:firebase_auth/firebase_auth.dart';

abstract class SignRepository {
  Future<UserCredential> signInWithGoogle();
}
