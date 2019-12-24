import 'dart:io';

import 'package:flex/flex.dart';

Future<void> main(List<String> arguments) async {
  print('\n-------- PatientStreamQueue Waiting Test --------');
  final waiting = PatientStreamQueue<String>();
  waiting.add('Hello!');
  waiting.add('How are you?');
  waiting.add('> I am good.');
  waiting.listen(print);
  waiting.add('That is good!');
  await waiting.close();
  exit(0);
}
