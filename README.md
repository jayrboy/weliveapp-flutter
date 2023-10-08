# weliveapp
The WE Live App project by Jay Jakkrit.

# create app
flutter create weliveapp --template=app --platform=web --org=com.google.firebase.presents --project-name=weliveapp
cd weliveapp
code .
flutter pub add firebase_core
flutterfire configure

# run chrome / devtools
flutter run -d chrome

# test chrome
flutter test --platform chrome

# icon update
flutter pub run flutter_launcher_icons:main

# create directory ./web (my web app)
flutter create --platforms web .

# build directory ./build/web 
flutter build web --release

# install firebase & login
npm install -g firebase-tools
firebase login:ci
firebase login

# edit ./firebase.json
"public": "build/web",

# initial firebase and deploy
firebase init hosting
firebase deploy