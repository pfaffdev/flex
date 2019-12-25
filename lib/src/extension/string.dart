/// Provides extension functions for [String]
extension ExtString on String {
  /// Returns this [String] with keys swapped out for values found in [substitutions].
  ///
  /// For each [RegExpMatch] from the [RegExp] `(.)\$([a-zA-Z0-9_]+)`, group 2 is used to retrieve the substitution key. If group 1 is equal to `\`, the match is skipped.
  String fillTemplate(Map<String, dynamic> substitutions) => replaceAllMapped(RegExp(r'(.)\$([a-zA-Z0-9_]+)', dotAll: true), (Match match) {
        final variable = match.group(2);
        return match.group(1) != r'\' ? match.group(1) + (substitutions.containsKey(variable) ? '${substitutions[variable]}' : '\$$variable') : '\$$variable';
      }).replaceAll(RegExp(r'\\\$'), r'$');
}
