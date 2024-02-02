import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
      log(e.toString());
      return left(FirebaseFaluire.fromFirebaseAuth(e.toString()));
    }
  }

  Future<Either<Faluire, UserCredential>> signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(credential);
    } catch (e) {
      log(e.toString());
      return left(FirebaseFaluire.fromFirebaseAuth(e.toString()));
    }
  }

  Future<Either<Faluire, UserCredential>> signInWithGoogle() async {
    // Trigger the authentication flow
    try {
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
      return right(
          await FirebaseAuth.instance.signInWithCredential(credential));
    } catch (e) {
      return left(FirebaseFaluire.fromFirebaseAuth(e.toString()));
    }
  }
}
