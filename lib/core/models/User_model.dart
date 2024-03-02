class UserModel {
  String name;
  String email;
  String? photoUrl;
  String? phoneNumber;
  bool? isMail;
  String? fcmToken;

  UserModel({
    required this.email,
    required this.name,
    this.photoUrl,
    this.fcmToken,
    this.phoneNumber,
    this.isMail,
  });

  factory UserModel.fromFirestore(Map<String, dynamic> data) {
    return UserModel(
      email: data['email'],
      fcmToken: data['fcmToken'],
      name: data['name'],
      photoUrl: data['photoUrl'],
      phoneNumber: data['phoneNumber'],
      isMail: data['isMail'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'phoneNumber': phoneNumber,
      'isMail': isMail,
      'fcmToken': fcmToken
    };
  }
}
