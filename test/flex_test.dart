import 'package:flex/flex.dart';
import 'package:test/test.dart';

void main() {
  group('extension_methods', () {
    test('extension_template', () {
      expect(r'Hello, $name!'.fillTemplate({'name': 'World'}), 'Hello, World!', reason: 'When using a map containing all keys used in a template, keys should be replaced with values in the result.');
      expect(r'Hello, $name! You are $age years old.'.fillTemplate({'name': 'World'}), r'Hello, World! You are $age years old.', reason: 'When using a map missing keys used in a template, missing keys should be left unformatted in the result.');
    });

    test('extension_iterable_insensitive', () {
      expect(['UwU'].insensitiveContains('uWu'), true, reason: 'When using insensitiveContains, case should be ignored.');
    });
  });
}
