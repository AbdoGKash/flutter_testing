// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_testing/widgets/user_registration_form.dart';

// void main() {
//   group('Validation Logic Tests', () {
//     test('Valid email returns true', () {
//       expect(Validators.isValidEmail('test@example.com'), isTrue);
//     });

//     test('Invalid email returns false', () {
//       expect(Validators.isValidEmail('invalid_email'), isFalse);
//       expect(Validators.isValidEmail('abc@com'), isFalse);
//     });

//     test('Valid password returns true', () {
//       expect(Validators.isValidPassword('StrongP@ss1'), isTrue);
//     });

//     test('Weak password returns false', () {
//       expect(Validators.isValidPassword('12345'), isFalse);
//       expect(Validators.isValidPassword('password'), isFalse);
//     });
//   });
// }
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/widgets/user_registration_form.dart';

void main() {
  group('UserRegistrationForm Widget Tests', () {
    testWidgets('Form builds correctly with all fields', (
      WidgetTester tester,
    ) async {
      // Build the widget
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: UserRegistrationForm())),
      );

      // Verify that all form fields are present
      expect(find.byKey(const Key('nameField')), findsOneWidget);
      expect(find.byKey(const Key('emailField')), findsOneWidget);
      expect(find.byKey(const Key('passwordField')), findsOneWidget);
      expect(find.byKey(const Key('confirmPasswordField')), findsOneWidget);
      expect(find.byKey(const Key('registerButton')), findsOneWidget);

      // Verify initial button text is 'Register'
      expect(find.text('Register'), findsOneWidget);
    });

    testWidgets('Shows validation error for empty name field on submit', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: UserRegistrationForm())),
      );

      // Tap the register button
      await tester.tap(find.byKey(const Key('registerButton')));
      await tester.pump();

      // Verify error message for name field
      expect(find.text('Please enter your full name'), findsOneWidget);
    });

    testWidgets('Shows validation error for short name (less than 2 chars)', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: UserRegistrationForm())),
      );

      // Enter short name
      await tester.enterText(find.byKey(const Key('nameField')), 'A');
      await tester.pump();

      // Tap submit
      await tester.tap(find.byKey(const Key('registerButton')));
      await tester.pump();

      // Verify error
      expect(find.text('Name must be at least 2 characters'), findsOneWidget);
    });

    testWidgets('Shows validation error for empty email field on submit', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: UserRegistrationForm())),
      );

      // Tap submit without filling email
      await tester.tap(find.byKey(const Key('registerButton')));
      await tester.pump();

      // Verify error for email
      expect(find.text('Please enter your email'), findsOneWidget);
    });

    testWidgets('Shows validation error for invalid email on submit', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: UserRegistrationForm())),
      );

      // Enter invalid email
      await tester.enterText(
        find.byKey(const Key('emailField')),
        'invalid-email',
      );
      await tester.pump();

      // Fill other fields minimally to pass their validations
      await tester.enterText(find.byKey(const Key('nameField')), 'Test User');
      await tester.enterText(
        find.byKey(const Key('passwordField')),
        'Pass123!',
      );
      await tester.enterText(
        find.byKey(const Key('confirmPasswordField')),
        'Pass123!',
      );

      // Tap submit
      await tester.tap(find.byKey(const Key('registerButton')));
      await tester.pump();

      // Verify email error
      expect(find.text('Please enter a valid email'), findsOneWidget);
    });

    testWidgets('Shows validation error for empty password on submit', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: UserRegistrationForm())),
      );

      // Tap submit without password
      await tester.tap(find.byKey(const Key('registerButton')));
      await tester.pump();

      // Verify password error
      expect(find.text('Please enter a password'), findsOneWidget);
    });

    testWidgets('Shows validation error for weak password on submit', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: UserRegistrationForm())),
      );

      // Enter weak password (less than 8 chars, no uppercase, no number, no symbol)
      await tester.enterText(find.byKey(const Key('passwordField')), 'weak');
      await tester.pump();

      // Fill other fields
      await tester.enterText(find.byKey(const Key('nameField')), 'Test User');
      await tester.enterText(
        find.byKey(const Key('emailField')),
        'test@example.com',
      );
      await tester.enterText(
        find.byKey(const Key('confirmPasswordField')),
        'weak',
      );

      // Tap submit
      await tester.tap(find.byKey(const Key('registerButton')));
      await tester.pump();

      // Verify password error
      expect(find.text('Password is too weak'), findsOneWidget);
    });

    testWidgets('Shows validation error for password mismatch on submit', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: UserRegistrationForm())),
      );

      // Enter matching password and confirm
      await tester.enterText(find.byKey(const Key('nameField')), 'Test User');
      await tester.enterText(
        find.byKey(const Key('emailField')),
        'test@example.com',
      );
      await tester.enterText(
        find.byKey(const Key('passwordField')),
        'Pass123!',
      );
      await tester.enterText(
        find.byKey(const Key('confirmPasswordField')),
        'DifferentPass!',
      );

      // Tap submit
      await tester.tap(find.byKey(const Key('registerButton')));
      await tester.pump();

      // Verify confirm password error
      expect(find.text('Passwords do not match'), findsOneWidget);
    });

    testWidgets(
      'Submits form successfully with valid data and shows loading then success message',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: UserRegistrationForm())),
        );

        // Enter valid data
        await tester.enterText(find.byKey(const Key('nameField')), 'Test User');
        await tester.enterText(
          find.byKey(const Key('emailField')),
          'test@example.com',
        );
        await tester.enterText(
          find.byKey(const Key('passwordField')),
          'Pass123!',
        );
        await tester.enterText(
          find.byKey(const Key('confirmPasswordField')),
          'Pass123!',
        );
        await tester.pump();

        // Tap submit - should start loading
        await tester.tap(find.byKey(const Key('registerButton')));
        await tester.pump();

        // Verify loading indicator appears and button is disabled
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.text('Register'), findsNothing); // Button text hidden

        // Wait for the simulated API call (2 seconds)
        await tester.pump(const Duration(seconds: 2));

        // Verify success message appears with green color
        expect(find.byKey(const Key('messageText')), findsOneWidget);
        expect(find.text('Registration successful!'), findsOneWidget);

        // Optional: Verify text color is green (by checking the widget tree)
        final messageFinder = find.byKey(const Key('messageText'));
        final textFinder = find.descendant(
          of: messageFinder,
          matching: find.byType(Text),
        );
        final messageWidget = tester.widget<Text>(textFinder);
        expect(messageWidget.style?.color, Colors.green);
      },
    );
  });
}
