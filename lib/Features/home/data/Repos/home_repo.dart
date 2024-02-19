import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:sakeny/Features/home/data/Models/apartment_model.dart';
import 'package:sakeny/core/errors/faluire.dart';

class HomeRepo {
  final int apartmentsPerPage =
      8; // Adjust the number of apartments per page as needed
  DocumentSnapshot? lastDocument; // Track the last document seen

  Future<Either<Faluire, List<ApartmentModel>>> fetchApartments(
      {int pageNumber = 1, required Query query}) async {
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
            doc as DocumentSnapshot<Map<String, dynamic>>));
      }

      // Update lastDocument to the last document of the current page
      if (querySnapshot.docs.isNotEmpty) {
        lastDocument = querySnapshot.docs.last;
      }

      return Right(apartments);
    } on FirebaseException catch (e) {
      log(e.toString());
      return left(FirebaseFaluire.fromFireStore(e.code));
    }
  }
}
