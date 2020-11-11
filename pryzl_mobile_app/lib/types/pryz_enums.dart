import 'package:pryzlmobileapp/models/pryz_rating.dart';

/// A password strength enumerator.
///
/// [weak] defines weak passwords. This holds for alphabetic only or numeric
/// only strings. Also, if the password's length is less than 8 characters,
/// then it is automatically considered a weak password.
///
/// 12345678, abcdefgh
///
/// [medium] defines medium strength passwords. This holds for alphanumeric
/// strings with the length of at least 8 characters.
///
/// password123, AbCdEf12
///
/// [strong] defines strong and complex passwords. This holds for a string
/// containing at least one upper case, one lower case, one digit, and one
/// special character (!@#\$&*~), and has the length of minimum 8 characters.
///
/// R9q8&2dPKVL#7Pa4ol6KZ5x*D0%WV
enum PryzPasswordStrength { weak, medium, strong }

/// An activity status enumerator.
enum PryzActivityStatus { online, offline, notAvailable, unknown }

/// A rating type enumerator.
///
/// [quality] defines a quality [PryzRating].
///
/// [service] defines a service [PryzRating].
///
/// [ambiance] defines an ambiance [PryzRating].
///
/// [cleanliness] defines a cleanliness [PryzRating].
///
/// [price] defines a price [PryzRating].
enum PryzRatingType { quality, service, ambiance, cleanliness, price }
