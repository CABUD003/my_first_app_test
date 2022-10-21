import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_first_app_test/constants/key_constants.dart';
import 'package:my_first_app_test/main.dart' as app;

import 'screens/first_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    'end-to-end test',
    () {
      testWidgets(
        'taps on the add button, verify counter',
        (widgetTester) async {
          app.main();
          await widgetTester.pumpAndSettle();

          await widgetTester.tap(FirstScreenTest.addButton);

          await widgetTester.pumpAndSettle();

          expect(find.text('1'), findsOneWidget);
        },
      );
      testWidgets(
        'Second page and change dropdown',
        (widgetTester) async {
          app.main();
          await widgetTester.pumpAndSettle();

          final Finder nextButton = find.byKey(
            FirstPagekeys.nextPageKey,
          );

          await widgetTester.tap(nextButton);

          await widgetTester.pumpAndSettle();

          sleep(const Duration(seconds: 2));

          final Finder dropdownButton = find.byKey(SecondPageKeys.dropdownKey);

          await widgetTester.tap(dropdownButton);

          await widgetTester.pumpAndSettle();

          sleep(const Duration(seconds: 2));

          final dropdownSelection = find.text('Item 2').last;

          await widgetTester.tap(dropdownSelection);

          await widgetTester.pumpAndSettle();

          sleep(const Duration(seconds: 2));
        },
      );
    },
  );
}
