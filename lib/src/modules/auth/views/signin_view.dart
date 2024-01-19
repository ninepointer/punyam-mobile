import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:punyam/src/core/widgets/common_text_field_for_signin.dart';

import '../../../app/app.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  late AuthController controller;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    controller = Get.find<AuthController>();
    formKey = GlobalKey<FormState>();
    _initializeDynamicLink();
  }

  Future _initializeDynamicLink() async {
    await DynamicLinkServices.initializeDynamicLink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  decoration: BoxDecoration(color: AppColors.white),
                  // padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // SizedBox(height: 24),
                      Image.asset(
                        'assets/images/signin.png',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width -
                            MediaQuery.of(context).size.width * 0.15,
                        fit: BoxFit.cover,
                      ),
                      CommonCard(
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.zero,
                        children: [
                          Align(
                            child: Text(
                              'One app for all your spiritual\nneeds!',
                              style: Theme.of(context).textTheme.tsMedium20,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          // SizedBox(height: 24),
                          // Align(
                          //   child: Text(
                          //     'Please provide your mobile number, a six digit OTP will be sent for verification.',
                          //     textAlign: TextAlign.center,
                          //     style: AppStyles.tsGreyRegular16,
                          //   ),
                          // ),
                          SizedBox(height: 24),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Form(
                                    key: formKey,
                                    child: Container(
                                      height: 48,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
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
                                            controller.mobileTextController,
                                        hintText: 'Enter your mobile number',
                                        keyboardType: TextInputType.phone,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(10),
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                        prefixIcon: Icon(
                                          Icons.phone,
                                          color: AppColors.grey,
                                        ),
                                        validator: (value) {
                                          RegExp regExp =
                                              RegExp(r'^[6-9]\d{9}$');
                                          if (value == null ||
                                              value.isEmpty ||
                                              value.length == 0) {
                                            return 'This field is required!';
                                          } else if (value.length ==
                                              10) if (!regExp.hasMatch(value)) {
                                            return 'Please enter valid mobile number!';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Obx(
                                    () => CommonFilledButton(
                                      backgroundColor: Get.isDarkMode
                                          ? AppColors.darkGreen
                                          : AppColors.cinnamonStickColor,
                                      isLoading: controller.isLoadingStatus,
                                      label: 'Continue',
                                      onPressed: () {
                                        bool isValid =
                                            formKey.currentState?.validate() ??
                                                false;
                                        if (isValid) controller.userSignin();
                                      },
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                      // Spacer(),
                      // SizedBox(height: 24),
                      // Center(
                      //   child: Text(
                      //     'Learn and earn from stock market trading.\nClaim your free account now!',
                      //     textAlign: TextAlign.center,
                      //     style: Theme.of(context).textTheme.tsRegular16,
                      //   ),
                      // ),
                      // SizedBox(height: 24),
                      //  Obx(
                      //       () => CommonFilledButton(
                      //         backgroundColor: Get.isDarkMode
                      //             ? AppColors.darkGreen
                      //             : AppColors.cinnamonStickColor,
                      //         isLoading: controller.isLoadingStatus,
                      //         label: 'Sign In With Google',
                      //         leadingIcon: AppIcons.googleLogo,
                      //         onPressed: () {
                      //           controller.googleSignIn();
                      //         },
                      //       ),
                      //     ),
                      // Divider(),
                      SizedBox(height: 16),
                      Text('Or login with'),
                      SizedBox(height: 8),
                      InkWell(
                        onTap: () {
                          controller.googleSignIn();
                        },
                        borderRadius: BorderRadius.circular(50),
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(AppIcons.googleLogo),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 36.0),
                        child: CommonOutlinedButton(
                          margin: EdgeInsets.only(bottom: 10),
                          backgroundColor: Get.isDarkMode
                              ? AppColors.cinnamonStickColor
                              : AppColors.cinnamonStickColor,
                          labelColor: Get.isDarkMode
                              ? AppColors.cinnamonStickColor
                              : AppColors.cinnamonStickColor,
                          label: 'Create account',
                          onPressed: () {
                            // controller.getDefaultInviteCode();
                            Get.toNamed(AppRoutes.signup);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
