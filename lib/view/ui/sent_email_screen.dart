part of screens;

class SentEmail extends StatefulWidget {
  const SentEmail({Key? key}) : super(key: key);

  @override
  State<SentEmail> createState() => _SentEmailState();
}

class _SentEmailState extends State<SentEmail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SuccessScreen(
          buttonText: BaseStrings.done,
          text: BaseStrings.yourPasswordHasBeenReset,
          description: BaseStrings.forgotPasswordSentEmailDescription,
          image: BaseAssets.forgotPassword,
          onTap: () {},
        ),
      ),
    );
  }
}
