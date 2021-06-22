extension StringExtension on String? {
  ///
  /// Extension method for checking empty
  ///
  bool get isNullOrEmpty => this?.isEmpty ?? true;
}
