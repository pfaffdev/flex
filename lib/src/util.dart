import 'dart:io';

import 'package:intl/intl.dart';

/// A DateFormat implementing ISO 8601 without timezone
final iso8601NoTZ = DateFormat('yyyy-MM-ddTHH-mm-ss.SSS');

/// The user's home directory
/// 
/// Only support on Linux, macOS, Windows and Android.
Directory get userHome => Directory(Platform.isLinux || Platform.isMacOS ? Platform.environment['HOME'] : Platform.isWindows ? Platform.environment['USERPROFILE'] : Platform.isAndroid ? '/sdcard' : throw UnsupportedError('userHome is not supported on ${Platform.operatingSystem}.'));

/// A [RegExp] pattern for all horizontal whitespace characters,
final whitespacePattern = RegExp(r'\p{Blank}');

/// Used to indicate that a field or parameter this annotates is able to store a null value (prior to NNBD)
class Nullable {
  const Nullable._();
}

/// Used to indicate that a field or parameter this annotates is able to store a null value (prior to NNBD)
const Nullable nullable = Nullable._();
