import 'package:auvnet_internship_assessment/core/constants/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> login(String email, String password) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception('${AppStrings.failedToLogin} ${e.message}');
    } catch (e) {
      throw Exception('${AppStrings.failedToLogin}  $e');
    }
  }

  Future<UserCredential> signup(String email, String password) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception('${AppStrings.failedToSignup}  ${e.message}');
    } catch (e) {
      throw Exception('${AppStrings.failedToSignup}  $e');
    }
  }
}