class UserModel {
  String name;
  String email;
  String? photoUrl;
  String? phoneNumber;

  bool? isStudent;

  UserModel(
      {required this.email,
      required this.name,
      this.photoUrl,
      this.phoneNumber,
      this.isStudent});

  factory UserModel.fromFireStore(Map<String, dynamic> user) {
    return UserModel(
        email: user['email'],
        name: user['name'],
        photoUrl: user['photoUrl'],
        isStudent: user['isStudent'],
        phoneNumber: user['phoneNumber']);
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'isStudent': isStudent,
      'phoneNumber': phoneNumber
    };
  }
}
