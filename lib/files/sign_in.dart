import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_ui_component/files/reset_password_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../next_screen.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _signIn() async {
    try {
      await Amplify.Auth.signOut();
    } on PlatformException catch (e) {
      print(e.code);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$e'),
          // Change to something to show a meaningful error message
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    }

    try {
      await Amplify.Auth.signIn(
          username: usernameController.text.trim(),
          password: passwordController.text.trim());
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) {
          return NextScreen();
        },
      ));
    } on PlatformException catch (e, s) {
      if (e.code.toString().contains("NotAuthorizedException")) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$e'),
            // Change to something to show a meaningful error message
            backgroundColor: Theme.of(context).errorColor,
          ),
        );
      }
      print("Exception ${e.message}");
      print("Exception $e");
      print("StackTrace $s");
      /*    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$e'),
          // Change to something to show a meaningful error message
          backgroundColor: Theme.of(context).errorColor,
        ),
      );*/
    }
    /* on PlatformException catch (e) {
      print(e);
      setState(() {
        // _signUpError = e.code;

      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$e'),
          // Change to something to show a meaningful error message
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          // wrap your Column in Expanded
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Enter your username',
                    labelText: 'Username *',
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
                  child: const Text('Sign In'),
                ),

                InkWell(
                    child: const Text("Forgot Password?"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResetPasswordView()),
                      );
                      SnackBar(
                        content: const Text('Yay! A SnackBar!'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                    }),
                // ErrorView(_signUpError)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
