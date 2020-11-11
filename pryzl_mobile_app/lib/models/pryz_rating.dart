import 'package:pryzlmobileapp/constants/pryz_strings.dart';
import 'package:pryzlmobileapp/types/pryz_enums.dart';
import 'package:pryzlmobileapp/types/pryz_exception.dart';
import 'package:sprintf/sprintf.dart';

/// A class that represents ratings.
class PryzRating {
  /// The [rating] value.
  /// This should always be between 0 and 5.
  double rating;

  /// The type of [PryzRating]
  PryzRatingType type;

  /// Constructs a [PryzRating] instance from a double.
  /// Throws an exception if the value is not within range.
  PryzRating(double value, this.type) {
    if (value > 5 || value < 0) {
      throw PryzException(1001);
    }
    // ignore: prefer_initializing_formals
    rating = value;
  }

  /// Attempts to parse a [PryzRating] from a string.
  /// Throws an exception if the value is not within range.
  PryzRating.parse(String element, this.type) {
    var value = double.parse(element);
    if (value > 5 || value < 0) {
      throw PryzException(1001);
    }
    rating = value;
  }

  /// Prints the string value of this [PryzRating] instance.
  @override
  String toString() {
    String name;
    if (type == PryzRatingType.service) {
      name = Strings.pryzRatingServiceTypeName;
    }
    if (type == PryzRatingType.ambiance) {
      name = Strings.pryzRatingAmbianceTypeName;
    }
    if (type == PryzRatingType.cleanliness) {
      name = Strings.pryzRatingCleanlinessTypeName;
    }
    if (type == PryzRatingType.price) {
      name = Strings.pryzRatingPriceTypeName;
    }
    if (type == PryzRatingType.quality) {
      name = Strings.pryzRatingQualityTypeName;
    }
    return sprintf(Strings.pryzRatingTypeName, [name, rating]);
  }
}
