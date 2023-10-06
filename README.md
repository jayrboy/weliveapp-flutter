# weliveapp

A new Flutter project.

# create
flutter create --platforms web .

# build & deploy
flutter build web --release

# install firebase
npm install -g firebase-tools
firebase login:ci

# firebase.json
'build/web'

firebase init hosting
firebase deploy

# run chrome
flutter run -d chrome

# icon app
flutter pub run flutter_launcher_icons:main