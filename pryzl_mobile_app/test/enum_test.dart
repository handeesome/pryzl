import 'package:test/test.dart';
import 'package:pryzlmobileapp/types/pryz_enums.dart';

/// These are checks to detect if any changes have been made to our enum values.
void main() {
  /// [PryzPasswordStrength] enum logic.
  group('PryzPasswordEnum', () {
    test('PryzPasswordStrength enum must contain 3 values only', () {
      expect(PryzPasswordStrength.values.length, 3);
    });
    test('PryzPasswordStrength.weak has value 0 ', () {
      expect(PryzPasswordStrength.weak.index, 0);
    });
    test('PryzPasswordStrength.weak has value 1 ', () {
      expect(PryzPasswordStrength.medium.index, 1);
    });
    test('PryzPasswordStrength.weak has value 0 ', () {
      expect(PryzPasswordStrength.strong.index, 2);
    });
  });

  /// [PryzRatingEnum] enum logic.
  group('PryzRatingEnum', () {
    test('PryzPasswordStrength enum must contain 3 values only', () {
      expect(PryzRatingType.values.length, 5);
    });
    test('PryzRatingType.quality has value 0', () {
      expect(PryzRatingType.quality.index, 0);
    });
    test('PryzRatingType.service has value 1', () {
      expect(PryzRatingType.service.index, 1);
    });
    test('PryzRatingType.ambiance has value 2', () {
      expect(PryzRatingType.ambiance.index, 2);
    });
    test('PryzRatingType.cleanliness has value 3', () {
      expect(PryzRatingType.cleanliness.index, 3);
    });
    test('PryzRatingType.price has value 4', () {
      expect(PryzRatingType.price.index, 4);
    });
  });

  test('PryzActivityStatus enum must contain 4 values only', () {
    expect(PryzActivityStatus.values.length, 4);
  });
  test('PryzActivityStatus.online has value 0', () {
    expect(PryzActivityStatus.online.index, 0);
  });
  test('PryzActivityStatus.offline has value 1', () {
    expect(PryzActivityStatus.offline.index, 1);
  });
  test('PryzActivityStatus.notAvailable has value 2', () {
    expect(PryzActivityStatus.notAvailable.index, 2);
  });

  test('PryzActivityStatus.unknown has value 3', () {
    expect(PryzActivityStatus.unknown.index, 3);
  });
}
