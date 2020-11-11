import 'dart:ui';

/// This class represents an extension to the [Color] class.
///
/// It holds static colors that we use in our UI.
class PryzColor {
  /// [lightBackground] represents the background for dark-on-light looks
  /// and is the text color of choice for dark theme.
  static const Color lightBackground = Color.fromARGB(255, 243, 242, 242);

  /// [darkBackground] represents the background for light-on-dark looks
  /// and is the color for light theme.
  static const Color darkBackground = Color.fromARGB(255, 24, 19, 26);

  /// [mainOrange] represents the main brand color
  /// and applied to main areas as a main identity.
  static const Color mainOrange = Color.fromARGB(255, 250, 81, 58);

  /// [greyAccent] represents the contrast for the rest of the color palette.
  static const Color greyAccent = Color.fromARGB(255, 151, 162, 171);

  /// [goldAccent] is an accent for the design can be used in warnings,
  /// button boundaries, and box boundaries.
  static const Color goldAccent = Color.fromARGB(255, 210, 134, 97);

  /// [errorLight] is the main color for errors
  /// and critical warnings in the light theme.
  static const Color errorLight = Color.fromARGB(255, 210, 134, 97);

  /// [errorDark] is the main color for errors
  /// and critical warnings in the dark theme.
  static const Color errorDark = Color.fromARGB(255, 188, 0, 0);
}
