import 'package:flutter_test/flutter_test.dart';
import 'package:utils/utils.dart';

void main() {
  group('isNullOrEmpty', () {
    test(
      'null string',
      () {
        final String? nullString = null;
        expect(nullString.isNullOrEmpty, true);
      },
    );
    test(
      'empty string',
      () {
        final emptyString = '';
        expect(emptyString.isNullOrEmpty, true);
      },
    );
    test(
      'not empty string',
      () {
        final notEmptyString = 'aaa';
        expect(notEmptyString.isNullOrEmpty, false);
      },
    );
  });
}
