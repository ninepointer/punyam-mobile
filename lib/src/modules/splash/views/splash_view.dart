import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punyam/main.dart';
import 'package:punyam/src/core/core.dart';

import '../splash_index.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashbackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppLogoWidget(),
                // SizedBox(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: LinearProgressIndicator(
                      backgroundColor: AppColors.grey.withOpacity(.25),
                      color: AppColors.cinnamonStickColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Obx(
                () => Column(
                  children: [
                    if (!isProd)
                      Text(
                        'DEV',
                        style: Get.isDarkMode
                            ? AppStyles.tsGreyRegular14
                            : AppStyles.tsPrimaryMedium12
                                .copyWith(color: AppColors.lightGreen),
                      ),
                    Text(
                      controller.appVersion,
                      style: AppStyles.tsGreyRegular14,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
