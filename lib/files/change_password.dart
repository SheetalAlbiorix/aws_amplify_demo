import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  _ChangePasswordViewState createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();

  String _signUpError = "";
  List<String> _signUpExceptions = [];

  @override
  void initState() {
    super.initState();
  }

/*
  void _setError(PlatformException error) {
    setState(() {
      _signUpError = error.code;
      _signUpExceptions.clear();
      */ /*error.exceptionList.forEach((el) {
        _signUpExceptions.add(el.exception);
      });*/ /*
    });
  }*/

  void _ChangePassword(BuildContext context) async {
    try {
      await Amplify.Auth.updatePassword(
        // username: emailController.text.trim(),
        newPassword: newPasswordController.text.trim(),
        oldPassword: oldPasswordController.text.trim(),
      );
      Navigator.pop(context, true);
    } on PlatformException catch (e) {
      print(e);
      /*  setState(() {
        _signUpError = e.code;
        // _signUpExceptions.clear();
         e.exceptionList.forEach((el) {
          _signUpExceptions.add(el.exception);
        });
      });*/
    }
  }

/*  Future<void> _ChangePassword() async {
    try {
      await Amplify.Auth.updatePassword(
        newPassword: newPasswordController.text.trim(),
        oldPassword: oldPasswordController.text.trim(),
      );
    } on AmplifyException catch (e) {
      print(e);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Visibility(
                    child: Column(children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.password),
                          hintText: 'Old Password',
                          labelText: 'Old Password',
                        ),
                        controller: oldPasswordController,
                        // keyboardType: TextInputType.emailAddress,
                      ),
                      const Padding(padding: EdgeInsets.all(10.0)),
                      TextFormField(
                        enableSuggestions: false,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.password),
                          hintText: 'New Password',
                          labelText: 'New Password',
                        ),
                        controller: newPasswordController,
                        // keyboardType: TextInputType.emailAddress,
                      ),
                      const Padding(padding: EdgeInsets.all(10.0)),
                      InkWell(
                        /*  textColor:
                        Colors.black, // Theme.of(context).primaryColor,
                        color: Colors.amber,*/
                        onTap: () => _ChangePassword(context),
                        child: const Text(
                          'Change Password',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      /*   InkWell(

                        onTap: _displayCreateAccount,
                        child: Text(
                          'Create Account',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),*/
                    ]),
                  ),
                  /* Visibility(
                      // visible: _isPasswordReset,
                      child: Column(children: [
                        ConfirmResetPassword(
                            emailController.text.trim(),),
                      ])),*/
                  // ErrorView(_signUpError, _signUpExceptions)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

/*  void _displayCreateAccount() {
    widget._displayAccountWidget(AccountStatus.sign_up.index);
  }*/
}
