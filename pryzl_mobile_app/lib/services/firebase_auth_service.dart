import 'package:firebase_auth/firebase_auth.dart';

/// Firebase Auth Service class that acts as a wrapper for the different
/// Firebase packages used in Pryzl.
class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// Returns the currently signed-in [FirebaseUser] or [null] if there is none.
  Future<FirebaseUser> getCurrentUser() async {
    return _firebaseAuth.currentUser();
  }

  /// Discovers the authentication state of the user.
  Stream<FirebaseUser> get onAuthStateChanged =>
      _firebaseAuth.onAuthStateChanged;

  /// Logout of the current logged in user.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  /// Creates a new user in Firebase using [email] and [password].
  ///
  /// Returns [FirebaseUser] on success, or [null] on error.
  /// [_auth.createUserWithEmailAndPassword] raises error details.
  /// Errors:
  ///
  ///   * `ERROR_OPERATION_NOT_ALLOWED` - Indicates that Anonymous accounts are
  ///       not enabled.
  ///   * `ERROR_WEAK_PASSWORD` - If the [password] is not strong enough.
  ///   * `ERROR_INVALID_EMAIL` - If the [email] is malformed.
  ///   * `ERROR_EMAIL_ALREADY_IN_USE` - If the [email] is already in use by
  ///       a different account.
  ///   * `ERROR_INVALID_CREDENTIAL` - If the [email] address is malformed.
  Future<FirebaseUser> createUserWithEmailAndPassword(
      String email, String password) async {
    assert(email != null, 'Email must not be null');
    assert(password != null, 'Password must not be null');
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return authResult.user;
      // TODO(Hamza): implement custom Exception.
    } catch (e) {
      // TODO(Anyone): Log this event with logger.w, https://pryzl.atlassian.net/browse/PRYZ-105
      print('createUserWithEmailAndPassword() failed: $e');
      return null;
    }
  }

  /// Login using [email] and [password].
  ///
  /// Returns [FirebaseUser] on success, or [null] on error.
  /// [_auth.signInWithEmailAndPassword] raises error details.
  /// Errors:
  ///
  ///   * `ERROR_INVALID_EMAIL` - If the [email] address is malformed.
  ///   * `ERROR_WRONG_PASSWORD` - If the [password] is wrong.
  ///   * `ERROR_USER_NOT_FOUND` - If there is no user corresponding to the
  ///       given [email] address, or if the user has been deleted.
  ///   * `ERROR_USER_DISABLED` - If the user has been disabled (for example,
  ///       in the Firebase console)
  ///   * `ERROR_TOO_MANY_REQUESTS` - If there was too many attempts to sign in
  ///       as this user.
  ///   * `ERROR_OPERATION_NOT_ALLOWED` - Indicates that Email & Password
  ///       accounts are not enabled.
  Future<FirebaseUser> signInWithEmailAndPassword(
      String email, String password) async {
    assert(email != null, 'Email must not be null');
    assert(password != null, 'Password must not be null');
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return authResult.user;
      // TODO(Hamza): implement custom Exception.
    } catch (e) {
      // TODO(Anyone): Log this event with logger.w, https://pryzl.atlassian.net/browse/PRYZ-105
      print('signInWithEmailAndPassword() failed: $e');
      return null;
    }
  }
}
