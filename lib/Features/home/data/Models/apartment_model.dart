import 'package:cloud_firestore/cloud_firestore.dart';

class ApartmentModel {
  int? buildingID;
  String? apartmentID; // Unique identifier for the apartment
  List<String>? photosUrls;
  String? numberOfSingleBeds;
  String? numberOfDoubleBeds;
  String? numberOfTripleBeds;
  num? priceOfOneBedInSingleBeds;
  num? priceOfOneBedInDoubleBeds;
  num? priceOfOneBedInTripleBeds;
  bool? isForMales;
  Timestamp? time;
  String? ownerName; // Corrected spelling
  String? ownerPhone;
  String? ownerDescription;
  String? userDescription;
  List<dynamic>? type;

  @override
  String toString() {
    return 'ApartmentModel: {'
        ' buildingID: $buildingID,'
        ' apartmentID: $apartmentID,'
        ' photosUrls: $photosUrls,'
        ' numberOfSingleBeds: $numberOfSingleBeds,'
        ' numberOfDoubleBeds: $numberOfDoubleBeds,'
        ' numberOfTripleBeds: $numberOfTripleBeds,'
        ' priceOfOneBedInSingleBeds: $priceOfOneBedInSingleBeds,'
        ' priceOfOneBedInDoubleBeds: $priceOfOneBedInDoubleBeds,'
        ' priceOfOneBedInTripleBeds: $priceOfOneBedInTripleBeds,'
        ' isForMales: $isForMales,'
        ' time: $time,'
        ' ownerName: $ownerName,'
        ' ownerPhone: $ownerPhone,'
        ' ownerDescription: $ownerDescription,'
        ' userDescription: $userDescription,'
        ' type: $type'
        '}';
  }

  ApartmentModel(
      {this.ownerName, // Corrected spelling
      this.type,
      this.ownerPhone,
      this.ownerDescription,
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
      this.apartmentID});

  factory ApartmentModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data() ?? {};
    return ApartmentModel(
      type: data['type'],
      apartmentID: snapshot.id,
      ownerDescription: data['ownerDescription'],
      ownerName: data['ownerName'],
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

  Map<String, dynamic> toMap({required String docID}) {
    return {
      'type': type,
      'apartmentID': docID,

      'ownerName': ownerName, // Corrected spelling
      'ownerPhone': ownerPhone,
      'ownerDescription': ownerDescription,
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
