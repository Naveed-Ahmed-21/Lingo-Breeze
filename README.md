# LingoBreeze - My Vocabulary

A complete, production-ready Flutter application with a Node.js backend to manage your vocabulary. Built with Clean Architecture, Riverpod, Firebase Firestore, and modern Material 3 design.

## Features

- **Fetch words**: Consumes a Node.js REST API to get a list of available words.
- **Save to Firebase**: Allows users to select words and save them securely to Cloud Firestore.
- **State Management**: Uses Riverpod to gracefully handle Loading, Error, Empty, and Success states.
- **Clean Architecture**: Strictly layered into Core, Data, Domain, and Presentation for maximum scalability and testability.
- **Beautiful UI**: Built using Material 3, custom theming, and responsive widgets.

---

## 📁 Project Structure

This repository contains two main components:
1. `backend/`: Node.js Express server.
2. `app/`: Flutter application.

---

## 🚀 Setup Instructions

### 1. Node.js Backend

1. Navigate to the backend directory:
   ```bash
   cd backend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Start the server:
   ```bash
   node server.js
   ```
   *The server will run on `http://localhost:3000`.*

### 2. Firebase Configuration (Required for Flutter)

Before running the Flutter application, you **must** connect it to a Firebase project, as Firestore is used for saving words.

1. Install the Firebase CLI and login:
   ```bash
   npm install -g firebase-tools
   firebase login
   ```
2. Activate the FlutterFire CLI:
   ```bash
   dart pub global activate flutterfire_cli
   ```
3. Navigate to the Flutter app directory and configure Firebase:
   ```bash
   cd app
   flutterfire configure
   ```
   *Follow the prompts to select your Firebase project and platforms. This will generate `lib/firebase_options.dart`.*
4. Open `app/lib/main.dart` and uncomment the `firebase_options.dart` import and the `DefaultFirebaseOptions.currentPlatform` line inside `Firebase.initializeApp()`.
5. Ensure that Cloud Firestore is enabled in your Firebase Console and has appropriate security rules (e.g., test mode) for development.

### 3. Flutter Application

1. Navigate to the app directory:
   ```bash
   cd app
   ```
2. Get dependencies (already done during setup, but good practice):
   ```bash
   flutter pub get
   ```
3. Run code generation (required for Freezed models):
   ```bash
   dart run build_runner build -d
   ```
4. Run the application:
   ```bash
   flutter run
   ```

*Note: For Android Emulators, the app expects the backend at `http://10.0.2.2:3000`. For iOS Simulators, it uses `http://localhost:3000`. This is configured in `lib/core/constants/api_constants.dart`.*

### 4. Running in Antigravity Sandbox (Web Mode)

To run both the backend and frontend simultaneously in this sandbox environment:

1. **Start the backend server:**
   ```bash
   cd backend && node server.js
   ```
2. **Start the Flutter Web server:**
   ```bash
   cd app && flutter run -d web-server --web-port 8080 --web-hostname 0.0.0.0
   ```
3. **Open the browser:**
   You can view the running application in your local browser at `http://localhost:8080` (or the URL provided by your Antigravity port-forwarding interface).

---

## 🏗 Architecture Highlights

- **Domain Layer**: Contains `VocabularyWord` entity, `VocabularyRepository` interface, and Use Cases (`GetAvailableWords`, `GetSavedWords`, `SaveWord`). Completely independent of external libraries.
- **Data Layer**: Contains `VocabularyWordModel` (using Freezed/JSON Serializable), `VocabularyRemoteDataSource` (Dio), `VocabularyLocalDataSource` (Firestore), and `VocabularyRepositoryImpl`.
- **Presentation Layer**: Contains Riverpod Providers for state management and UI screens/widgets.
- **Routing**: `go_router` is configured for declarative navigation.
