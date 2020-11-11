import 'package:test/test.dart';
import 'package:pryzlmobileapp/types/pryz_enums.dart';
import 'package:pryzlmobileapp/models/pryz_rating.dart';

void main() {
  group('PryzRating', () {
    test('Check  #1', () {
      expect(PryzRating(4.3, PryzRatingType.service).rating, 4.3);
    });
    test('Check  #2', () {
      expect(PryzRating.parse('4.5', PryzRatingType.service).rating, 4.5);
    });
    test('Check  #3', () {
      expect(PryzRating(4.5, PryzRatingType.service).toString(),
          'PryzRating (Service : 4.5)');
    });
    test('Check  #4', () {
      expect(() => PryzRating(5.6, PryzRatingType.price), throwsException);
    });
  });
}
