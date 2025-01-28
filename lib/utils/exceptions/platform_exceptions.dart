/// Exception class to handle various platform-related errors.
class MPlatformExceptions implements Exception {
  final String code;

  MPlatformExceptions(this.code);

  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credential, please double-check your information';
      case 'too-many-requests':
        return 'Too many requests, please try again later. ';
      case 'invalid-argument':
        return 'Invalid argument provided to the authentication method.';
      case 'invalid-password':
        return 'Incorrect password please try again.';
      case 'invalid-phone-number':
        return 'The provided phone number is invalid.';
      case 'session-cookie-expired':
        return 'The firebase session cookie has expired, please sign in again.';
      case 'uid-already-exists':
        return 'The provided user ID is already in use by another user';
      case 'sign-in-failed':
        return 'Sign-in failed please try again.';
      case 'network-request-failed':
        return 'Network request failed, please check your internet connection';
      case 'internal-error':
        return 'Internal error, please try again later';
      case 'invalid-verification-code':
        return 'Invalid verification code, please enter a valid code.';
      default:
        return code.toString();
    }
  }
}
