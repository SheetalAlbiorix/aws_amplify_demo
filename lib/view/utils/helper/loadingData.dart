import 'package:amplify_ui_component/viewmodel/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoadingState extends GetxController {

  var isLoading = false.obs;
  //final SignInScreenController signInScreenController = Get.put(SignInScreenController());
  startLoader() {
    if (!isLoading.value) {
      isLoading.value = true;
    //  signInScreenController.update();
     print("start 1 ${isLoading.value}");
    }
  }

  stopLoader() {
    if (isLoading.value) {
      isLoading.value = false;
    //  signInScreenController.update();
      print("start 2 ${isLoading.value}");

    }
  }
}


class ListenWidget extends StatelessWidget {
  ListenWidget({Key? key, required this.child,}) : super(key: key);
  final Widget child;
  final LoadingState loadingState = LoadingState();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      print("call widget ${loadingState.isLoading.value }");
      return Container(
        child: loadingState.isLoading.value ? Center(
          child: CircularProgressIndicator(
            color: Colors.green,
          ),
        ) : child,
      );
    });
  }


}
