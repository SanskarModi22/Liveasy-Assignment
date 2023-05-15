# Phone Number Authentication using Flutter and Firebase

This project implements user authentication using a phone number in Flutter framework with Firebase backend. The user enters a 10-digit phone number, receives an OTP (One-Time Password), and the verification process is automatically handled.

## Features

- User enters a 10-digit phone number.
- OTP (One-Time Password) is sent to the provided phone number via SMS.
- The app automatically verifies the OTP without user intervention.
- Firebase Authentication is used to handle user authentication.
- User information is stored securely in Firebase.

## Installation

1. Clone the repository to your local machine:

   ```dart
   git clone https://github.com/your-username/phone_number_authentication.git
   ```

2. Make sure you have Flutter installed. If not, follow the official [Flutter installation guide](https://flutter.dev/docs/get-started/install).

3. Set up a Firebase project and enable phone number authentication. Refer to the official [Firebase documentation](https://firebase.google.com/docs/flutter/setup) for detailed instructions.

4. Configure the Firebase project in the Flutter app:
   - Open the project in your preferred code editor.
   - Replace the `google-services.json` file in the `android/app` directory with your Firebase project's configuration file.
   - In the `lib` directory, locate the `firebase_config.dart` file and update the necessary Firebase configuration values.

5. Install the dependencies by running the following command in the project's root directory:

   ```dart
   flutter pub get
   ```

6. Run the app on a simulator or physical device:

   ```dart
   flutter run
   ```

   Make sure you have a simulator or device connected and configured for development.

## Project Structure

- **lib**: Contains the main source code of the Flutter app.
  - **models**: Defines the data models used in the app.
  - **views**: Contains the implementation of different app screens.
  - **services**: Contains Firebase and authentication service classes.
  - **utils**: Contains utility/helper classes used throughout the app.

## Dependencies

The project utilizes the following dependencies:

- `firebase_core`: Flutter plugin to integrate Firebase Core functionality.
- `firebase_auth`: Flutter plugin for Firebase Authentication.
- `otp_text_field`: Flutter package for OTP (One-Time Password) input fields.

Make sure to check the `pubspec.yaml` file in the project for the complete list of dependencies along with their versions.

## Contributions

Contributions to the project are welcome. If you encounter any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.