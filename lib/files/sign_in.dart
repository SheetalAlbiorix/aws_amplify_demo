import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_ui_component/files/reset_password_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String _signUpError = "";

  @override
  void initState() {
    super.initState();
  }

  void _signIn() async {
    // Sign out before in case a user is already signed in
    // If a user is already signed in - Amplify.Auth.signIn will throw an exception
    try {
      await Amplify.Auth.signOut();
    } on PlatformException catch (e) {
      print(e.code);
    }

    try {
      await Amplify.Auth.signIn(
          username: usernameController.text.trim(),
          password: passwordController.text.trim());
      Navigator.pop(context, true);
    } on PlatformException catch (e) {
      setState(() {
        _signUpError = e.code;
        print(e.code);
      });
    }
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
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ResetPasswordView()),
                  ),
                ),
                // ErrorView(_signUpError)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
