class ApartmentModel {
  String photoUrl;
  int numberOfSingleRooms;
  int numberOfDoubleRooms;
  int numberOfTripleRooms;
  double? priceOfOneBedInSingleroom;
  double? priceOfOneBedInDoubleroom;
  double? priceOfOneBedInTripleroom;

  ApartmentModel(
      {required this.photoUrl,
      required this.numberOfSingleRooms,
      required this.numberOfDoubleRooms,
      required this.numberOfTripleRooms,
      this.priceOfOneBedInSingleroom,
      this.priceOfOneBedInDoubleroom,
      this.priceOfOneBedInTripleroom});

  factory ApartmentModel.fromFireStore(Map<String, dynamic> apartment) {
    return ApartmentModel(
        photoUrl: apartment['photoUrl'],
        numberOfSingleRooms: apartment['numberOfSingleRooms'],
        numberOfDoubleRooms: apartment['numberOfDoubleRooms'],
        numberOfTripleRooms: apartment['numberOfTripleRooms'],
        priceOfOneBedInDoubleroom: apartment['priceOfOneBedInDoubleroom'],
        priceOfOneBedInSingleroom: apartment['priceOfOneBedInSingleroom'],
        priceOfOneBedInTripleroom: apartment['priceOfOneBedInTripleroom']);
  }

  Map<String, dynamic> toMap() {
    return {
      'photoUrl': photoUrl,
      'numberOfSingleRooms': numberOfSingleRooms,
      'numberOfDoubleRooms': numberOfDoubleRooms,
      'numberOfTripleRooms': numberOfTripleRooms,
      'priceOfOneBedInSingleroom': priceOfOneBedInSingleroom,
      'priceOfOneBedInDoubleroom': priceOfOneBedInDoubleroom,
      'priceOfOneBedInTripleroom': priceOfOneBedInTripleroom,
    };
  }
}
