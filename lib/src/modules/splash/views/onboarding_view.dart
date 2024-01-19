import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int currentIndex = 0;
  late PageController? _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  void navigateToNextScreen() {
    if (currentIndex == contents.length - 1) {
      navigateToSignin();
    } else {
      _pageController?.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void navigateToSignin() {
    AppStorage.setNewUserStatus(false);
    Get.offAllNamed(AppRoutes.signin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: contents.length,
              onPageChanged: (int index) {
                currentIndex = index;
                setState(() {});
              },
              itemBuilder: (_, index) {
                var item = contents[index];
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(item.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.80),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          contents.length,
                          (index) => buildDot(index),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    if (currentIndex == contents.length - 1)
                      Column(
                        children: [
                          SizedBox(height: 20),
                          CommonFilledButton(
                            labelColor: AppColors.cinnamonStickColor,
                            backgroundColor: Get.isDarkMode
                                ? AppColors.white
                                : AppColors.white,
                            width: 250,
                            height: 50,
                            label: (currentIndex == contents.length - 1
                                ? 'Get Started'
                                : 'Next'),
                            onPressed: navigateToNextScreen,
                          )
                        ],
                      )
                    else
                      SizedBox(
                        height: 52,
                        child: FittedBox(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 1,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: FloatingActionButton(
                              elevation: 0,
                              backgroundColor: Get.isDarkMode
                                  ? AppColors.white
                                  : AppColors.white,
                              child: Icon(
                                Icons.chevron_right_rounded,
                                color: AppColors.cinnamonStickColor,
                              ),
                              onPressed: navigateToNextScreen,
                            ),
                          ),
                        ),
                      ),
                    // SizedBox(height: 10),
                    if (currentIndex != contents.length - 1)
                      TextButton(
                        onPressed: navigateToSignin,
                        child: Text(
                          'Skip',
                          style: AppStyles.tsGreyMedium20
                              .copyWith(color: AppColors.white.shade300),
                        ),
                      ),
                    SizedBox(height: 16),
                  ]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index) {
    return Container(
      alignment: Alignment.center,
      height: 8,
      width: currentIndex == index ? 24 : 8,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: currentIndex == index
            ? AppColors.cinnamonStickColor
            : AppColors.white.withOpacity(.7),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}

class OnBoardingContent {
  String image;
  String title;
  String description;

  OnBoardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnBoardingContent> contents = [
  // OnBoardingContent(
  //   image: 'assets/images/onboarding2.png',
  //   title: 'Battle Ground',
  //   description: 'Enter trading battles, show your skills, and win \n exciting gifts and cash prizes!',
  // ),
  OnBoardingContent(
    image: AppImages.onBoarding1,
    title: 'Find your divine touch',
    description: 'Stay connected with temples and places of worship near you!',
  ),
  OnBoardingContent(
    image: AppImages.onBoarding2,
    title: 'Participate in religious events',
    description:
        "Take part in global events right from the comfort of your home!",
  ),
  OnBoardingContent(
    image: AppImages.onBoarding3,
    title: 'Books poojas on demand',
    description: 'Access our network of pandit jis for home poojas!',
  ),
  OnBoardingContent(
    image: AppImages.onBoarding4,
    title: 'Books poojas on demand',
    description: 'Access our network of pandit jis for home poojas!',
  ),
  // OnBoardingContent(
  //   image: AppImages.mandir,
  //   title: 'Refer your friends and win ',
  //   description:
  //       'Refer your friend & get \u{20B9}15 in your StoxHero wallet, your friend gets \u{20B9}100 as signup bonus',
  // ),
  // OnBoardingContent(
  //   image: AppImages.mandir,
  //   title: 'Check TestZone Weekly Earning Leaderboard',
  //   description:
  //       'Check the TestZone profiles of top TestZone traders of the week along with their recent TestZone participations!',
  // ),
];
