# Group Expense Tracker
Group Expense Tracker is a Flutter group expense tracker app originally developed for my family’s use, which now I decided to make it open source. The app is designed to simplify tracking expense and enable effortless sharing of expenses among multiple users. It is available across **Android**, **iOS**, and **Web platforms**.


<image src="assets/record.gif" width="140" height="280"> </image>
<image src="https://github.com/jiwomdf/group_expense_tracker/blob/main/github_assets/ios.png" width="140" height="280"> </image>
<image src="https://github.com/jiwomdf/group_expense_tracker/blob/main/github_assets/white_ios.png" width="140" height="280"> </image>
<image src="https://github.com/jiwomdf/group_expense_tracker/blob/main/github_assets/web.png" width="300" height="280"> </image> 


<br />

## Web link
Firebase hosting link <br />
https://group-expense-tracker.web.app/ <br /><br />

## Feature
- Insert and Update expense, category, ect data
- Insert data can be together as group
- Modify firestore scheme
- Export to Json and Spread Sheets
- Holiday Information
- Light and Dark theme <br /><br />


## App Stack 🏗️
The app use Firestore, Firebase Auth, Firebase Cloud Messaging, and Crashlytics. Also the app has been thoroughly tested using bloc_test to ensure reliability and performance.
- Bloc
- Firebase Auth
- Fire Store
- Crashlytic
- Cloud Messaging
- Dio
- Fl Chart
- Get It <br /><br />

## [Optional] How to change the app Firebase project
#### This app depends on Firebase Auth and Firestore, so you need to add your own Firebase project as stated below
- first you may change the android and iOS package by replacing all string of `com.programmergabut.group_expense` on Android and `com.programmergabut.groupExpense` on iOS
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
