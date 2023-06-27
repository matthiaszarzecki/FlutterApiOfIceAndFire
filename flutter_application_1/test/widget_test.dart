import 'package:flutter_application_1/app/got_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(GOTApp());
  });
}
