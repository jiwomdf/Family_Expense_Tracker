# Family Expense Tracker
Family Expense Tracker is a Flutter family expense tracker app originally developed for my family’s use, which now I decided to make it open source. The app is designed to simplify tracking expense and enable effortless sharing of expenses among multiple users. It is available across **Android**, **iOS**, and **Web platforms**.


<image src="assets/record.gif" width="220" height="480"> </image>
<image src="https://github.com/jiwomdf/Family_Expense_Tracker/blob/main/github_assets/ios.png" width="220" height="480"> </image>
<image src="https://github.com/jiwomdf/Family_Expense_Tracker/blob/main/github_assets/Simulator%20Screenshot%20-%20iPhone%2013%20-%202024-09-04%20at%2023.03.51.png" width="220" height="480"> </image>

## App Stack 🏗️
The app use Firestore, Firebase Auth, Firebase Cloud Messaging, and Crashlytics. Also the app has been thoroughly tested using bloc_test to ensure reliability and performance.
- Bloc
- Firebase Auth
- Fire Store
- Crashlytic
- Cloud Messaging

## [Optional] How to change the app firebase
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
- Then run the app smoothly 🥳

it also open for contribution and discussion 🙏
<br><br>
