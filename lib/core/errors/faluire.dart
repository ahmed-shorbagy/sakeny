abstract class Faluire {
  final String errMessage;

  Faluire({required this.errMessage});
}

class FirebaseFaluire extends Faluire {
  FirebaseFaluire({required super.errMessage});
  factory FirebaseFaluire.fromFirebaseAuth(String authException) {
    switch (authException) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case 'account-exists-with-different-credential':
      case "email-already-in-use":
      case "[firebase_auth/email-already-in-use] The email address is already in use by another account.":
        return FirebaseFaluire(
            errMessage: "Email already used. Go to login page.");

      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
      case "invalid-credential":
      case "[firebase_auth/invalid-credential] The supplied auth credential is incorrect, malformed or has expired.":
        return FirebaseFaluire(errMessage: "Wrong email/password combination.");

      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return FirebaseFaluire(errMessage: "No user found with this email.");
      case 'weak-password':
        return FirebaseFaluire(errMessage: "weak Password please try again");
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return FirebaseFaluire(errMessage: "User disabled.");

      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return FirebaseFaluire(
            errMessage: "Too many requests to log into this account.");

      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        return FirebaseFaluire(
            errMessage: "Server error, please try again later.");

      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
      case "[firebase_auth/invalid-email] The email address is badly formatted.":
        return FirebaseFaluire(errMessage: "Email address is invalid.");
      case "[firebase_auth/weak-password] Password should be at least 6 characters":
        return FirebaseFaluire(
            errMessage: "Password should be at least 6 characters");
      default:
        return FirebaseFaluire(errMessage: "Login failed. Please try again.");
    }
  }

  factory FirebaseFaluire.fromFireStore(String exception) {
    return FirebaseFaluire(errMessage: exception);
  }
}
