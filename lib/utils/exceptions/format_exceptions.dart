/// Custom exception class to handle various format-related errors.
class MFormatExceptions implements Exception {
  /// The associated error message.
  final String message;

  /// Default constructor with a generic  error message.
  const MFormatExceptions(
      [this.message =
          "an un expected format error occures, please check your input."]);

  /// create a format exception from aspecific error message.
  factory MFormatExceptions.fromMessage(String message) {
    return MFormatExceptions(message);
  }

  /// Get the corresponding error message
  String get formattedMessage => message;

  /// Create a format exception from a specific error code.
  factory MFormatExceptions.fromCode(String code) {
    switch (code) {
      case "invalid-email-format":
        return const MFormatExceptions(
            "The email address format is invalid, please enter a valid email");
      case "invalid-phone-number-format":
        return const MFormatExceptions(
            "The provided phone number format is invalid, please enter a valid number");
      case "invalid-date-format":
        return const MFormatExceptions(
            "The date format is invalid, please enter a valid date");
      case "invalid-url-format":
        return const MFormatExceptions(
            "The URL format is invalid, please enter a valid URL");
      case "invalid-credit-card-format":
        return const MFormatExceptions(
            "The credit card format is invalid, please enter a valid credit card number");
      case "invalid-numeric-format":
        return const MFormatExceptions(
            "The Input should be a valid numeric format. ");
      default:
        return const MFormatExceptions();
    }
  }
}
