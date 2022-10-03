part of widgets;

class SuccessScreen extends StatefulWidget {
  final String? text;
  final String? description;
  final String? image;
  final String? buttonText;
  final VoidCallback? onTap;

  const SuccessScreen(
      {Key? key,
      this.text,
      this.description,
      this.image,
      this.buttonText,
      this.onTap})
      : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(BaseAssets.signInBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: SizedBox(
              width: 295.w,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      BaseAssets.logo,
                      width: 117.w,
                      height: 82.h,
                    ),
                    Image.asset(
                      widget.image!,
                      // BaseAssets.accountCreated,
                      width: 206.w,
                      height: 206.h,
                    ),
                    TextView(
                      widget.text!,
                      textColor: BaseColors.black,
                      fontSize: 20,
                      color: BaseColors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Spartan',
                      textAlign: TextAlign.center,
                      fontStyle: FontStyle.normal,
                      height: 3.2,
                    ),
                    20.toVSB,
                    /*  TextView(BaseStrings.accountCreated),
                    TextView(BaseStrings.yourAccountHasBeenCreatedSuccessfully),*/
                    SizedBox(
                      width: 295.w,
                      child: TextView(
                        widget.description!,
                        textColor: BaseColors.black,
                        fontSize: 16,
                        color: BaseColors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Lato',
                        textAlign: TextAlign.center,
                        fontStyle: FontStyle.normal,
                        // height: 1.7,
                      ),
                    ),
                    25.toVSB,
                    CustomRaisedButton(
                      width: 295.w,
                      height: 60.h,
                      bgBorderColor: Colors.transparent,
                      bgColor: BaseColors.black,
                      border: 10,
                      onTap: widget.onTap!,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: TextView(
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Lato',
                          fontSize: 18,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w700,
                          color: BaseColors.white,
                          // BaseStrings.getStarted,
                          widget.buttonText!,
                          // textStyle: BaseStyles.readMoreText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
