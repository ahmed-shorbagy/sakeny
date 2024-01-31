abstract class Faluire {
  final String errMessage;

  Faluire({required this.errMessage});
}

class FirbaseFaluire extends Faluire {
  FirbaseFaluire({required super.errMessage});
  factory FirbaseFaluire.fromFirebaseAuth(String authException) {
    switch (authException) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return FirbaseFaluire(
            errMessage: "Email already used. Go to login page.");

      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return FirbaseFaluire(errMessage: "Wrong email/password combination.");

      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return FirbaseFaluire(errMessage: "No user found with this email.");

      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return FirbaseFaluire(errMessage: "User disabled.");

      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return FirbaseFaluire(
            errMessage: "Too many requests to log into this account.");

      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        return FirbaseFaluire(
            errMessage: "Server error, please try again later.");

      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return FirbaseFaluire(errMessage: "Email address is invalid.");

      default:
        return FirbaseFaluire(errMessage: "Login failed. Please try again.");
    }
  }
}
