# Flutter Code Conventions

* [Flutter Code Conventions](#flutter-code-conventions)
  * [Introduction](#introduction)
  * [Style](#style)
    * [Identifiers](#identifiers)
    * [Ordering](#ordering)
    * [Formatting](#formatting)
  * [Documentation](#documentation)
    * [Comments](#comments)
    * [Doc Comments](#doc-comments)
  * [Usage](#usage)
    * [Booleans](#booleans)
    * [Strings](#strings)
    * [Collections](#collections)
    * [Members](#members)
    * [Constructors](#constructors)
  * [Design](#design)
    * [Names](#names)
    * [Types](#types)
    * [Equality](#equality)
  * [References](#references)

## Introduction

This guide is a summary from multiple sources. If interested, we can also read through [Google's code conventions for Flutter](https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo#prefer-single-quotes-for-strings).

The two overarching themes for effective Dart:

1. Be consistent.

2. Be brief.

One rule of thumb: **always** use `dartfmt` to format your code.

The rules that might appear surprising or are worth special attention start with **!ATTENTION!**.

## Style

### Identifiers

Name classes, enums, and types using **UpperCamelCase**:

```dart
// GOOD
class HttpRequest {...}
enum Color {...}
```

Name libraries, packages, directories, and source files using **lowercase_with_underscores**:

```dart
// GOOD
library peg_parser.source_scanner;
import 'file_system.dart';
```

Name other identifiers using **lowerCamelCase**:

```dart
// GOOD
var item;

HttpRequest httpRequest;

void align(bool clearItems) {...}
```

**!ATTENTION!** Use `lowerCamelCase` for constant names, unlike in Java/C++/etc:

```dart
// GOOD
const pi = 3.14;
final urlScheme = RegExp('^([a-z]+):');
class Dice {
  static final numberGenerator = Random();
}
```

```dart
// BAD
const PI = 3.14;
final URL_SCHEME = RegExp('^([a-z]+):');
class Dice {
  static final NUMBER_GENERATOR = Random();
}
```

**!ATTENTION!** Capitalize acronyms longer than two letters like normal words:

```dart
// GOOD
HttpConnectionInfo
IOStream
Id // Special case
DB
```

```dart
// BAD
HTTPConnectionInfo
IoStream
ID
Db
```

### Ordering

Import alphabetically in the order of: `dart:`, `package:`, relative imports.

```dart
// GOOD
import 'dart:async';
import 'dart:html';

import 'package:bar/bar.dart';
import 'package:foo/foo.dart';

import 'util.dart';
```

### Formatting

Always format your code with `dartfmt`.

Avoid lines longer than 80 characters.

Use curly braces for flow control, even if there's only one line inside:

```dart
// GOOD
if (overflowChars != other.overflowChars) {
  return overflowChars < other.overflowChars;
}
```

```dart
// BAD
if (overflowChars != other.overflowChars)
  return overflowChars < other.overflowChars;
```

## Documentation

### Comments

**!ATTENTION!** Always format comments like sentences, which means always add a punctuation at the end. This is true even if it's inline comments, TODOs, or a sentence fragment.

**!ATTENTION!** Never use `/**/` for documentation. Use it only for temporarily commenting out code.

### Doc Comments

**!ATTENTION!** `dartdoc` can generate HTML documentation. In order to use it, use `///` to document.

```dart
// GOOD
/// The number of characters in this chunk when unsplit.
int get length => ...
```

**!ATTENTION!** Unlike Java/Python/C++, use prose to *explain* instead of using verbose tags and sections:

```dart
// GOOD

/// Defines a flag.
///
/// Throws an [ArgumentError] if there is already an option named [name] or
/// there is already an option using abbreviation [abbr]. Returns the new flag.
Flag addFlag(String name, String abbr) => ...
```

```dart
// BAD

/// Defines a flag with the given name and abbreviation.
///
/// @param name The name of the flag.
/// @param abbr The abbreviation for the flag.
/// @returns The new flag.
/// @throws ArgumentError If there is already an option with
///     the given name or abbreviation.
Flag addFlag(String name, String abbr) => ...
```

Consider using code samples when necessary:

```dart
/// Returns the lesser of two numbers.
///
/// ```dart
/// min(5, 3) == 3
/// ```
num min(num a, num b) => ...
```

## Usage

### Booleans

**!ATTENTION!** Since Dart *only* evaluates `true` and `false` as booleans, use `??` to convert `null` to a boolean value:

```dart
// GOOD

// If you want null to be false:
optionalThing?.isEnabled ?? false;

// If you want null to be true:
optionalThing?.isEnabled ?? true;
```

```dart
// BAD
if (optionalThing?.isEnabled) { // If optionalThing is null, isEnabled gives null.
  print("Have enabled thing.");
}
```

### Strings

**!ATTENTION!** We use single quote `'` unless we need to escape it:

```dart
// GOOD

var foo = 'Dart is cool!';
var bar = "Doesn't it?";
```

```dart
// BAD
var foo = "Dart if cool!";
var bar = 'Doesn\'t it?';
```

**!ATTENTION!** We store all the strings in the `Strings` class instead of hard-coding them:

```dart
// GOOD
class Strings {
  static String welcomeMessage = 'Welcome To Flutter.';
}

Text(Strings.welcomeMessage) // Access.
```

```dart
// BAD
Text('Welcome To Flutter.')
```

**!ATTENTION!** Use interpolation and adjacent strings instead of concatenation:

```dart
// GOOD
raiseAlarm(
    'ERROR: Parts of the spaceship are on fire. Other '
    'parts are overrun by martians. Unclear which are which.');

'Hello, $name! You are ${year - birth} years old.';
```

```dart
// BAD
raiseAlarm('ERROR: Parts of the spaceship are on fire. Other ' +
    'parts are overrun by martians. Unclear which are which.');

'Hello, ' + name + '! You are ' + (year - birth).toString() + ' y...';
```

**!ATTENTION!** Avoid using curly braces in interpolation when not needed:

```dart
// GOOD
'Hi, $name!'
    "Wear your wildest $decade's outfit."
    'Wear your wildest ${decade}s outfit.'
```

```dart
// BAD
'Hi, ${name}!'
    "Wear your wildest ${decade}'s outfit."
```

### Collections

**!ATTENTION!** Use collection literals when possible:

```dart
// GOOD
var points = [];
var addresses = {};
var points = <Point>[];
var addresses = <String, Address>{};
```

```dart
// BAD
var points = List();
var addresses = Map();
var points = List<Point>();
var addresses = Map<String, Address>();
```

**!ATTENTION!** Use `isEmpty` and `isNotEmpty`:

```dart
// GOOD
if (lunchBox.isEmpty) return 'so hungry...';
if (words.isNotEmpty) return words.join(' ');
```

```dart
// BAD
if (lunchBox.length == 0) return 'so hungry...';
if (!words.isEmpty) return words.join(' ');
```

### Members

**!ATTENTION!** Don't use getters and setters unnecessarily. Unlike Java/C++, fields and getters/setters are indistinguishable in Dart.

```dart
// GOOD
class Box {
  var contents;
}
```

```dart
// BAD
class Box {
  var _contents;
  get contents => _contents;
  set contents(value) {
    _contents = value;
  }
}
```

**!ATTENTION!** Don't use `this.` except to redirect to a named constructor or to avoid shadowing:

```dart
// GOOD
class Box {
  var value;

  void clear() {
    update(null);
  }

  void update(value) {
    this.value = value;
  }
}
```

```dart
// BAD
class Box {
  var value;

  void clear() {
    this.update(null);
  }

  void update(value) {
    this.value = value;
  }
}
```

**!ATTENTION!** Prefer making fields and top-level variables final.

State that is not mutable—that does not change over time—is easier for programmers to reason about. Classes and libraries that minimize the amount of mutable state they work with tend to be easier to maintain.

Of course, it is often useful to have mutable data. But, if you don’t need it, your default should be to make fields and top-level variables final when you can.

### Constructors

**!ATTENTION!** Use initializing formals when possible:

```dart
// GOOD
class Point {
  double x, y;
  Point(this.x, this.y);
}
```

```dart
// BAD
class Point {
  double x, y;
  Point(double x, double y) {
    this.x = x;
    this.y = y;
  }
}
```

**!ATTENTION!** Unlike Java/C++, don't use `new` in Dart:

```dart
// GOOD
Widget build(BuildContext context) {
  return Row(
    children: [
      RaisedButton(
        child: Text('Increment'),
      ),
      Text('Click!'),
    ],
  );
}
```

```dart
// BAD
Widget build(BuildContext context) {
  return new Row(
    children: [
      new RaisedButton(
        child: new Text('Increment'),
      ),
      new Text('Click!'),
    ],
  );
}
```

Consider making your constructor const if the class supports it.

If you have a class where all the fields are final, and the constructor does nothing but initialize them, you can make that constructor const. That lets users create instances of your class in places where constants are required—inside other larger constants, switch cases, default parameter values, etc.

## Design

### Names

Prefer a non-imperative verb phrase for a boolean property or variable. Good names tend to start with one of a few kinds of verbs: a form of “to be”, an auxiliary verb, an active verb.

```dart
// GOOD
isEmpty
hasElements
canClose
closesWindow
canShowPopup
hasShownPopup
```

```dart
empty
withElements
closeable
closingWindow
showPopup
```

Prefer the “positive” name for a boolean property or variable:

```dart
// GOOD
if (socket.isConnected && database.hasData) {
  socket.write(database.read());
}
```

```dart
// BAD
if (!socket.isDisconnected && !database.isEmpty) {
  socket.write(database.read());
}
```

### Members

### Types

**!ATTENTION!** Avoid type annotations for local variables, but do use them for function signatures:

```dart
// GOOD
List<List<Ingredient>> possibleDesserts(Set<Ingredient> pantry) {
  var desserts = <List<Ingredient>>[];
  for (var recipe in cookbook) {
    if (pantry.containsAll(recipe)) {
      desserts.add(recipe);
    }
  }

  return desserts;
}
```

```dart
// BAD
List<List<Ingredient>> possibleDesserts(Set<Ingredient> pantry) {
  List<List<Ingredient>> desserts = <List<Ingredient>>[];
  for (List<Ingredient> recipe in cookbook) {
    if (pantry.containsAll(recipe)) {
      desserts.add(recipe);
    }
  }

  return desserts;
}
```

**!ATTENTION!** Avoid redundant type arguments on generic invocations, unless there isn't enough information:

```dart
// GOOD
Set<String> things = Set();
var things = Set<String>();
```

```dart
// BAD
Set<String> things = Set<String>();
var things = Set();
```

**!ATTENTION!** Don't specify a return type for a setter:

```dart
// GOOD
set foo(Foo value) { ... }
```

```dart
// BAD
void set foo(Foo value) { ... }
```


### Equality

**!ATTENTION!** Don't check for null in custom == operators:

```dart
// GOOD
class Person {
  final String name;
  // ···
  bool operator ==(other) => other is Person && name == other.name;

  int get hashCode => name.hashCode;
}
```

```dart
// BAD
class Person {
  final String name;
  // ···
  bool operator ==(other) => other != null && ...
}
```

**!ATTENTION!** Always override `hashCode` if we override `==`, since two objects must have the same hash code if they are equal.

## References

* [Flutter for Android Developers](https://flutter.dev/docs/get-started/flutter-for/android-devs)

* [Effective Dart](https://dart.dev/guides/language/effective-dart)
