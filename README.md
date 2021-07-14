# flutter GetX boilerplate

A new Flutter project.

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