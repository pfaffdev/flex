import 'dart:io';

import 'package:flex/flex.dart';

Future<void> main(List<String> arguments) async {
  print('\n-------- PatientStreamQueue Non-Waiting Test --------');
  final nonwaiting = PatientStreamQueue<String>();
  nonwaiting.add('Hello!');
  nonwaiting.add('How are you?');
  nonwaiting.add('> I am good.');
  nonwaiting.listen(print);
  nonwaiting.add('That is good!');
  nonwaiting.dispose();
  exit(0);
}
