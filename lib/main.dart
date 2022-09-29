import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_ui_component/amplifyconfiguration.dart';
import 'package:flutter/material.dart';

import 'files/landing_page.dart';

void main() {
  runApp(MyApp());
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

  Widget _display() {
    if (_isAmplifyConfigured) {
      return LandingPage();
    } else {
      return LoadingPage();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Amplify App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: _display());
  }
}
