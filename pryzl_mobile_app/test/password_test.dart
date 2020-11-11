import 'package:test/test.dart';
import 'package:pryzlmobileapp/types/pryz_enums.dart';
import 'package:pryzlmobileapp/types/pryz_password.dart';

void main() {
  group('PryzPassword.passwordStrength', () {
    test('Check weak password #1', () {
      var password = '';
      expect(
          PryzPassword.passwordStrength(password), PryzPasswordStrength.weak);
    });

    test('Check weak password #2', () {
      var password;
      expect(
          PryzPassword.passwordStrength(password), PryzPasswordStrength.weak);
    });

    test('Check weak password #3', () {
      var password = 'ffff';
      expect(
          PryzPassword.passwordStrength(password), PryzPasswordStrength.weak);
    });

    test('Check weak password #4', () {
      var password = '12345678';
      expect(
          PryzPassword.passwordStrength(password), PryzPasswordStrength.weak);
    });

    test('Check weak password #5', () {
      var password = 'abcdefgh';
      expect(
          PryzPassword.passwordStrength(password), PryzPasswordStrength.weak);
    });

    test('Check weak password #6', () {
      var password = 'ABCDEFGH';
      expect(
          PryzPassword.passwordStrength(password), PryzPasswordStrength.weak);
    });

    test('Check medium password #1', () {
      var password = 'password123';
      expect(
          PryzPassword.passwordStrength(password), PryzPasswordStrength.medium);
    });

    test('Check medium password #2', () {
      var password = 'AbCdEf12';
      expect(
          PryzPassword.passwordStrength(password), PryzPasswordStrength.medium);
    });

    test('Check medium password #3', () {
      var password = 'AbCdEf12fenJNFJ7478';
      expect(
          PryzPassword.passwordStrength(password), PryzPasswordStrength.medium);
    });

    test('Check strong password #1', () {
      var password = 'R9q8&2dPKVL#7Pa4ol6KZ5x*D0%WV';
      expect(
          PryzPassword.passwordStrength(password), PryzPasswordStrength.strong);
    });

    test('Check strong password #2', () {
      var password = 'AbcD#511';
      expect(
          PryzPassword.passwordStrength(password), PryzPasswordStrength.strong);
    });
  });
}
