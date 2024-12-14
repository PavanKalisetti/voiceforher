# SafeHervenApp - Addressing Harassment Faced by Girl Students

## Project Overview
SafeHervenApp is a mobile application designed to address harassment faced by girl students in universities. The app enables users to document and report harassment incidents, connect with peer support, and notify university authorities. It also offers an option to submit complaints anonymously for better privacy and security.

This project is aimed at providing a safer and more supportive environment for students by utilizing technology to handle harassment incidents in a structured and organized manner.

## Tech Stack
- **Frontend**: Flutter
- **State Management**: Provider
- **Backend**: Firebase (Firestore, Authentication)
- **Authentication**: Firebase Authentication
- **Database**: Firebase Firestore
- **Styling**: Google Fonts
- **Notifications**: Firebase Cloud Messaging (FCM) [if applicable]
- **Hosting/Deployment**: Firebase Hosting (for the web version) [if applicable]

## Key Features
- **Harassment Reporting**: Users can report harassment incidents by filling out a form with necessary details.
- **Incident Tracking**: Track the status of the filed complaints.
- **Support & Guidance**: Access resources for peer support and university authority contacts.
- **Anonymous Reporting**: Anonymity is guaranteed for users who wish to file complaints discreetly.
- **Real-Time Notifications**: Get real-time updates about the complaint status.

## Setup & Installation Instructions

### 1. Clone the repository
First, clone the repository to your local machine using Git:

### bash
``` git clone https://github.com/pavankalisetti/voiceforher.git ```

### 2. Install Flutter
If you don't have Flutter installed, follow the official installation guide here: Flutter Installation

### 3. Install Dependencies
Navigate to the project directory and run the following command to install the required dependencies:
``` flutter pub get
```

This will install all the dependencies listed in the ```pubspec.yaml``` file.

### 4. Set up Firebase
   Create a Firebase project in the Firebase Console.
   Add Firebase to your Flutter project by following the setup instructions in the Firebase documentation:
   For iOS
   For Android
   Add the google-services.json (Android) and GoogleService-Info.plist (iOS) to your project as instructed in the setup guide.
   Configure Firestore, Authentication, and other necessary Firebase services in the Firebase Console.
   Ensure Firebase Cloud Messaging is set up if you plan to send notifications.
### 5. Running the App
   Run the app on your Android/iOS device or emulator:

### bash
```flutter run```
### 7. Building APK (for Android)
   To build the APK for Android, run:
   ```flutter build apk```
   You can then upload the APK file as required for the hackathon submission.

