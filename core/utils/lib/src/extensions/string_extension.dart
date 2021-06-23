/// Extension methods on nullable String
extension StringExtension on String? {
  /// Whether the string is null or empty
  bool get isNullOrEmpty => this?.isEmpty ?? true;
}
