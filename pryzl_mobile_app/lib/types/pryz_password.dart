import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:pryzlmobileapp/types/pryz_enums.dart';

/// A class that represents passwords and their corresponding methods to hash
/// and validate passwords securely.
class PryzPassword {
  String salt;
  String hashedPassword;

  PryzPassword(String password) {
    salt = generateSalt();
    hashedPassword = hashPassword(password);
  }

  /// A static method that checks how strong the input password is.
  ///
  /// There are three possible outcomes. Depending on certain criteria,
  /// PryzPasswordStrength enumerated type is returned.
  static PryzPasswordStrength passwordStrength(String password) {
    var score = 0;
    if (password?.isEmpty ?? true) {
      return PryzPasswordStrength.weak;
    }

    // medium strength password
    if (RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9]).{8,}$').hasMatch(password) ||
        RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$').hasMatch(password)) {
      score++;
    }

    // strong and complex strength password
    if (RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password)) {
      score++;
    }

    return PryzPasswordStrength.values[score];
  }

  /// Returns the salt by generating and encoding random bytes.
  ///
  /// [length] is for the underlying bytes, not the resulting string.
  /// https://www.scottbrady91.com/Dart/Generating-a-Crypto-Random-String-in-Dart
  /// https://stackoverflow.com/questions/62708273/how-unique-is-the-salt-produced-by-this-function
  static String generateSalt([int length = 32]) {
    var random = Random.secure();
    var values = List<int>.generate(length, (i) => random.nextInt(256));
    return base64Url.encode(values);
  }

  /// Hashes and returns the concatenated string of [password] and [salt].
  String hashPassword(String password) {
    var bytes = utf8.encode(password + salt);
    return sha256.convert(bytes).toString();
  }
}
