import 'package:amplify_ui_component/view/ui/FacebookHome/FbHomeScreen.dart';
import 'package:amplify_ui_component/view/utils/helper/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main.dart';
import 'view/ui/InstaHome/insta_home.dart';
import 'view/utils/base_constant/base_constants.dart';
import 'view/utils/widgets/widgets.dart';

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(
     //   automaticallyImplyLeading: true,
     //   leading: Icon(Icons.arrow_back,color: BaseColors.black,),
     //
     // ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(BaseAssets.signInBackground),
            fit: BoxFit.cover,
          ),
        ),
     //   color: const Color(0xffE1E5E4),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 170),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    BaseAssets.logo,
                    width: 117.w,
                    height: 90.h,
                  ),
                ),
                50.toVSB,

                // const Padding(
                //   padding: EdgeInsets.all(20.0),
                //   child: Center(
                //     child: Text(
                //       'Successful',
                //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                //     ),
                //
                //   ),
                // ),
                // 5.toVSB,
                //
                // TextView(
                //   fontStyle: FontStyle.normal,
                //   fontFamily: 'Lato',
                //   fontSize: 17,
                //   textAlign: TextAlign.center,
                //   fontWeight: FontWeight.w700,
                //   color: BaseColors.grey,
                //   "Sign in succesfully..",
                //   // textStyle: BaseStyles.readMoreText,
                // ),
                // 10.toVSB,
                CustomRaisedButton(
                  width: Get.width,
                  bgBorderColor: Colors.transparent,
                  bgColor: BaseColors.black,
                  border: 10,
                  onTap: () {

                    Get.to(InstaHome());
                    //_signOut(context);

                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: TextView(
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Lato',
                      fontSize: 18,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w700,
                      color: BaseColors.white,
                      BaseStrings.insta,
                      // textStyle: BaseStyles.readMoreText,
                    ),
                  ),
                ),
                30.toVSB,
                CustomRaisedButton(
                  width: Get.width,
                  bgBorderColor: Colors.transparent,
                  bgColor: BaseColors.black,
                  border: 10,
                  onTap: () {
                    Get.to(FbHomeScreen());
                    //_signOut(context);

                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: TextView(
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Lato',
                      fontSize: 18,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w700,
                      color: BaseColors.white,
                      BaseStrings.fb,
                      // textStyle: BaseStyles.readMoreText,
                    ),
                  ),
                ),

              /*  Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: ElevatedButton(
                      // color: Colors.lightBlue,
                      onPressed: () => _signOut(context),
                      child: const Text(
                        'Sign Out',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signOut(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) {
          return MyApp();
        },
      ),
    );
  }
}
