part of widgets;

/*class CustomTextField extends StatefulWidget {
  final String? hint;
  final TextEditingController? textEditingController;
  double? border;
  final String? Function(String?)? validator;
  Color? bgBorderColor = ThemeService().whiteColor;
  Color? bgColor = ThemeService().whiteColor;

  Widget? suffixIcon;
  bool? isPassword;
  bool? readOnly;

  // final bool? isPassword;
  TextInputAction? textInputAction;
  TextInputType? keyboardType;
  int? maxLength;
  bool? obscureText;

  CustomTextField(
      {Key? key,
      this.hint,
      this.textEditingController,
      this.validator,
      this.border,
      this.bgBorderColor,
      this.bgColor,
      this.suffixIcon,
      this.isPassword = false,
      this.readOnly = false,
      this.textInputAction,
      this.keyboardType,
      this.maxLength,
      this.obscureText})
      : super(key: key);

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool _isToggle = false;

  @override
  Widget build(BuildContext context) {
    // FocusScope.of(context).unfocus();
    // widget.textEditingController!.clear();
    Future.delayed(const Duration(),
        () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
    return Material(
      borderOnForeground: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: TextFormField(
          readOnly: widget.readOnly!,
          obscureText: widget.isPassword! ? !_isToggle : false,
          maxLength: widget.maxLength,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: Colors.black,
          validator: widget.validator!,
          controller: widget.textEditingController,
          decoration: InputDecoration(
            suffixIcon: widget.isPassword!
                ? IconButton(
                    icon: Icon(
                      _isToggle
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: ThemeService().blackColor,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _isToggle = !_isToggle;
                        },
                      );
                    },
                  )
                : widget.suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.bgBorderColor ?? themeConfig!.blackWhiteColor,
                  width: 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(widget.border!),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.bgBorderColor ?? themeConfig!.blackWhiteColor,
                  width: 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(widget.border!),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.bgBorderColor ?? themeConfig!.blackWhiteColor,
                  width: 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(widget.border!),
              ),
            ),
            hintText: widget.hint,
          ),
        ),
      ),
    );
  }
}*/
