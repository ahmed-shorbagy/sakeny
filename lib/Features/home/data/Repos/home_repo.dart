import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:sakeny/Features/home/data/Models/apartment_model.dart';
import 'package:sakeny/Features/home/data/Models/request_model.dart';
import 'package:sakeny/core/errors/faluire.dart';

class HomeRepo {
  final int apartmentsPerPage =
      8; // Adjust the number of apartments per page as needed
  DocumentSnapshot? lastDocument; // Track the last document seen

  Future<Either<Faluire, List<ApartmentModel>>> fetchApartments({
    int pageNumber = 1,
    required Query query,
  }) async {
    try {
      // If pageNumber > 1, start after the last document seen
      if (pageNumber > 1 && lastDocument != null) {
        query = query.startAfterDocument(lastDocument!);
      }

      final QuerySnapshot querySnapshot =
          await query.limit(apartmentsPerPage).get();

      final List<ApartmentModel> apartments = [];
      for (final doc in querySnapshot.docs) {
        apartments.add(ApartmentModel.fromFirestore(
            doc as QueryDocumentSnapshot<Map<String, dynamic>>));
      }

      return Right(apartments);
    } on FirebaseException catch (e) {
      return Left(FirebaseFaluire.fromFireStore(e.code));
    }
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
