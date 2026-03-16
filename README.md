Flutter Test App

This Flutter project demonstrates authentication with Firebase, state management with Riverpod, local database management with Isar, and widget/golden testing using flutter_test and golden_toolkit.

Project Setup
1. Clone the repository
git clone https://github.com/rafiamalik5/flutter-sss-stars-assessment
cd flutter_test_app
2. Install dependencies

Ensure Flutter SDK is installed (version >= 3.7 recommended):

flutter clean
flutter pub get

⚠ Important: This project uses:

firebase_core ^4.7.0

firebase_auth ^4.7.0

firebase_auth_mocks ^0.15.1 (for testing)

mockito ^5.4.4 (dev)

isar ^3.1.0 (local database)

flutter_riverpod ^2.4.0

Make sure firebase_core and firebase_auth_mocks versions are compatible (both Firebase 4.x).

Firebase Setup

Go to Firebase Console
 and create a new project.

Add an Android app with your app package name.

Download google-services.json and place it in android/app/.

Ensure your android/build.gradle.kts includes:

classpath("com.google.gms:google-services:4.4.0")

In android/app/build.gradle.kts:

apply(plugin = "com.google.gms.google-services")
Running the App

Run on an emulator or physical device:

flutter run

For release build:

flutter build apk
Testing
1. Unit Tests

Unit tests are in test/unit/.
They test AuthController and other state logic.

flutter test test/unit/auth_controller_test.dart

Firebase mocks are used for unit tests:

firebase_auth_mocks

mockito for dependency mocking

2. Widget / Golden Tests

Widget tests with flutter_riverpod require ProviderScope wrapping.

flutter test test/golden/home_screen_golden_test.dart

Golden tests compare UI snapshots (goldens/) for visual regression.

Path-dependent plugins (like path_provider) are mocked in unit tests.

Database (Isar)

The app uses Isar for local storage.

For testing, Isar is initialized in memory mode.

Troubleshooting
1. Dependency Conflicts

Make sure firebase_core and firebase_auth_mocks versions are compatible.

If you see version solving errors:

flutter pub add firebase_core:^4.7.0
flutter pub add firebase_auth_mocks:^0.15.1 --dev
2. Riverpod “No ProviderScope found”

Wrap your widget in ProviderScope for tests:

await tester.pumpWidgetBuilder(
  const ProviderScope(
    child: HomeScreen(),
  ),
);
3. MissingPluginException

Plugins like path_provider don’t work in pure Dart tests.

Either mock them or use integration tests on an emulator/device.

Project Structure
lib/
 ├─ features/
 │   ├─ auth/
 │   │   ├─ controller/auth_controller.dart
 │   │   └─ screens/login_screen.dart
 │   └─ home/
 │       └─ screens/home_screen.dart
 ├─ services/
 │   └─ isar_service.dart
test/
 ├─ unit/
 │   └─ auth_controller_test.dart
 └─ golden/
     └─ home_screen_golden_test.dart
Useful Commands
Command	Description
flutter pub get	Install dependencies
flutter run	Run app on device/emulator
flutter build apk	Build release APK
flutter test	Run all unit & widget tests
flutter clean	Clean build artifacts