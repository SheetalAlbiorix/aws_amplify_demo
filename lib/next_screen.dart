import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_ui_component/view/ui/screens.dart';
import 'package:amplify_ui_component/view/utils/helper/helpers.dart';
import 'package:flutter/material.dart';

class NextScreen extends StatefulWidget {
  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  void initState() {
    // TODO: implement initState
    fetchAuthSession();
    super.initState();
  }

  fetchAuthSession() async {
    try {
      CognitoAuthSession res = await Amplify.Auth.fetchAuthSession(
              options: CognitoSessionOptions(getAWSCredentials: true))
          as CognitoAuthSession;
      /*   if(res.isSignedIn){
        return

      }*/

      print(
          'Session Sign In Status = ${res.userPoolTokens!.accessToken.toString()}');
    } on AmplifyException catch (e) {
      print(e);
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Successful Screen'),
      ),
      body: Container(
        color: const Color(0xffE1E5E4),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    'Done',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: ElevatedButton(
                    // color: Colors.lightBlue,
                    onPressed: () => signOut(context),
                    child: const Text(
                      'Sign Out',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signOut(BuildContext context) {
    clearData();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) {
          return SignInScreen();
        },
      ),
    );
  }
}
