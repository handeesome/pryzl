import 'package:test/test.dart';
import 'package:pryzlmobileapp/types/pryz_exception.dart';

void main() {
  group('Exceptions:', () {
    test('Check exception with code: null', () {
      var errorCode;
      expect(PryzException(errorCode).message, PryzException(1000).message);
    });

    test('Check exception with code: 404 (does not exist)', () {
      expect(PryzException(404).message, PryzException(1000).message);
    });

    test('Check toString()', () {
      const expected = 'PryzException(1000, Default PryzException message).';
      expect(PryzException(1000).toString(), expected);
    });

    test('Check exception with code: 1000', () {
      const expectedErrorMessage = 'Default PryzException message';
      expect(PryzException(1000).message, expectedErrorMessage);
    });

    test('Check exception with code: 1001', () {
      const expectedErrorMessage =
          'A rating value must be within range of 0 and 5';
      expect(PryzException(1001).message, expectedErrorMessage);
    });

    test('Check exception with code: 2000', () {
      const expectedErrorMessage = 'Data does not have an expected format';
      expect(PryzException(2000).message, expectedErrorMessage);
    });

    test('Check exception with code: 3000', () {
      const expectedErrorMessage = 'IOException';
      expect(PryzException(3000).message, expectedErrorMessage);
    });

    test('Check exception with code: 3001', () {
      const expectedErrorMessage = 'The email address appears to be malformed';
      expect(PryzException(3001).message, expectedErrorMessage);
    });

    test('Check exception with code: 3002', () {
      const expectedErrorMessage = 'The password is wrong';
      expect(PryzException(3002).message, expectedErrorMessage);
    });

    test('Check exception with code: 3003', () {
      const expectedErrorMessage = 'The user with this email doesn\'t exist';
      expect(PryzException(3003).message, expectedErrorMessage);
    });

    test('Check exception with code: 3004', () {
      const expectedErrorMessage = 'The user with this email has been disabled';
      expect(PryzException(3004).message, expectedErrorMessage);
    });

    test('Check exception with code: 3005', () {
      const expectedErrorMessage = 'Too many requests. Try again later';
      expect(PryzException(3005).message, expectedErrorMessage);
    });

    test('Check exception with code: 3006', () {
      const expectedErrorMessage =
          'Signing in with Email and Password is not enabled';
      expect(PryzException(3006).message, expectedErrorMessage);
    });

    test('Check exception with code: 3007', () {
      const expectedErrorMessage = 'Undefined Auth Error';
      expect(PryzException(3007).message, expectedErrorMessage);
    });

    test('Check exception with code: 3008', () {
      const expectedErrorMessage = 'Anonymous accounts are not enabled';
      expect(PryzException(3008).message, expectedErrorMessage);
    });

    test('Check exception with code: 3009', () {
      const expectedErrorMessage = 'The password is not strong enough';
      expect(PryzException(3009).message, expectedErrorMessage);
    });

    test('Check exception with code: 3010', () {
      const expectedErrorMessage =
          'The email is already in use by a different account';
      expect(PryzException(3010).message, expectedErrorMessage);
    });

    test('Check exception with code: 4000', () {
      const expectedErrorMessage =
          'A timeout happened while waiting for a result';
      expect(PryzException(4000).message, expectedErrorMessage);
    });

    test('Check exception with code: 5000', () {
      const expectedErrorMessage = 'IntegerDivisionByZeroException';
      expect(PryzException(5000).message, expectedErrorMessage);
    });

    test('Check exception with code: 9999', () {
      const expectedErrorMessage = 'A fatal exception occurred';
      expect(PryzException(9999).message, expectedErrorMessage);
    });
    test('Check fromErrorCodeAndMessage with code: 0000', () {
      var exception = PryzException.fromErrorCodeAndMessage(0000, 'Foo');
      expect(exception.message, 'Foo');
    });
    test('Check fromErrorCodeAndMessage with code: 1000 (duplicates)', () {
      var exception = PryzException.fromErrorCodeAndMessage(1000, 'Foo');
      expect(exception.message, PryzException(1000).message);
    });
  });
}
