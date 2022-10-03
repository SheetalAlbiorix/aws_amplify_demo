import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_ui_component/amplifyconfiguration.dart';
import 'package:amplify_ui_component/view/navigator/routes.dart';
import 'package:amplify_ui_component/view/utils/base_constant/base_constants.dart';
import 'package:amplify_ui_component/view/utils/helper/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // amplify plugins

  bool _isAmplifyConfigured = false;

  @override
  initState() {
    super.initState();
    _initAmplifyFlutter();
  }

  void _initAmplifyFlutter() async {
    try {
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(amplifyconfig);
      print('Successfully configured');
    } on Exception catch (e) {
      print('Error configuring Amplify: $e');
    }
    setState(() {
      _isAmplifyConfigured = true;
    });
  }

/*
  void _initAmplifyFlutter() async {
    AmplifyAuthCognito auth = AmplifyAuthCognito();
    AmplifyStorageS3 storage = AmplifyStorageS3();
    AmplifyAnalyticsPinpoint analytics = AmplifyAnalyticsPinpoint();

    Amplify.addPlugins([auth, storage, analytics]);

    // Initialize AmplifyFlutter
    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print(
          "Amplify was already configured. Looks like app restarted on android.");
    }

    setState(() {
      _isAmplifyConfigured = true;
    });
  }*/

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeService().init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: BaseStrings.appName,
      theme: ThemeService.light,
      darkTheme: ThemeService.dark,
      themeMode: ThemeService().theme,
      getPages: Pages.pages(),
      initialRoute: BaseRoute.splash,
    );
  }
}
