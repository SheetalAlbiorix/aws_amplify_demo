
import 'dart:ui';

import 'package:amplify_ui_component/app/utils/helper/theme_service.dart';
import 'package:amplify_ui_component/app/utils/widgets/text_view.dart';
import 'package:flutter/material.dart';

class CustomRaisedButtonWithIcon extends StatelessWidget {
  final VoidCallback onTap;
  final String? title;

  // String? icon;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? border;

  final double? padding;
  final Color? bgColor;

  final Color? bgBorderColor;
  final Color? textColor;

  // final Color? iconColor ;

  const CustomRaisedButtonWithIcon({
    Key? key,
    required this.title,
    // required this.icon,
    this.width,
    this.height,
    this.border = 6.0,
    this.bgBorderColor,
    this.padding = 18.0,
    required this.onTap,
    this.bgColor,
    this.textColor,
    this.fontSize,
    // this.iconColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(color: themeConfig!.blackWhiteColor),
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.all(padding!),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(border!)),
      ),
      onPressed: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(border!),
          ),
          border: Border.all(
              color: bgBorderColor ?? ThemeService().whiteColor, width: 1),
          color: bgColor ?? ThemeService().blackColor,
        ),
        padding: EdgeInsets.symmetric(vertical: padding ?? 2, horizontal: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextView(
              title!,
              fontSize: 18,
              textColor: textColor ?? ThemeService().blackColor,
            ),
            const SizedBox(
              width: 12,
            ),
            /* Container(
              height: 50,
              width: 20,
              child: Image.asset(
                icon!,
                fit: BoxFit.cover,
                color: iconColor,
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
