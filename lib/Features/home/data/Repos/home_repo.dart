import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:sakeny/Features/home/data/Models/apartment_model.dart';
import 'package:sakeny/Features/home/data/Models/request_model.dart';
import 'package:sakeny/core/errors/faluire.dart';

class HomeRepo {
  final int apartmentsPerPage = 8;
  DocumentSnapshot? lastDocument;
  static Set<String> fetchedDocumentIds = {}; // Track fetched document IDs

  Future<Either<Faluire, List<ApartmentModel>>> fetchApartments({
    int pageNumber = 1,
    required Query query,
  }) async {
    try {
      if (pageNumber > 1 && lastDocument != null) {
        query = query.startAfterDocument(lastDocument!);
      }

      final QuerySnapshot querySnapshot =
          await query.limit(apartmentsPerPage).get();

      final List<ApartmentModel> apartments = [];
      for (final doc in querySnapshot.docs) {
        final apartmentId = doc.id;
        // Check if document ID is already fetched
        if (!fetchedDocumentIds.contains(apartmentId)) {
          apartments.add(ApartmentModel.fromFirestore(
              doc as DocumentSnapshot<Map<String, dynamic>>));
          // Add fetched document ID to the set
          fetchedDocumentIds.add(apartmentId);
        }
      }

      return Right(apartments);
    } on FirebaseException catch (e) {
      log(e.toString());
      return Left(FirebaseFaluire.fromFireStore(e.code));
    }

    // Other methods...
  }

  Future<Either<Faluire, void>> addNewRequestToFirestore(
      {required RequestModel request}) async {
    try {
      final requestRef =
          FirebaseFirestore.instance.collection('Requests').doc();
      await requestRef.set(request.toMap());
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirebaseFaluire.fromFireStore(e.code));
    }
  }
}
