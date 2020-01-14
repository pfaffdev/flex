import 'package:flex/flex.dart';
import 'package:test/test.dart';

void main() {
  group('extension_methods', () {
    test('extension_template', () {
      expect(r'Hello, $name!'.fillTemplate({'name': 'World'}), 'Hello, World!', reason: 'When using a map containing all keys used in a template, keys should be replaced with values in the result.');
    });

    test('extension_template_missing', () {
      expect(r'Hello, $name! You are $age years old.'.fillTemplate({'name': 'World'}), r'Hello, World! You are {ERROR: Substitution for key $age not found} years old.', reason: 'When using a map missing keys used in a template, missing keys should be left unformatted in the result.');
    });

    test('extension_template_escaped', () {
      // Source: [https://en.wikipedia.org/wiki/Donald_Trump#Wealth](https://en.wikipedia.org/wiki/Donald_Trump#Wealth)
      expect(r'In October 2018, The New York Times reported that $name "was a millionaire by age $age", borrowed at least \$$initial_amount million from his father, largely failed to reimburse him,' r" and had received \$$final_amount million (adjusted for inflation) from his father's business empire over his lifetime.".fillTemplate({'name': 'Trump', 'age': 8, 'initial_amount': 60, 'final_amount': 413}), 'In October 2018, The New York Times reported that Trump "was a millionaire by age 8", borrowed at least \$60 million from his father, largely failed to reimburse him, and had received \$413 million (adjusted for inflation) from his father\'s business empire over his lifetime.', reason: 'Escaped `\$` should be ignored.');
    });

    test('extension_template_variable_at_start', () {
      expect(r"$name! Hey, $name, I'm talking to you!".fillTemplate({'name': 'Jack'}), "Jack! Hey, Jack, I'm talking to you!", reason: 'Variables should work when at the beginning of a string.');
    });

    test('extension_iterable_insensitive', () {
      expect(['UwU'].insensitiveContains('uWu'), true, reason: 'When using insensitiveContains, case should be ignored.');
    });
  });
}
