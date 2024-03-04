import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sakeny/Features/home/data/Models/apartment_model.dart';
import 'package:sakeny/core/errors/faluire.dart';

class FavoritesRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Function to add apartment to favorites
  Future<Either<Faluire, String>> addToFavorites(
      {required String apartmentId}) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        final userId = currentUser.uid;

        // Get the reference to the user's favorites document
        final userFavoritesRef =
            FirebaseFirestore.instance.collection('Favorites').doc(userId);

        // Check if the user's favorites document exists
        final userFavoritesSnapshot = await userFavoritesRef.get();

        if (userFavoritesSnapshot.exists) {
          // If the document exists, use FieldValue.arrayUnion to add apartmentId to the favorites array
          await userFavoritesRef.update({
            'apartmentIds': FieldValue.arrayUnion([apartmentId]),
          });
        } else {
          // If the document doesn't exist, create a new document and add apartmentId to the favorites array
          await userFavoritesRef.set({
            'apartmentIds': [apartmentId],
          });
        }
      }
      return right(apartmentId);
    } on FirebaseException catch (e) {
      log('add favorite error: ${e.code}');
      return left(FirebaseFaluire.fromFireStore(e.code));
    }
  }

  Future<Either<Faluire, String>> removeFromFavorites(
      {required String apartmentId}) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        final userId = currentUser.uid;

        // Use FieldValue.arrayRemove to remove apartmentId from the favorites array
        await FirebaseFirestore.instance
            .collection('Favorites')
            .doc(userId)
            .update({
          'apartmentIds': FieldValue.arrayRemove([apartmentId]),
        });
      }
      return right(apartmentId);
    } on FirebaseException catch (e) {
      log('remove favorite error: ${e.code}');
      return left(FirebaseFaluire.fromFireStore(e.code));
    }
  }
  // Function to get user's favorites

  Future<Either<Faluire, List<String>>> getUserFavorites(String userId) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('Favorites').doc(userId).get();

      final data = snapshot.data() ?? {};
      // Return list of favorite apartment IDs
      return Right(data.keys.cast<String>().toList());
    } on FirebaseException catch (e) {
      return Left(FirebaseFaluire.fromFireStore(e.code));
    }
// Return an empty list if user has no favorites
  }

  Future<Either<Faluire, List<ApartmentModel>>> getFavoriteApartments(
      {required String userId}) async {
    try {
      final favoriteIdsResult = await getUserFavorites(userId);

      // Check if getUserFavorites returned a Right or a Left
      return favoriteIdsResult.fold(
        (failure) =>
            Left(failure), // Propagate the failure if getUserFavorites failed
        (favoriteIds) async {
          final List<ApartmentModel> favoriteApartments = [];

          // Fetch apartments based on favorite IDs
          final snapshots = await Future.wait(favoriteIds
              .map((id) => _firestore.collection('Apartments').doc(id).get()));

          // Convert snapshots to ApartmentModel objects
          favoriteApartments.addAll(snapshots
              .map((snapshot) => ApartmentModel.fromFirestore(snapshot))
              .toList());
          return Right(
              favoriteApartments); // Return the list of favorite apartments
        },
      );
    } on FirebaseException catch (e) {
      return Left(FirebaseFaluire.fromFireStore(e.code));
    }
  }
}