import 'package:flutter_application_1/app/got_app.dart';
import 'package:flutter_application_1/models/house_basic.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(GOTApp());
  });

  test('HouseBasic Initial should return correct letter', () {
    // GIVEN a house basic
    const mockHouse = HouseBasic.mockHouseBasic;

    // WHEN we access the initial property
    String result = mockHouse.initial();

    // THEN the first letter of the house name is returned
    expect(result, "G");
  });
}
