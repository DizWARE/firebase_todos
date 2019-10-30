import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Future<FirebaseUser> signIn({String email, String password});
  Future<FirebaseUser> signUp({String email, String password});
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<FirebaseUser> getUser();
}