import 'dart:io';

import 'package:flex/flex.dart';

Future<void> main(List<String> arguments) async {
  print('\n-------- Prompt Test --------');
  final name = await prompt<String>('What is your name?');
  print(r'Hello, $name'.fillTemplate({'name': name}));
  exit(0);
}
