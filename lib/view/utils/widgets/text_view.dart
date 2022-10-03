part of widgets;

class TextView extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final double? height;
  final Color? textColor;
  final Color? color;
  final Color? backgroundColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final List<Shadow>? shadows;
  final TextDecoration? textDecoration;
  final String? fontFamily;

  // TextStyle? textStyle;

  const TextView(
    this.text, {
    Key? key,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.height,
    this.textColor,
    this.color,
    this.backgroundColor,
    this.fontSize = 14.0,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.shadows,
    this.textDecoration,
    this.fontFamily,
    // this.textStyle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
      style: TextStyle(
          decoration: TextDecoration.none,
          height: height,
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontFamily: fontFamily ?? "Spartan",
          color: color),
    );
  }
}
