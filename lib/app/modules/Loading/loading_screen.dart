import 'package:amplify_ui_component/app/theme/app_colors.dart';
import 'package:amplify_ui_component/app/utils/base_constant/base_constants.dart';
import 'package:amplify_ui_component/app/utils/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child:Center(

          child:  TextView(
            BaseStrings.loadAmplify,
            color: nuetral,
            fontSize: 20,
            fontFamily: 'Spartan',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
