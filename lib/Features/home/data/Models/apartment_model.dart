import 'package:cloud_firestore/cloud_firestore.dart';

class ApartmentModel {
  int? buildingID; // Unique identifier for the apartment
  List<String>? photosUrls;
  int? numberOfSingleRooms;
  int? numberOfDoubleRooms;
  int? numberOfTripleRooms;
  double? priceOfOneBedInSingleroom;
  double? priceOfOneBedInDoubleroom;
  double? priceOfOneBedInTripleroom;
  bool? isForMales;
  Timestamp? time;

  ApartmentModel({
    this.time,
    this.isForMales,
    this.buildingID,
    this.photosUrls,
    this.numberOfSingleRooms,
    this.numberOfDoubleRooms,
    this.numberOfTripleRooms,
    this.priceOfOneBedInSingleroom,
    this.priceOfOneBedInDoubleroom,
    this.priceOfOneBedInTripleroom,
  });

  factory ApartmentModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    Map<String, dynamic> data = snapshot.data()!;
    return ApartmentModel(
      buildingID: data['buildingID'],
      isForMales: data['isForMales'],
      time: data['time'],
      photosUrls: List<String>.from(data['photoUrls'] ?? []),
      numberOfSingleRooms: data['numberOfSingleRooms'],
      numberOfDoubleRooms: data['numberOfDoubleRooms'],
      numberOfTripleRooms: data['numberOfTripleRooms'],
      priceOfOneBedInDoubleroom: data['priceOfOneBedInDoubleroom'],
      priceOfOneBedInSingleroom: data['priceOfOneBedInSingleroom'],
      priceOfOneBedInTripleroom: data['priceOfOneBedInTripleroom'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isForMales': isForMales,
      'photoUrls': photosUrls,
      'time': time,
      'numberOfSingleRooms': numberOfSingleRooms,
      'numberOfDoubleRooms': numberOfDoubleRooms,
      'numberOfTripleRooms': numberOfTripleRooms,
      'priceOfOneBedInSingleroom': priceOfOneBedInSingleroom,
      'priceOfOneBedInDoubleroom': priceOfOneBedInDoubleroom,
      'priceOfOneBedInTripleroom': priceOfOneBedInTripleroom,
      'buildingID': buildingID
    };
  }
}
