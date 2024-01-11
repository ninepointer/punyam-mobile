import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../base/base.dart';
import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../modules.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() => Get.put(AuthController());
}

class AuthController extends BaseController<AuthRepository> {
  final loginFormKey = GlobalKey<FormState>();
  final signupFormKey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();

  final fullNameTextController = TextEditingController();

  final emailTextController = TextEditingController();
  final mobileTextController = TextEditingController();
  final otpTextController = TextEditingController();

  final referralTextController = TextEditingController();

  final isLoading = false.obs;
  bool get isLoadingStatus => isLoading.value;

  final isSignup = false.obs;
  final hasCampaignCode = false.obs;
  final token = ''.obs;
  final inviteCode = CampaignCodeData().obs;

  final campaignCode = ''.obs;

  void verifyOtp() => isSignup.value ? verifySignupOtp() : verifySigninOtp();

  Future userSignin() async {
    isLoading(true);

    FocusScope.of(Get.context!).unfocus();

    PhoneLoginRequest data = PhoneLoginRequest(
      mobile: mobileTextController.text,
    );

    try {
      final RepoResponse<GenericResponse> response =
          await repository.phoneLogin(
        data.toJson(),
      );
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          Get.toNamed(AppRoutes.otp);
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  Future verifySigninOtp() async {
    isLoading(true);

    FocusScope.of(Get.context!).unfocus();

    String deviceToken = await firebaseMessaging.getToken() ?? '-';
    print('DeviceToken : $deviceToken');

    VerifySigninRequest data = VerifySigninRequest(
      mobile: mobileTextController.text,
      mobileOtp: otpTextController.text,
      fcmTokenData: FcmTokenData(
        token: deviceToken,
      ),
    );

    try {
      final RepoResponse<VerifyPhoneLoginResponse> response =
          await repository.verifySigninOtp(
        data.toJson(),
      );
      if (response.data != null) {
        print("responsedata ${response.data?.toJson()}");
        if (response.data?.status?.toLowerCase() == "success") {
          token(response.data?.token);
          await AppStorage.setToken(response.data?.token);
          log('AppStorage.getToken : ${AppStorage.getToken()}');
          await getUserDetails();
          clearForm();
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  Future verifySignupOtp() async {
    isLoading(true);

    FocusScope.of(Get.context!).unfocus();

    VerifySignupRequest data = VerifySignupRequest(
      fullName: fullNameTextController.text,
      email: emailTextController.text,
      mobile: mobileTextController.text,
      mobileOtp: otpTextController.text,
      referrerCode: hasCampaignCode.value
          ? campaignCode.value
          : referralTextController.text,
    );

    try {
      final RepoResponse<GenericResponse> response =
          await repository.verifySignupOtp(
        data.toJson(),
      );
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          isSignup(false);
          Get.offAllNamed(AppRoutes.signin);
          SnackbarHelper.showSnackbar(response.data?.message!);
          clearForm();
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  Future userSignup() async {
    isLoading(true);
    SignupRequest data = SignupRequest(
      fullName: fullNameTextController.text,
      email: emailTextController.text,
      mobile: mobileTextController.text,
      referrerCode: hasCampaignCode.value
          ? campaignCode.value
          : referralTextController.text,
    );

    try {
      final RepoResponse<GenericResponse> response =
          await repository.userSignup(
        data.toJson(),
      );
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          isSignup(true);
          Get.toNamed(AppRoutes.otp);
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }

    isLoading(false);
  }

  Future getUserDetails({bool navigate = true}) async {
    isLoading(true);
    try {
      final response = await repository.loginDetails();
      if (response.data != null) {
        await AppStorage.setUserDetails(
            response.data ?? LoginDetailsResponse());

        String deviceToken = await firebaseMessaging.getToken() ?? '-';
        print('DeviceToken addFcmTokenData : $deviceToken');
        FcmTokenDataRequest fcmTokenDataRequest = FcmTokenDataRequest(
          fcmTokenData: FcmTokenData(token: deviceToken),
        );

        await repository.addFcmTokenData(fcmTokenDataRequest.toJson());

        Get.find<HomeController>().loadUserDetails();
        if (navigate) {
          await SocketService().initSocket();
          Get.offAllNamed(AppRoutes.home);
        }
        log('App ${AppStorage.getToken()}');
      } else {
        if (navigate) Get.offAllNamed(AppRoutes.signin);
        SnackbarHelper.showSnackbar(response.error?.message);
        log('App ${AppStorage.getToken()}');
        log('App ${AppStorage.getUserDetails().toJson()}');
      }
    } catch (e) {
      log(e.toString());
      Get.offAllNamed(AppRoutes.signin);
    }
    isLoading(false);
  }

  Future resendSigninOtp() async {
    isLoading(true);

    FocusScope.of(Get.context!).unfocus();

    PhoneLoginRequest data = PhoneLoginRequest(
      mobile: mobileTextController.text,
    );

    try {
      final RepoResponse<GenericResponse> response =
          await repository.resendSigninOtp(
        data.toJson(),
      );
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          SnackbarHelper.showSnackbar(response.data?.message);
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  // Future getDefaultInviteCode() async {
  //   isLoading(true);
  //   try {
  //     final RepoResponse<CampaignCodeResponse> response = await repository.getDefaultInviteCode();
  //     if (response.data != null) {
  //       inviteCode(response.data?.data);
  //     }
  //   } catch (e) {
  //     SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
  //   }
  //   isLoading(false);
  // }

  void clearForm() {
    fullNameTextController.clear();
    emailTextController.clear();
    mobileTextController.clear();
    otpTextController.clear();
  }
}
