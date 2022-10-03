part of helpers;

ColorScheme? themeConfig;

class ThemeService with ChangeNotifier {
  // final _key = 'isDarkMode';
  static bool? darkMode;
  static bool systemDefault = false;

  static final light = ThemeData.light().copyWith(useMaterial3: true);
  static final dark = ThemeData.dark().copyWith(useMaterial3: true);

  ThemeMode get theme {
    ThemeMode themeMode = ThemeMode.system;
/*    if (systemDefault) {
      return themeMode;
    }*/
    if (darkMode == null) {
      darkMode = Get.isDarkMode;
      return themeMode;
    } else {
      themeMode = darkMode! ? ThemeMode.dark : ThemeMode.light;
      return themeMode;
    }
  }

/*
  void setSystemDefault() {
    systemDefault = !systemDefault;
    notifyListeners();
  }*/

  void switchTheme() {
    darkMode = !darkMode!;
    Get.changeThemeMode(darkMode! ? ThemeMode.dark : ThemeMode.light);
    themeConfig = Get.context!.theme.colorScheme;
    notifyListeners();
  }

  void init(BuildContext context) {
    themeConfig = context.theme.colorScheme;
  }

  Color whiteColor = const Color(0xFFFFFFFF);
  Color blackColor = const Color(0xFF000000);
  Color blueColor = const Color(0xff235BA8);
  Color orangeColor = const Color(0xffF06000);
  Color redColor = const Color(0xffbb2323);
  Color greenColor = const Color(0xff23bb2b);
}

extension ThemeServiceX on ColorScheme {
  Color get whiteBlackColor => ThemeService.darkMode!
      ? ThemeService().whiteColor
      : ThemeService().blackColor;

  Color get blackWhiteColor => ThemeService.darkMode!
      ? ThemeService().blackColor
      : ThemeService().whiteColor;

  Color get blueColor =>
      ThemeService.darkMode! ? Colors.tealAccent[200]! : Colors.blue;

  Color get greenColor => ThemeService.darkMode!
      ? ThemeService().greenColor
      : ThemeService().greenColor;
}
