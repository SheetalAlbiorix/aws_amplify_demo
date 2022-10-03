part of screens;

class OnBoardingPage extends GetView<OnBoardingController> {
  final OnBoardingController onBoardingController =
      Get.put(OnBoardingController());

  OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(15, 10),
          child: AppBar(
            backgroundColor: Colors.transparent,
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: SizedBox(
            width: 335.0,
            height: 60.0,
            child: FloatingActionButton(
              backgroundColor: BaseColors.black,

              onPressed: onBoardingController.forwardAction,
              // onBoardingController.forwardAction,
              child: Obx(
                () => TextView(
                  fontFamily: 'Lato',
                  fontStyle: FontStyle.normal,
                  onBoardingController.isLastPage
                      ? BaseStrings.start
                      : BaseStrings.next,
                  color: BaseColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                  // textStyle: BaseStyles.buttonText,
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(BaseAssets.backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    debugPrint("text skip");
                    Get.toNamed(BaseRoute.homePage);
                    // Get.to(HomePage());
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: TextView(
                      fontFamily: 'Lato',
                      textAlign: TextAlign.right,
                      BaseStrings.skip,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: onBoardingController.pageController,
                  onPageChanged: onBoardingController.selectedPageIndex,
                  itemCount: onBoardingController.onBoardingPages.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          onBoardingController
                              .onBoardingPages[index].imageAsset,
                          height: 375.h,
                          width: 375.w,
                        ),
                        20.toVSB,
                        TextView(
                          onBoardingController.onBoardingPages[index].title,
                          textAlign: TextAlign.center,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          // maxLines: 3,
                        ),
                        10.toVSB,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: TextView(
                            onBoardingController
                                .onBoardingPages[index].description,
                            textAlign: TextAlign.center,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Lato',
                            fontStyle: FontStyle.normal,
                            // maxLines: 3,
                          ),
                        ),
                        50.toVSB,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            onBoardingController.onBoardingPages.length,
                            (index) => Obx(() {
                              return onBoardingController
                                          .selectedPageIndex.value ==
                                      index
                                  ? Container(
                                      margin: const EdgeInsets.all(4),
                                      width: 25,
                                      height: 2,
                                      decoration: const BoxDecoration(
                                          color: BaseColors.black
                                          // shape: BoxShape.circle,
                                          ),
                                    )
                                  : Container(
                                      margin: const EdgeInsets.all(4),
                                      width: 10,
                                      height: 2,
                                      decoration: const BoxDecoration(
                                          color: BaseColors.darkGrey
                                          // shape: BoxShape.circle,
                                          ),
                                    );
                            }),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

/*    floatingActionButton: CustomRaisedButton(
        width: 335,
        height: 60,
        bgBorderColor: BaseColors.black,
        bgColor: BaseColors.black,
        // border: 10,
        onTap: () {
          // _submit();
        },
        child: TextView(
          BaseStrings.appName,
          color: BaseColors.white,
          // textStyle: BaseStyles.buttonText,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,*/
