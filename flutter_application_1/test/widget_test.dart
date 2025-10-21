import 'package:flutter_application_1/app/got_app.dart';
import 'package:flutter_application_1/extensions/string_extension.dart';
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
    expect(result, 'G');
  });

  test('String safe index function should return correct character', () {
    // GIVEN a simple string
    const mockString = 'hello';

    // WHEN we access a character using safeIndex with a valid index
    String result = mockString.safeIndex(0);

    // THEN the correct letter is returned
    expect(result, 'h');
  });

  test('String safe index function should return empty character on invalid string', () {
    // GIVEN a simple string
    const mockString = 'hello';

    // WHEN we access a character using safeIndex with an invalid index
    String result = mockString.safeIndex(100);

    // THEN an empty string is returned
    expect(result, '');
  });

  test('String safe index function should return empty character on negative string', () {
    // GIVEN a simple string
    const mockString = 'hello';

    // WHEN we access a character using safeIndex with an invalid index
    String result = mockString.safeIndex(-1);

    // THEN an empty string is returned
    expect(result, '');
  });
}
