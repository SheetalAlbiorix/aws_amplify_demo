import 'package:amplify_ui_component/files/sign_in.dart';
import 'package:amplify_ui_component/files/sign_up.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Future<Null> _showDialogForResult(
      String text, Function onSuccess, Widget dialogWidget) async {
    bool result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(title: Text(text), children: [
            dialogWidget,
            /*  ElevatedButton(

              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),*/
          ]);
        });
    if (result) onSuccess();
  }

  // dialogWidget must return true or false
  Widget openDialogButton(
      String text, Function onSuccess, Widget dialogWidget) {
    return ElevatedButton(
        child: Text(text),
        onPressed: () {
          _showDialogForResult(text, onSuccess, dialogWidget);
        });
  }

  void onSignInSuccess() {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => MainPage()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signed In"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            openDialogButton("Sign In", onSignInSuccess, SignInView()),
            openDialogButton(
                "Sign Up", () => {print("sign up success")}, SignUpView())
          ],
        ),
      ),
    );
  }
}

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Landing Page")),
      body: const Center(
          child: Text("Please Wait.  Configuring Amplify Flutter SDK")),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> itemKeys = [];

  @override
  void initState() {
    super.initState();
    /*_loadImages();*/
  }

/*  void _loadImages() async {
    try {
      print('In list');
      S3ListOptions options =
          S3ListOptions(accessLevel: StorageAccessLevel.guest);
      ListResult result = await Amplify.Storage.list(options: options);

      var newList = itemKeys.toList();
      for (StorageItem item in result.items) {
        newList.add(item.key);
      }

      setState(() {
        itemKeys = newList;
      });
    } catch (e) {
      print('List Err: ' + e.toString());
    }
  }*/

/*  void _showImageUploader() async {
    String key = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return new SimpleDialog(
              title: Text("Upload Image"), children: [ImageUploader()]);
        });

    if (key.isNotEmpty) {
      var newList = itemKeys.toList();
      newList.add(key);

      setState(() {
        itemKeys = newList;
      });
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Text("Main Page"), UserView()])),*/
      body: Center(
        child: Container(
          // color: Colors.purple,
          child: Text("Signed In Successfully!!"),
        ),
      ),
      /*  ListView.builder(
          itemCount: itemKeys.length,
          itemBuilder: (context, index) {
            return ImageLineItem(storageKey: itemKeys[index]);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showImageUploader();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/
    );
  }
}
