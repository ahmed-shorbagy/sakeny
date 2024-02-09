import 'dart:developer';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sakeny/core/errors/faluire.dart';
import 'package:sakeny/core/models/User_model.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;

class AuthRepo {
  User? user;

  Future<Either<Faluire, UserCredential>> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      log(e.code);
      return left(FirebaseFaluire.fromFirebaseAuth(e.code));
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
    } on FirebaseAuthException catch (e) {
      log(e.code);
      return left(FirebaseFaluire.fromFirebaseAuth(e.code));
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
    } on FirebaseAuthException catch (e) {
      log(e.code);
      return left(FirebaseFaluire.fromFirebaseAuth(e.code));
    }
  }

  Future<Either<Faluire, void>> registerUser() async {
    try {
      if (auth.currentUser != null) {
        // Check if the user already has a profile
        DocumentSnapshot userDoc =
            await firestore.collection('Users').doc(user?.uid).get();
        if (!userDoc.exists) {
          // If user profile doesn't exist, create one
          await firestore.collection('Users').doc(user?.uid).set(UserModel(
                  name: user?.displayName ?? '',
                  email: user?.email ?? '',
                  photoUrl: user?.photoURL)
              .toMap());
        }
        // Return success
        return const Right(Void);
      }
    } on FirebaseException catch (e) {
      // Return failure with the error code
      return Left(FirebaseFaluire.fromFireStore(e.code));
    }
    // Add a default return statement to handle the case where currentUser is null
    return Left(FirebaseFaluire.fromFireStore('user not found'));
  }

  Future<Either<Faluire, UserModel>> getUserData({required String uid}) async {
    try {
      final userDocument =
          FirebaseFirestore.instance.collection('Users').doc(uid);

      final query = await userDocument.get();

      if (query.exists) {
        final userData = query.data() as Map<String, dynamic>;
        final user = UserModel.fromFireStore(userData);
        return Right(user);
      } else {
        return Left(FirebaseFaluire.fromFirebaseAuth('User not found'));
      }
    } catch (e) {
      return Left(FirebaseFaluire.fromFirebaseAuth(e.toString()));
    }
  }

  Future<bool> checkCurrentUser() async {
    if (auth.currentUser != null) {
      // User is signed in
      // Navigate to the home screen with the user's profile
      // You can pass the user's profile information to the home screen if needed
      return true;
    } else {
      // User is not signed in
      // Navigate to the authentication screen
      return false;
    }
  }

  Future<Either<Faluire, void>> addNewUserToFireStore(
      {required UserModel user, required String uid}) async {
    try {
      final userRef = firestore.collection('Users').doc(uid);
      await userRef.set(user.toMap());
      return right(null);
    } on FirebaseException catch (e) {
      return left(FirebaseFaluire.fromFireStore(e.code));
    }
  }
}
