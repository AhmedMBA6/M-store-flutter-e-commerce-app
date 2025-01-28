/// Custom exception class to handle various firebase-related errors.
class MFirebaseExceptions implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// the constructor that takes an error code.
  MFirebaseExceptions(this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown firebase error occured, please try again';
      case 'invalid-custom-token':
        return 'The custom token format is incorrect, please check your custom token';
      case 'custom-token-mismatch':
        return 'The custom token is coresponds to a different consumer';
      case 'user-disabled':
        return 'The user account has been disabled';
      case 'user-not-found':
        return 'No user found for the given email or uid';
      case 'invalid-email':
        return 'the email address provided is invalid, please enter a valid email';
      case 'captcha-check-valid':
        return 'The reCaptcha response is invalid, please try again';
      case 'keychain-error':
        return 'A keychain error occured, please check the keychain and try again';
      case 'internal-error':
        return 'An internal authentication error occurred, please try again later';
      case 'email-already-in-use':
        return 'The email address is already registered, Please use different email. ';
      case 'weak-password':
        return 'The Password  is too weak, Please use a stronger password. ';
      case 'wrong-password':
        return 'Incorrect Password, Please check your password and try again. ';
      case 'app-deleted':
        return 'This instance of firebase app has been deleted';
      case 'invalid-action-code':
        return 'The action code is invalid, please check the code and try again.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      default:
        return 'An unexpected Firebase error occurred, please try again.';
    }
  }
}
