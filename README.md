# E-Commerce App

## Overview

This is a Flutter-based e-commerce app with a light orange theme and a white background. The app includes authentication features, product catalog, shopping cart management, and checkout functionality.

## Features

- User authentication (Sign Up / Login)
- Product catalog with search and filtering
- Shopping cart management
- Checkout process
- Responsive UI design

## Prerequisites

Before running the app, ensure you have the following installed:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- [Firebase CLI](https://firebase.google.com/docs/cli)

## Setup

1. **Clone the Repository**

   ```bash
   git clone https://github.com/nikhilsharma1998/ecommerce_app.git



2. **Navigate to the Project Directory**

    cd ecommerce_app



3. **Install Dependencies**

    flutter pub get



4. **Set Up Firebase**

    1. Go to the Firebase Console and create a new project.
    2. Follow the instructions to add an Android and/or iOS app to the project.
    3. Download the google-services.json file for Android and/or the GoogleService-Info.plist file for iOS.
    4. Place google-services.json in the android/app directory.
    5. Place GoogleService-Info.plist in the ios/Runner directory.
    6. Make sure to update the Firebase configuration in firebase_options.dart according to the instructions provided by Firebase.



5. **Run the App**

    flutter run



6. **Building for Release**

    To build the app for release:

    Android:
    ```bash
        flutter build apk --release

    iOS:
    ```bash
     flutter build ios --release



 ##  Code Structure

    - lib/: Contains the Dart code for the app.
    - main.dart: Entry point of the app.
    - providers/: Contains provider classes for state management.
    - services/: Contains service classes for API interactions.
    - models/: Contains data model classes.
    - screens/: Contains the different screens of the app.
    - widgets/: Contains reusable widgets.
    - firebase_options.dart: Contains Firebase configuration options.



 ##  Contributing
    
    If you would like to contribute to this project, please fork the repository and submit a pull request with your changes.



 ##  Contact

 1. Email - nikzsharma1998@gmail.com
 2. Github - https://github.com/nikhilsharma1998





