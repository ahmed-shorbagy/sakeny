class UserModel {
  String name;
  String email;
  String? photoUrl;
  String? phoneNumber;

  bool? isMail;

  UserModel(
      {required this.email,
      required this.name,
      this.photoUrl,
      this.phoneNumber,
      this.isMail});

  factory UserModel.fromFireStore(Map<String, dynamic> user) {
    return UserModel(
        email: user['email'],
        name: user['name'],
        photoUrl: user['photoUrl'],
        phoneNumber: user['phoneNumber'],
        isMail: user['isMail']);
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'phoneNumber': phoneNumber,
      'isMail': isMail
    };
  }
}
