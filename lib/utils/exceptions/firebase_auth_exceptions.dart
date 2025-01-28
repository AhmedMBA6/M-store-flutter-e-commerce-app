/// Custom exception class to handle various firebase authentication-related errors.
class MFirebaseAuthExceptions implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// the constructor that takes an error code.
  MFirebaseAuthExceptions(this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already registered, Please use different email. ';
      case 'invalid-email':
        return 'The email address provided is invalid, Please enter a valid email. ';
      case 'weak-password':
        return 'The Password  is too weak, Please use a stronger password. ';
      case 'user-disabled':
        return 'This user account has been disabled, Please contact support for assistance. ';
      case 'user-not-found':
        return 'Invalid login details, User not found. ';
      case 'wrong-password':
        return 'Incorrect Password, Please check your password and try again. ';
      case 'invalid-verification-code':
        return 'Invalid verification code, please enter a valid code. ';
      case 'invalid-verification-id':
        return 'Invalid Verificatoin ID, Please request a new verification code. ';
      case 'quota-exceeded':
        return 'Quota exceeded, Please try again later. ';
      case 'email-already-exists':
        return 'The email address already exists, Please use different email. ';
      case 'provider-already-linked':
        return 'The account is already linked with another provider. ';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication, Please log in again. ';
      case 'credential-already-in-use':
        return 'The credential is already associated with a different user account. ';
      case 'user-mismatch':
        return 'The supplied credentials don\'t correspond to the previously signed in user . ';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email but different sign-in credentials. ';
      case 'operation-not-allowed':
        return 'This operation is not allowed, contact support for assistance. ';
      case 'expired-action-code':
        return 'The action code has expired, please request a new action code. ';
      case 'invalid-action-code':
        return 'The action code is invalid,  please check the code and try again. ';
      case 'missing-action-code':
        return 'The action code is missing, please provide a valid action code. ';
      case 'user-token-expired':
        return 'The user\'s token has expired, and authentication is required, please sign in again. ';
      case 'user-token-revoked':
        return 'The user\'s token has been revoked, please sign in again. ';
      case 'invalid-sender':
        return 'The email template sender is invalid, please verify the sender\'s email. ';
      case 'invalid-message-payload':
        return 'The email template verification message payload is invalid. ';
      default:
        return code.toString();
    }
  }
}
