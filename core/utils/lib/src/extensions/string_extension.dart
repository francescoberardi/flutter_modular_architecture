extension StringExtension on String? {
  bool get isNullOrEmpty => this?.isEmpty ?? true;
}
