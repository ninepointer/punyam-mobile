import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:punyam/src/core/widgets/common_text_field_for_signin.dart';

import '../../../core/core.dart';
import '../../modules.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late AuthController controller;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    controller = Get.find<AuthController>();
    formKey = GlobalKey<FormState>();
    print('AuthController Code : ${controller.campaignCode.value}');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (controller.campaignCode.value.isNotEmpty) {
      controller.hasCampaignCode(true);
      controller.referralTextController.text = controller.campaignCode.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Form(
          key: formKey,
          child: SafeArea(
            child: Center(
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      color: AppColors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/signup.png',
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 24),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 0),
                            child: CommonCard(
                              hasBorder: false,
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.zero,
                              children: [
                                Align(
                                  child: Text(
                                    'Start your spiritual journey with us!',
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.tsMedium20,
                                  ),
                                ),
                                // SizedBox(height: 24),
                                // Align(
                                //   child: Text(
                                //     'Please provide your details, confirmation will be sent on the given email.',
                                //     textAlign: TextAlign.center,
                                //     style: Theme.of(context)
                                //         .textTheme
                                //         .tsGreyRegular16,
                                //   ),
                                // ),
                                SizedBox(height: 24),
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 1,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  child: CommonTextFieldForSingIn(
                                    controller:
                                        controller.fullNameTextController,
                                    hintText: 'Enter your full name',
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: AppColors.grey,
                                    ),
                                    keyboardType: TextInputType.name,
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value.length == 0) {
                                        return 'This field is required!';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 1,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  child: CommonTextFieldForSingIn(
                                    controller: controller.emailTextController,
                                    hintText: 'Enter your email',
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: AppColors.grey,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value.length == 0) {
                                        return 'This field is required!';
                                      } else if (!value.isEmail) {
                                        return 'Please enter valid email';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 1,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  child: CommonTextFieldForSingIn(
                                    controller: controller.mobileTextController,
                                    hintText: 'Enter your mobile number',
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      color: AppColors.grey,
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10),
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    validator: (value) {
                                      RegExp regExp = RegExp(r'^[6-9]\d{9}$');
                                      if (value == null ||
                                          value.isEmpty ||
                                          value.length == 0) {
                                        return 'This field is required!';
                                      } else if (value.length == 10) if (!regExp
                                          .hasMatch(value)) {
                                        return 'Please enter valid mobile number!';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 1,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  child: CommonTextFieldForSingIn(
                                    controller:
                                        controller.referralTextController,
                                    isDisabled:
                                        controller.hasCampaignCode.value,
                                    hintText: 'Enter Referral/Invite code',
                                    prefixIcon: Icon(
                                      Icons.redeem_rounded,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                if (!controller.hasCampaignCode.value)
                                  if (controller
                                              .inviteCode.value.campaignCode !=
                                          null &&
                                      controller.inviteCode.value.campaignCode!
                                          .isNotEmpty) ...[
                                    Text(
                                      'Unlock your welcome bonus! Use code ${controller.inviteCode.value.campaignCode} & grab ₹${controller.inviteCode.value.campaignSignupBonus?.amount ?? 0} in your StoxHero wallet!',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.success,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 16),
                                  ],
                                CommonFilledButton(
                                  backgroundColor: Get.isDarkMode
                                      ? AppColors.darkGreen
                                      : AppColors.cinnamonStickColor,
                                  label: 'Create account',
                                  onPressed: () {
                                    bool isValid =
                                        formKey.currentState?.validate() ??
                                            false;
                                    if (isValid) controller.userSignup();
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),
                          Center(
                            child: Text(
                              'Already have an account?',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.tsRegular16,
                            ),
                          ),
                          SizedBox(height: 16),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 36.0),
                            child: CommonOutlinedButton(
                              margin: EdgeInsets.only(bottom: 10),
                              backgroundColor: Get.isDarkMode
                                  ? AppColors.cinnamonStickColor
                                  : AppColors.cinnamonStickColor,
                              labelColor: Get.isDarkMode
                                  ? AppColors.cinnamonStickColor
                                  : AppColors.cinnamonStickColor,
                              label: 'Sign In',
                              onPressed: () => Get.toNamed(AppRoutes.signin),
                            ),
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
