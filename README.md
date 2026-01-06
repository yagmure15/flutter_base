# Flutter Base Project

## Environment Setup
This project uses `envied` for environment variables and `flutter_flavorizr` for flavors.

### Setup
1. Copy `.env` to `.env.dev`, `.env.staging`, `.env.prod`.
2. Populate the secrets in each file.
3. Run `dart run build_runner build` to generate the environment code.

## Build Flavors
- **Dev**: `com.example.flutter_base.dev`
- **Staging**: `com.example.flutter_base.staging`
- **Prod**: `com.example.flutter_base`

## Running the App
- Dev: `flutter run --flavor dev -t lib/main_dev.dart`
- Staging: `flutter run --flavor staging -t lib/main_staging.dart`
- Prod: `flutter run --flavor prod -t lib/main_prod.dart`

## CI/CD Considerations
- **Secrets**: In your CI provider (GitHub Actions, Bitrise, etc.), create secrets for the contents of `.env.dev`, `.env.staging`, `.env.prod`.
- **Build Step**:
    - Write the secrets to the respective files (e.g., `echo "$ENV_DEV" > .env.dev`).
    - Run `flutter pub get`.
    - Run `dart run build_runner build --delete-conflicting-outputs`.
    - Build the specific flavor:
        - Android: `flutter build apk --flavor dev -t lib/main_dev.dart`
        - iOS: `flutter build ios --flavor dev -t lib/main_dev.dart --no-codesign` (handle signing separately)
