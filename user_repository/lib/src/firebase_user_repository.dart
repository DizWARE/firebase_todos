import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

class FirebaseUserRepository implements UserRepository {
  final FirebaseAuth _firebaseAuth;

  FirebaseUserRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<FirebaseUser> getUser() async {
    return await _firebaseAuth.currentUser();
  }

  @override
  Future<bool> isSignedIn() async {
    return await getUser() != null;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<FirebaseUser> signUp({String email, String password}) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return result.user;
  }

  @override
  Future<FirebaseUser> signIn({String email, String password}) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

    return result.user;
  }


}