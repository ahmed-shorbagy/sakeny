class UserModel {
  String name;
  String email;
  String? photoUrl;
  dynamic selectedUniversity;
  bool? isStudent;

  UserModel(
      {required this.email,
      required this.name,
      this.photoUrl,
      this.selectedUniversity,
      this.isStudent});

  factory UserModel.fromFireStore(Map<String, dynamic> user) {
    return UserModel(
        email: user['email'],
        name: user['name'],
        photoUrl: user['photoUrl'],
        selectedUniversity: user['selectedUniversity'],
        isStudent: user['isStudent']);
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'selectedUniversity': selectedUniversity.toString(),
      'isStudent': isStudent
    };
  }
}
