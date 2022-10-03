part of widgets;

class CustomTextFormField extends StatefulWidget {
  final String? hint;
  final String? labelText;
  final TextEditingController? textEditingController;
  final double? border;
  final String? Function(String?)? validator;

  final Function(String?)? onChanged;
  final Color? bgBorderColor = ThemeService().whiteColor;
  final Color? bgColor = ThemeService().whiteColor;

  // IconData? suffixIcon;
  final Widget? suffixIcon;

  final bool? isPassword;
  final bool? readOnly;

  // final bool? isPassword;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool? obscureText;

  CustomTextFormField({
    Key? key,
    this.hint,
    this.labelText,
    this.textEditingController,
    this.onChanged,
    this.validator,
    this.border,
    /* this.bgBorderColor,
      this.bgColor,*/
    this.suffixIcon,
    this.isPassword = false,
    this.readOnly = false,
    this.textInputAction,
    this.keyboardType,
    this.maxLength,
    this.obscureText,
  }) : super(key: key);

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  final SignInScreenController signInScreenController =
      Get.put(SignInScreenController());

  bool _isToggle = false;

  @override
  Widget build(BuildContext context) {
    // widget.textEditingController!.clear();
    return Container(
      // color: BaseColors.white,
      height: 60,
      width: 335.w,
      decoration: BoxDecoration(
        color: BaseColors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: BaseColors.shadow.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            // offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: TextFormField(
          obscureText: widget.isPassword! ? !_isToggle : false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          onChanged: widget.onChanged,
          controller: widget.textEditingController,
          decoration: InputDecoration(
              suffixIcon: widget.isPassword!
                  ? IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset(
                          _isToggle
                              ? BaseAssets.showPassword
                              : BaseAssets.hidePassword,
                          /* width: 10.w,
                          height: 7.h,*/
                        ),
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
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              hintText: widget.hint,
              labelText: widget.labelText,
              labelStyle:
                  const TextStyle(fontSize: 13, color: BaseColors.grey)),
        ),
      ),
    );
  }
}
