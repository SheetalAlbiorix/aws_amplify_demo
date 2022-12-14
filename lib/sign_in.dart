/*
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import 'enum_screens.dart';
import 'error_view.dart';
import 'next_screen.dart';

class SignInView extends StatefulWidget {
  final Function _displayAccountWidget;

  const SignInView(this._displayAccountWidget, {super.key});

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String _signUpError = "";
  final List<String> _signUpExceptions = [];

  @override
  void initState() {
    super.initState();
  }

  void _setError(AuthError error) {
    setState(() {
      _signUpError = error.cause;
      _signUpExceptions.clear();
      error.exceptionList.forEach((el) {
        _signUpExceptions.add(el.exception);
      });
    });
  }

  void _signIn() async {
    // Sign out before in case a user is already signed in
    // If a user is already signed in - Amplify.Auth.signIn will throw an exception
    try {
      await Amplify.Auth.signOut();
    } on AuthError catch (e) {
      print(e);
    }

    try {
      SignInResult res = await Amplify.Auth.signIn(
          username: emailController.text.trim(),
          password: passwordController.text.trim());
      _go_to_NextScreen(context);
    } on AuthError catch (e) {
      setState(() {
        _signUpError = e.cause;
        _signUpExceptions.clear();
        e.exceptionList.forEach((el) {
          _signUpExceptions.add(el.exception);
        });
      });
    }
  }

  void _go_to_NextScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) {
          return NextScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            // wrap your Column in Expanded
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: 'Enter your email',
                      labelText: 'Email *',
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: 'Enter your password',
                      labelText: 'Password *',
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10.0)),
                  ElevatedButton(
                    onPressed: _signIn,
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  */
/* FlatButton(
                    textColor: Colors.black, // Theme.of(context).primaryColor,
                    color: Colors.amber,
                    onPressed: _signIn,
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),*/ /*

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: _displayCreateAccount,
                        child: Text(
                          'Create Account',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _displayResetPassword,
                        child: Text(
                          'Reset Password',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ],
                  ),
                  ErrorView(_signUpError, _signUpExceptions)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _displayCreateAccount() {
    widget._displayAccountWidget(AccountStatus.sign_up.index);
  }

  void _displayResetPassword() {
    widget._displayAccountWidget(AccountStatus.reset_password.index);
  }
}
*/
