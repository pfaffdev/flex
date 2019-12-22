/// Provides extension functions for [String]
extension ExtString on String {
  /// Returns `this` with keys swapped out for values found in [substitutions].
  ///
  /// [RegExp] group 1 in substrings matching the [RegExp] `\$([a-zA-Z0-9_]+)` is used as the key to substitute with the corresponding value in [substitutions].
  String fillTemplate(Map<String, dynamic> substitutions) => replaceAllMapped(RegExp(r'\$([a-zA-Z0-9_]+)'), (Match match) {
        final variable = match.group(1);
        return substitutions.containsKey(variable) ? '${substitutions[variable]}' : '\$$variable';
      });
}
