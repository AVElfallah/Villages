// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:villages/shared/data/api/school_external.dart';

void main() {
  test('returns zero if both inputs are zero', () async {
    var res = await SchoolExternal.i.getSchools();
    expect(res.length, 5);
  });
}
