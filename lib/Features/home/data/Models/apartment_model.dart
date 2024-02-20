import 'package:cloud_firestore/cloud_firestore.dart';

class ApartmentModel {
  int? buildingID; // Unique identifier for the apartment
  List<String>? photosUrls;
  String? numberOfSingleBeds;
  String? numberOfDoubleBeds;
  String? numberOfTripleBeds;
  String? priceOfOneBedInSingleBeds;
  String? priceOfOneBedInDoubleBeds;
  String? priceOfOneBedInTripleBeds;
  bool? isForMales;
  Timestamp? time;
  String? owenrName;
  String? ownerPhone;
  String? owenrDescription;
  String? userDescription;
  List<dynamic>? type;

  ApartmentModel({
    this.owenrName,
    this.type,
    this.ownerPhone,
    this.owenrDescription,
    this.userDescription,
    this.time,
    this.isForMales,
    this.buildingID,
    this.photosUrls,
    this.numberOfSingleBeds,
    this.numberOfDoubleBeds,
    this.numberOfTripleBeds,
    this.priceOfOneBedInSingleBeds,
    this.priceOfOneBedInDoubleBeds,
    this.priceOfOneBedInTripleBeds,
  });

  factory ApartmentModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    Map<String, dynamic> data = snapshot.data()!;
    return ApartmentModel(
      type: data['type'],
      owenrDescription: data['owenrDescription'],
      owenrName: data['owenrName'],
      ownerPhone: data['ownerPhone'],
      userDescription: data['userDescription'],
      buildingID: data['buildingID'],
      isForMales: data['isForMales'],
      time: data['time'],
      photosUrls: List<String>.from(data['photoUrls'] ?? []),
      numberOfSingleBeds: data['numberOfSingleBeds'],
      numberOfDoubleBeds: data['numberOfDoubleBeds'],
      numberOfTripleBeds: data['numberOfTripleBeds'],
      priceOfOneBedInDoubleBeds: data['priceOfOneBedInDoubleBeds'],
      priceOfOneBedInSingleBeds: data['priceOfOneBedInSingleBeds'],
      priceOfOneBedInTripleBeds: data['priceOfOneBedInTripleBeds'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'owenrName': owenrName,
      'ownerPhone': ownerPhone,
      'owenrDescription': owenrDescription,
      'userDescription': userDescription,
      'isForMales': isForMales,
      'photoUrls': photosUrls,
      'time': time,
      'numberOfSingleBeds': numberOfSingleBeds,
      'numberOfDoubleBeds': numberOfDoubleBeds,
      'numberOfTripleBeds': numberOfTripleBeds,
      'priceOfOneBedInSingleBeds': priceOfOneBedInSingleBeds,
      'priceOfOneBedInDoubleBeds': priceOfOneBedInDoubleBeds,
      'priceOfOneBedInTripleBeds': priceOfOneBedInTripleBeds,
      'buildingID': buildingID
    };
  }
}
