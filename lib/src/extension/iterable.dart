import 'package:flex/flex.dart';

/// Provides extension functions on [Iterable] with element type [String]
extension ExtIterable on Iterable<String> {
  /// Checks whether any element of this iterable loosely matches [element].
  ///
  /// "Loosely" being case-insensitive and discarding whitespace.
  ///
  /// Checks every element in iteration order, and returns true if any of them loosely match [element], otherwise returns false.
  bool insensitiveContains(String element) => any((s) => s.toLowerCase().replaceAll(whitespacePattern, '') == element.toLowerCase().replaceAll(whitespacePattern, ''));
}
