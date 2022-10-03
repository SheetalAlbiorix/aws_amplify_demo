part of screens;

class AccountCreated extends StatefulWidget {
  const AccountCreated({Key? key}) : super(key: key);

  @override
  State<AccountCreated> createState() => _AccountCreatedState();
}

class _AccountCreatedState extends State<AccountCreated> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SuccessScreen(
          buttonText: BaseStrings.getStarted,
          description: BaseStrings.yourAccountHasBeenCreatedSuccessfully,
          text: BaseStrings.accountCreated,
          image: BaseAssets.accountCreated,
          onTap: () {
            Get.to(VerifyPhoneNumber());
          },
        ),
      ),
    );
  }
}
