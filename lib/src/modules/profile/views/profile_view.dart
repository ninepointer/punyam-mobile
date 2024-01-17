import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:punyam/src/modules/modules.dart';
import 'package:punyam/src/modules/profile/widgets/profile_list_tile.dart';

import '../../../core/core.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.loadData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16).copyWith(
          bottom: 156,
        ),
        child: Column(
          children: [
            Obx(
              () => Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  // color: AppColors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.grey.withOpacity(.25),
                  ),
                ),
                child: ClipOval(
                  child: controller.userDetails.value.data?.profilePhoto == null
                      ? Padding(
                          padding: EdgeInsets.all(2),
                          child: Image.asset(
                            Get.isDarkMode
                                ? AppImages.darkAppLogo
                                : AppImages.lightAppLogo,
                            fit: BoxFit.cover,
                          ))
                      : Image.network(
                          controller
                                  .userDetails.value.data?.profilePhoto?.url ??
                              '',
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Text(
              controller.getUserFullName(),
              style: Theme.of(context).textTheme.tsMedium18,
            ),
            SizedBox(height: 8),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     InkWell(
            //       borderRadius: BorderRadius.circular(50),
            //       onTap: () {
            //         String referralCode =
            //             controller.userDetailsData.myReferralCode ?? '-';
            //         Clipboard.setData(ClipboardData(text: referralCode));
            //         SnackbarHelper.showSnackbar(
            //             'Referral code copied to clipboard');
            //       },
            //       child: Container(
            //         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(50),
            //           border: Border.all(
            //             color: AppColors.grey.withOpacity(.25),
            //           ),
            //         ),
            //         child: Row(
            //           children: [
            //             Text(
            //               'Referral Code : ${controller.userDetailsData.myReferralCode ?? '-'}',
            //               style: AppStyles.tsPrimaryMedium14,
            //             ),
            //             SizedBox(width: 16),
            //             Icon(
            //               Icons.copy,
            //               size: 20,
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(height: 16),
            ProfileListTile(
              icon: Icons.person,
              label: 'My Profile',
              onTap: () async {
                controller.loadProfileDetails();
                await Get.toNamed(AppRoutes.profileDetails);
                controller.loadData();
              },
            ),

            ProfileListTile(
              label: 'Log out',
              icon: Icons.logout,
              onTap: () async {
                AppStorage.clearStorage();
                Get.offAllNamed(AppRoutes.signin);
              },
            ),
            // ProfileListTile(
            //   label: 'Settings',
            //   icon: Icons.settings,
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
