# new_acnh

New ACNH app for educational purpose

## Environment

flutter --version
Flutter 2.2.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision f4abaa0735 (2 weeks ago) • 2021-07-01 12:46:11 -0700
Engine • revision 241c87ad80
Tools • Dart 2.13.4

## Architecture

- flutter_bloc as state management
- dio as http client
- shared_preferences as insensitive data storage
- flutter_secure_storage as sensitive data storage
- get_it as dependency injection

## Getting Started

git clone git@github.com:kananats/new_acnh.git
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run

## Disclaimer

Using ACNHAPI (https://acnhapi.com/) as data provider

ACNHAPI is a fan made API/Website and claims no ownership of any intellectual property associated with Nintendo or Animal Crossing. All assets found on the site and the repository are the sole property of Nintendo and are only used for non-commercial and educational purpose.

This is for educational purpose. There is no copyright infringement intended.
© Kananat Suwanviwatana