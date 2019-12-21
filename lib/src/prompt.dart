import 'dart:convert';
import 'dart:io';

import 'package:flex/flex.dart';
import 'package:io/io.dart';
import 'package:meta/meta.dart';

/// Prompts the user to enter anything, with the option of not echoing stdin to stdout.
String promptFor({@required String prompt, String promptSuffix = ' >>> ', bool echo = true}) {
  stdin.echoMode = echo;

  stdout.write('$prompt$promptSuffix');
  final pwd = stdin.readLineSync();
  // Print newline if echo is disabled.
  if (!echo) stdout.writeln();

  stdin.echoMode = true;

  return pwd;
}

/// Prompts the user through the console with [question].
///
/// [fallback] can be used to specify a value of type [T] to be used if the user's response is empty.
///
/// [hint] can be used to override the default hint that will be printed after [question] surrounded by parentheses.
///
/// [parse] must n
T promptSync<T>(String question, {T fallback, String hint, T Function(String) parse, bool echo = true, bool debug = false}) {
  assert(T is String || parse != null, '`parse` can only be null if T is String. T is $T');

  stdin.echoMode = echo;

  stdout.write('$question${hint != null || fallback != null ? ' (${hint ?? fallback})' : ''} >>> ');

  final ret = stdin.readLineSync();

  if (debug) {
    print('[INPUT = $ret]'); // for debugging
  }

  if (ret.isEmpty && fallback != null) {
    return fallback;
  } else if (parse != null) {
    try {
      return parse(ret);
    } on FormatException {
      return fallback;
    }
  }

  // Print newline if echo is disabled.
  if (!echo) stdout.writeln();

  stdin.echoMode = true;

  return ret as T;
}

/// Prompts the user through the console with [question] and returns their yes or no response.
//ignore: avoid_positional_boolean_parameters
bool shouldPromptSync(String question, [bool def = true]) => promptSync<bool>(question, fallback: def, hint: '${def ? 'Y' : 'y'}/${def ? 'n' : 'N'}', parse: formsOfYes.insensitiveContains);

/// Wrapper around [sharedStdin] providing each character as a [String]
final Stream<String> stdinUtf8 = sharedStdIn.transform(utf8.decoder).asBroadcastStream();

/// Wrapper around [stdinUtf8] splitting at line endings
final Stream<String> stdinLined = stdinUtf8.transform(const LineSplitter());

/// Prompts the user through the console with [question].
///
/// [fallback] can be used to specify a value of type [T] to be used if the user's response is empty.
///
/// [hint] can be used to override the default hint that will be printed after [question] surrounded by parentheses.
///
/// [parse] must n
Future<T> prompt<T>(String question, {T fallback, T def, String hint, T Function(String) parse, bool echo = true, bool debug = false}) async {
  assert(T is String || parse != null, '`parse` can only be null if T is String. T is $T');

  stdin.echoMode = echo;

  stdout.write('$question${hint != null || def != null ? ' (${hint ?? def})' : ''} >>> ');

  final ret = await stdinLined.first;

  if (debug) {
    print('[INPUT = $ret]'); // for debugging
  }

  if (ret.isEmpty && fallback != null) {
    return def;
  } else if (parse != null) {
    try {
      return parse(ret);
    } on FormatException {
      return fallback;
    }
  }

  // Print newline if echo is disabled.
  if (!echo) stdout.writeln();

  stdin.echoMode = true;

  return ret as T;
}

/// Prompts the user through the console with [question] and returns their yes or no response.
//ignore: avoid_positional_boolean_parameters
Future<bool> shouldPrompt(String question, [bool def = true, bool fallback = false]) => prompt<bool>(question, fallback: fallback, def: def, hint: '${def ? 'Y' : 'y'}/${def ? 'n' : 'N'}', parse: formsOfYes.insensitiveContains);

/// Various ridiculous letter combinations that can be accepted as "yes" in English.
const formsOfYes = {
  'yup',
  'yes',
  'sure',
  'ye',
  'yeet',
  'yet',
  'yep',
  'yop',
  'why not',
  'y not',
  'y',
  'you betcha',
  'you becha',
};
