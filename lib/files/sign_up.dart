import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  // final usernameController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmationCodeController = TextEditingController();

  String _signUpError = "";
  bool _isSignedUp = false;

  @override
  void initState() {
    super.initState();
  }

  void _signUp() async {
    setState(() {
      _signUpError = "";
    });

    Map<CognitoUserAttributeKey, String> userAttributes = {
      CognitoUserAttributeKey.email: emailController.text,
      CognitoUserAttributeKey.name:
          "${firstnameController.text} ${lastnameController.text}",
    };
    try {
      await Amplify.Auth.signUp(
          username: emailController.text.trim(),
          password: passwordController.text.trim(),
          options: CognitoSignUpOptions(userAttributes: userAttributes));

      setState(() {
        _isSignedUp = true;
      });
    } on PlatformException catch (error) {
      _setError(error);
      print(error);
    }
  }

  void _confirmSignUp() async {
    setState(() {
      _signUpError = "";
    });

    try {
      await Amplify.Auth.confirmSignUp(
          username: emailController.text.trim(),
          confirmationCode: confirmationCodeController.text.trim());
      Navigator.pop(context, true);
    } on PlatformException catch (error) {
      _setError(error);
      print(error.code);
    }
  }

  void _setError(PlatformException error) {
    setState(() {
      _signUpError = error.code;
      print(error.code);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          // wrap your Column in Expanded
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Visibility(
                  visible: !_isSignedUp,
                  child: Column(children: [
                    TextFormField(
                      controller: firstnameController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'First Name',
                        labelText: 'First Name *',
                      ),
                    ),
                    TextFormField(
                      controller: lastnameController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Last Name',
                        labelText: 'Last Name *',
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        hintText: 'Password',
                        labelText: 'Password *',
                      ),
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'Email',
                        labelText: 'Email *',
                      ),
                    ),
                    /*   TextFormField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.phone),
                        hintText: 'Phone number (WITH AREA CODE)',
                        labelText: 'Phone number *',
                      ),
                    ),*/
                    ElevatedButton(
                      onPressed: _signUp,
                      child: const Text('Sign Up'),
                    ),
                  ]),
                ),
                Visibility(
                    visible: _isSignedUp,
                    child: Column(children: [
                      TextFormField(
                          controller: confirmationCodeController,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.confirmation_number),
                            hintText: 'The code we sent you',
                            labelText: 'Confirmation Code *',
                          )),
                      ElevatedButton(
                        onPressed: _confirmSignUp,
                        child: const Text('Confirm Sign Up'),
                      ),
                    ])),
                const Padding(padding: EdgeInsets.all(10.0)),
                // ErrorView(_signUpError)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
