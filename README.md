# Photo Gallery

A new Flutter project use Google Photo Api to create Gallery Photo.

# Summary
- Config firebase and Set up the Google Photos Library API
- Using Google Photo Apis to implement features Create Album, Get List Album, Album detail, Upload image To Album, View Image Detail 
- Use google_sign_in to sign in, sign out for get oath2 token.
- Use getX
- Not testing on IOS device yet.

# Demo video
https://drive.google.com/file/d/114bMfUm2Rx1kFN-Lmfi9sR6i0Ez6SGew/view

# Apk file for Android
https://drive.google.com/file/d/1nMYDMcLSpdytAH50FlGf_nQFLkj4x796/view?usp=sharing
# Screenshot
- Home
![Home](/assets/images/documents/home.png?raw=true "Home")
![Home after sign in](/assets/images/documents/home_after_sign_in.png?raw=true "Home after sign in")
- Sign in
![Sign in](/assets/images/documents/sign_in.png?raw=true "Sign in")
- Album detail
![Album detail](/assets/images/documents/album_detail.png?raw=true "Album detail")
- Upload
![Pick Image](/assets/images/documents/pick_image.png?raw=true "Pick Image")
![Upload image to album](/assets/images/documents/upload_image_to_album.png?raw=true "Upload image to album")
![Album after upload](/assets/images/documents/album_after_upload.png?raw=true "Album after upload")
# For future improvement
- Handle error exception (Display error).
- Refresh the oath2 token. Now the token has 30minut expire time => Solution store refresh time into local storage and compre if it expire and refresh token.
- Handle multiple upload file
- Improve gallery view
- Implement feature share album, media item, dowload image, remove album, media item

## Evironment
| Tool name | version |
----|----
| Android Studio | 4.1 |
| Xcode | 11.5 |

| Programming language | version
----|----
| Dart | 2.12.3 |

| Framework | version |
----|----
| Flutter | 2.0.5 (stable) |
| Cocoa Pod | 1.10.0 |
----|----
| VS Code | 1.58.0

#### Build Android:
- At project root folder, run below command:
```
- Build development: flutter build apk --release --flavor development -t lib/main_development.dart
- Build staging: flutter build apk --release --flavor staging -t lib/main_staging.dart
- Build production: flutter build apk --release --flavor production -t lib/main_production.dart
```
- The .apk file will be save at `Built build/app/outputs/flutter-apk/*.apk`

## Config debug for VSCode
- Coppy `launch.json` file content on project root folder to `.vscode/launch.json` file.
- Select Environment
![Choose environment](/assets/images/documents/choose_environment.png?raw=true "Choose environment")
- Run Debug
![Run debug](/assets/images/documents/run_debug.png?raw=true "Run debug")


## Folder Structure
```
lib/
|- models/ ---> place object models
|- views/ ---> define all pages/screens or widget of application
  |- home/ ---> place app home module included home ui and logic. We should organize as app module (eg: home, about, ...) rather then platform module (eg: activity, dialog, ...)
    |- home.dart --> define home ui
      |- widget/ --> place app reuseable widget(custom dialog, app header etc ...)
|- services/ ---> place app services (database service, network service)
  |- cache/ ---> place local data services
    |- shared_preferences_service.dart
  |- api/ ---> place all api define
  |- dio.dart ---> place dio service to handle api
|- storage_preferences.dart ---> define storage with shared preferences service
|- utils/ ---> place app utils
  |- constants ---> place all app constants
  |- function ---> place app function
  |- language ---> place language file for AppTranslations locale
    |- ja
      |- index.dart
|- routes ---> define app routes. Use GetPages
  |- pages.dart ---> place List<GetPage> to use GetX routes
  |- routes.dart ---> place String routes name
|- controllers ---> place GetX controller
|- main.dart ---> each main.dart file point to each env of app. Ex: default main.dart for dev env, create new main_prod.dart for prod env
|- flavor.dart ---> place Env variable follow flavor,
|- test/ ---> place app unit, widget tests
|- assets/ ---> place app assets
|- .github/ ---> place github template and github action workflow
```
