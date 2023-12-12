import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modul6/app/modules/home/views/login_view.dart';

void main() {
  testWidgets('LoginView UI elements', (WidgetTester tester) async {
    // Build our LoginView widget.
    await tester.pumpWidget(MaterialApp(home: LoginView()));

    // Verify if the Email TextField is displayed
    expect(find.widgetWithText(TextField, 'Email'), findsOneWidget);

    // Verify if the Password TextField is displayed
    expect(find.widgetWithText(TextField, 'Password'), findsOneWidget);

    // Verify if the Login Button is displayed
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
  });

  testWidgets('Login functionality', (WidgetTester tester) async {
    // Build our LoginView widget.
    await tester.pumpWidget(MaterialApp(home: LoginView()));

    // Enter text into the Email TextField
    await tester.enterText(
        find.byWidgetPredicate((widget) =>
            widget is TextField && widget.decoration?.labelText == 'Email'),
        'example@email.com');

    // Enter text into the Password TextField
    await tester.enterText(
        find.byWidgetPredicate((widget) =>
            widget is TextField && widget.decoration?.labelText == 'Password'),
        'password123');

    // Tap the Login button
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));

    // Rebuild the widget after the state has changed
    await tester.pump();

    // Add your verification logic here for login functionality
    // For example:
    // Expect some change in the UI or navigation to a different screen upon successful login
    // expect(find.text('Welcome'), findsOneWidget);
    // expect(find.byType(HomeScreen), findsOneWidget);
  });
}
