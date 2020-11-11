/// [PryzException] is our own implementation of [Exception]. It allows us to
/// have an [errorCode] and an optional [message]. [errorCode] indicates
/// the fatality, i.e. the higher the number is, the more severe the
/// [PryzException] is. For the exception messages that we intend to show to the
/// user, we need to make then understandable by the user. Every time we want to
/// add a new type of exception, we can simply expand [codeToMessage].

// TODO(Khurshid): Add Firebase Google Auth exception here.
// TODO(Enis): Add Firebase Facebook Auth exception here.
const codeToMessage = {
  1000: 'Default PryzException message',
  1001: 'A rating value must be within range of 0 and 5',
  2000: 'Data does not have an expected format',
  3000: 'IOException',
  // begin : FirebaseAuth exceptions.
  3001: 'The email address appears to be malformed',
  3002: 'The password is wrong',
  3003: 'The user with this email doesn\'t exist',
  3004: 'The user with this email has been disabled',
  3005: 'Too many requests. Try again later',
  3006: 'Signing in with Email and Password is not enabled',
  3007: 'Undefined Auth Error',
  3008: 'Anonymous accounts are not enabled',
  3009: 'The password is not strong enough',
  3010: 'The email is already in use by a different account',
  // end : FirebaseAuth exceptions.
  4000: 'A timeout happened while waiting for a result',
  5000: 'IntegerDivisionByZeroException',
  9999: 'A fatal exception occurred',
};

class PryzException implements Exception {
  final int errorCode;
  String message;

  /// The constructor creates a [PryzException] by using [errorCode] that looks
  /// up the [message] in [codeToMessage]. If [errorCode] doesn't exist or
  /// is null, it gives the default message.
  PryzException(this.errorCode) {
    if (errorCode == null || !codeToMessage.containsKey(errorCode)) {
      // TODO(Anyone): Log this event with logger.w, https://pryzl.atlassian.net/browse/PRYZ-105
      message = codeToMessage[1000];
    } else {
      message = codeToMessage[errorCode];
    }
  }

  /// Named constructor creates a [PryzException] by using both [errorCode] and
  /// [message]. If [errorCode] duplicates an exiting code, it still looks up
  /// the [message] in [codeToMessage].
  /// It's encouraged to expand [codeToMessage] and use the normal constructor
  /// instead of this named constructor.
  PryzException.fromErrorCodeAndMessage(this.errorCode, String message) {
    if (codeToMessage.containsKey(errorCode)) {
      // TODO(Anyone): Log this event with logger.w, https://pryzl.atlassian.net/browse/PRYZ-105
      this.message = codeToMessage[errorCode];
    } else {
      this.message = message;
    }
  }

  @override
  String toString() => 'PryzException($errorCode, $message).';
}
