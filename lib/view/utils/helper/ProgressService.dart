import 'dart:async';

import 'package:amplify_ui_component/view/utils/helper/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProgressService extends GetxService {
  BuildContext? _pageContext;
  BuildContext? _dialogContext;
  bool _isVisible = false;
  Timer? _timer;

  // void _timeOut() async {
  //   _timer = Timer(Duration(seconds: Configuration().getRequestTimeout()), () {
  //     if (Get.currentRoute != RouterName.pdfViewPage) {
  //       if (_isVisible) {
  //         _isVisible = false;
  //         if (Navigator.canPop(_dialogContext!)) {
  //           dismissProgress();
  //           showMsg(
  //             type: MessageType.error,
  //             title: errorMessageTitle,
  //             message: errorLoadingTimeout,
  //           );
  //         }
  //       }
  //     } else {
  //       Dialog waitingDialog = Dialog(
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: <Widget>[
  //               const SizedBox(
  //                 height: 8,
  //               ),
  //               const CustomText(continueWaiting,
  //                   fontWeight: FontWeight.bold,
  //                   textAlign: TextAlign.start,
  //                   fontSize: 16),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               const CustomText(
  //                 waitingMessage,
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               Align(
  //                 alignment: Alignment.center,
  //                 child: DialogButtons(
  //                   onOk: () => Get.back(),
  //                   onCancel: () {
  //                     dismissProgress();
  //                     Get.delete<PdfViewPageController>();
  //                     closeDialogAndBack();
  //                   },
  //                   okButtonText: wait.tr,
  //                   cancelButtonText: cancel.tr,
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       );
  //       showDialog(
  //           context: Get.context!, builder: (BuildContext context) => waitingDialog);
  //     }
  //   });
  // }

  ///show loading dialog
  void showProgress({bool showBackground = true, String? semanticsLabel}) {
    if (Get.context != null) {
      _isVisible = true;
      _pageContext = Get.context!;

      FocusScope.of(_pageContext!).requestFocus(FocusNode());
      showGeneralDialog(
        context: _pageContext!,
        barrierColor: showBackground
            ? themeConfig!.whiteBlackColor
            : themeConfig!.blackWhiteColor.withOpacity(0.3),
        barrierDismissible: false,
        pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            ) {
          _dialogContext = context;
          return Semantics(
            label: semanticsLabel == null
            ?"Loading"
               // ? loadingAcc.tr
                : semanticsLabel.tr +"Loading",
            child: Semantics(
              excludeSemantics: true,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // if (showBackground)
                  //   Image.asset(
                  //     themeConfig!.bgWhiteAsset,
                  //     fit: BoxFit.cover,
                  //     height: double.infinity,
                  //     width: double.infinity,
                  //   ),
                  Container(
                    color: Colors.white,
                    child: Center(
                      child:CircularProgressIndicator(
                        color: Colors.green,
                      ),

                      // Image.asset(
                      //   themeConfig!.loadingGif,
                      //   width: Get.width * 0.6,
                      //   fit: BoxFit.cover,
                      //   semanticLabel: barbriLogo,
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  ///dismiss loading dialog
  void dismissProgress() {
    try {
      _isVisible = false;
      _timer?.cancel();
      if (_dialogContext != null && Navigator.canPop(_dialogContext!)) {
        Navigator.pop(_dialogContext!);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}