import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sakeny/core/errors/faluire.dart';

class AuthRepo {
  Future<Either<Faluire, UserCredential>> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(credential);
    } catch (e) {
      return left(FirbaseFaluire.fromFirebaseAuth(e.toString()));
    }
  }
}
