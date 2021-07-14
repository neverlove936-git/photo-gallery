import './index.dart';

ThemeData buildThemeData() {
  return ThemeData(
    accentColor: TextThemeColors.green,
    primaryColor: TextThemeColors.blue,
    scaffoldBackgroundColor: TextThemeColors.white,
    appBarTheme: AppBarTheme(
      color: TextThemeColors.white,
      textTheme: TextTheme(
        headline6: TextThemeStyles.appBarTitle,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      elevation: 0,
      brightness: Brightness.light,
    ),
    textTheme: TextTheme(
      bodyText2: TextThemeStyles.bodyText,
    ),
    buttonTheme: ButtonThemeData(
      padding: const EdgeInsets.all(15.0),
      disabledColor: TextThemeColors.bgGray,
      buttonColor: TextThemeColors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      textTheme: ButtonTextTheme.primary,
    ),
    highlightColor: TextThemeColors.blue,
  );
}
