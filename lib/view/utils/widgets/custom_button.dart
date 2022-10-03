part of widgets;

class CustomRaisedButton extends StatelessWidget {
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? border;
  final Widget? child;
  final double? padding;

  final Color? bgColor;

  final Color? bgBorderColor;
  final Color? textColor;

  const CustomRaisedButton(
      {Key? key,
      required this.child,
      this.width,
      this.height,
      this.border = 0.0,
      this.bgBorderColor,
      this.padding,
      required this.onTap,
      this.bgColor,
      this.textColor,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // textStyle: TextStyle(color: themeConfig.whiteBlackColor),
        padding: const EdgeInsets.all(0.0),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(border!)),
      ),
      onPressed: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(border!),
          ),
          border: Border.all(
              color: bgBorderColor ?? themeConfig!.blackWhiteColor, width: 1),
          color: bgColor ?? themeConfig!.whiteBlackColor,
        ),
        // padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
        child: child,
      ),
    );
  }
}
