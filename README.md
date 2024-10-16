# Family Expense Tracker
Family Expense Tracker is a Flutter family expense tracker app originally developed for my family’s use, which now I decided to make it open source. The app is designed to simplify tracking expense and enable effortless sharing of expenses among multiple users. It is available across **Android**, **iOS**, and **Web platforms**.


<image src="assets/record.gif" width="140" height="280"> </image>
<image src="https://github.com/jiwomdf/Family_Expense_Tracker/blob/main/github_assets/ios.png" width="140" height="280"> </image>
<image src="https://github.com/jiwomdf/Family_Expense_Tracker/blob/main/github_assets/Simulator%20Screenshot%20-%20iPhone%2013%20-%202024-09-04%20at%2023.03.51.png" width="140" height="280"> </image>
<image src="https://firebasestorage.googleapis.com/v0/b/family-expense-tracker-da485.appspot.com/o/web_expense.png?alt=media&token=3fcb6668-a57e-43a1-a7e2-f7e06af79466" width="300" height="280"> </image> 

<br />

## Web link
Firebase hosting link <br />
https://family-expense-tracker-da485.web.app/ <br /><br />

## App Stack 🏗️
The app use Firestore, Firebase Auth, Firebase Cloud Messaging, and Crashlytics. Also the app has been thoroughly tested using bloc_test to ensure reliability and performance.
- Bloc
- Firebase Auth
- Fire Store
- Crashlytic
- Cloud Messaging

## [Optional] How to change the app Firebase project
#### This app depends on Firebase Auth and Firestore, so you need to add your own Firebase project as stated below
- first you may change the android and iOS package by replacing all string of `com.programmergabut.family_expense` on Android and `com.programmergabut.familyExpenseTracker` on iOS
- Create your own firebase project and register the Android, iOS, and Web
- put the `google-services.json` for Android, `GoogleService-Info.plist` for iOS, and `firebaseConfig` for web
- Then add your google-services.json in 
  - `android/app/google-services.json` for Android
  -  `ios/Runner/GoogleService-Info.plist` for iOS
  -  `lib/main.dart` in `FirebaseOptions class` for Web
- Enable Firebase Auth by email and password
- Enable Firestore and set the rules to `allow read, write: if request.auth != null;`
- Then to setup the new project you can use `flutterfire configure`, for more detail, you can check this link [Add firebase to your Flutter app](https://firebase.google.com/docs/flutter/setup?platform=web)
- After all the setup, then run the app smoothly 🥳

it also open for contribution and discussion 🙏
<br><br>
