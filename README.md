# VOICEFORHER
## Overview
This application is designed to address harassment issues faced by university students, particularly girl students. It serves as a digital platform to empower victims by providing a safe, user-friendly, and anonymous way to report harassment incidents, access resources for support, and connect with authorities or peer support groups.
The app leverages **Flutter** for the frontend and **Firebase** for the backend, offering real-time updates, secure data handling, and seamless user interaction.
---
## Key Features
1. **Incident Reporting**:
    - Users can report incidents by selecting harassment types (e.g., verbal abuse, sexual harassment, bullying).
    - Reports capture essential details such as time, location, type, and individuals involved.
    - Optional anonymous reporting to protect victims' identity.

2. **Resource Access**:
    - Emotional and physical support resources.
    - Contact details for grievance cells, university authorities, and peer support groups.

3. **User-Friendly Interface**:
    - Simple and intuitive design to ensure ease of use.
    - Minimal input required to report incidents.

4. **Real-Time Updates**:
    - Notifications for status updates on reported incidents.
    - Resource suggestions tailored to the incident type.

5. **Data Privacy and Security**:
    - Secure authentication via Firebase Authentication.
    - Reports stored in Firestore with restricted access based on user roles (e.g., victim, admin, authority).

---

## Tech Stack
### Frontend:
- **Flutter**
    - Dart language
    - Material Design for UI components

### Backend:
- **Firebase**
    - Firebase Authentication (Email/Password and Anonymous login)
    - Firestore (Incident reports and user data storage)
    - Firebase Cloud Functions (Automating notifications and escalations)
    - Firebase Cloud Messaging (Real-time notifications)
    - Firebase Hosting (Optional for web deployment)

### Additional Services:
- Google Maps API (for location tracking)
- Push Notifications (Firebase Cloud Messaging)

---

## Installation
### Prerequisites:
1. Install Flutter SDK: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)
2. Set up Firebase:
    - Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/).
    - Enable Firebase Authentication, Firestore, and Cloud Functions.
    - Download and add the `google-services.json` file to your `android/app` directory.

### Steps:
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repository-url/harassment-reporting-app.git
   cd harassment-reporting-app
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

---

## Firebase Setup
1. **Authentication**:
    - Enable Email/Password and Anonymous sign-in.
2. **Firestore Database**:
    - Create a Firestore database in "production mode".
    - Use the following structure:
      ```
      collections: {
        reports: {
          reportId: {
            type: "verbal abuse",
            location: "Library",
            time: "2024-12-13 10:00 AM",
            details: "Optional description",
            isAnonymous: true,
            reportedBy: "userId",
            status: "Pending",
          }
        },
        users: {
          userId: {
            name: "John Doe",
            email: "johndoe@example.com",
            role: "student" | "admin",
          }
        }
      }
      ```
3. **Cloud Functions**:
    - Write functions to send notifications or escalate reports to authorities.
---
## Usage
1. **Login/Register**:
    - Users can sign in using email/password or report incidents anonymously.
2. **Report an Incident**:
    - Navigate to the "Report Incident" section.
    - Fill in the required fields (type, location, time) and submit.
3. **Access Resources**:
    - View support resources in the "Help & Support" section.
4. **Manage Reports (Admin)**:
    - Admin users can view, update, or resolve reports via the admin dashboard.
---
## Key Screens
1. **Login Screen**
2. **Home Screen**
3. **Report Incident Screen**
4. **Help & Support Screen**
5. **Admin Dashboard**
---
## Security Rules (Firestore Example)
```json
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    match /reports/{reportId} {
      allow create: if request.auth != null;
      allow read, update: if request.auth != null && resource.data.reportedBy == request.auth.uid;
      allow delete: if request.auth.token.admin == true;
    }
  }
}
```

---

## Future Enhancements
1. Voice-command activation for SOS.
2. AI-based analysis of report trends.
3. Integration with university grievance portals.
4. Multi-language support.

---

## License
This project is licensed under the MIT License. See the LICENSE file for details.

---

## Contributors
- **Team Name**: Team Igniter
- **Developers**: [List of Contributors]
  1.Rupak Choppala
  2.Pavan Kalisetti
  3.Sai Satish Nilla
  4.Arun Kmar Bidila