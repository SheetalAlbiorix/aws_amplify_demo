part of controller;

class OnBoardingController extends GetxController {
  var selectedPageIndex = 0.obs;

  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      // Get.off( HomePage());
      Get.toNamed(BaseRoute.homePage);
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnBoardingInfo> onBoardingPages = [
    OnBoardingInfo(BaseAssets.onBoarding1, 'Discover Useful Resources',
        'E-Learning is for everyone. Now is the chance to sign up and receive all the lessons that we’ve prepared for education so far.'),
    OnBoardingInfo(BaseAssets.onBoarding1, 'Cooking Safe Food',
        'We are maintain safty and We keep clean while making food.'),
    OnBoardingInfo(BaseAssets.onBoarding1, 'Quick Delivery',
        'Orders your favorite meals will be  immediately deliver')
  ];
}
