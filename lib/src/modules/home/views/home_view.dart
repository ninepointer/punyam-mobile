import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:punyam/src/app/app.dart';
import 'package:uni_links/uni_links.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeController controller;

  Uri? initialUri;
  Uri? latestUri;
  bool _initialUriIsHandled = false;

  List<Widget> _tabs = [
    DashboardView(),
  ];

  @override
  void initState() {
    super.initState();
    // _handleInitialUri();
    // _handleIncomingLinks();
    // _handelInitialNotification();
    controller = Get.find<HomeController>();
  }

  // Future _handleInitialUri() async {
  //   if (!_initialUriIsHandled) {
  //     _initialUriIsHandled = true;
  //     try {
  //       final uri = await getInitialUri();
  //       print('UniLinks Initial : $uri');
  //       if (uri != null) DeepLinkingServices.handelLinkRouting(uri);
  //       if (!mounted) return;
  //     } catch (e) {
  //       print('UniLinks Error : $e');
  //     }
  //   }
  // }

  // void _handleIncomingLinks() {
  //   StreamSubscription? sub;
  //   sub = uriLinkStream.listen((Uri? uri) {
  //     if (!mounted) return;
  //     print('UniLinks Incoming : $uri');
  //     if (uri != null) DeepLinkingServices.handelLinkRouting(uri);
  //   }, onError: (Object e) {
  //     if (!mounted) return;
  //     print('UniLinks Error : $e');
  //   });
  // }

  // void _handelInitialNotification() async {
  //   print('handelInitialNotification');
  //   RemoteMessage? initialMessage = await firebaseMessaging.getInitialMessage();
  //   print('handelInitialNotification : ${initialMessage?.toMap()}');
  //   if (initialMessage != null)
  //     NotificationServices.handelNotificationClick(
  //       initialMessage.data,
  //       isLocal: true,
  //     );
  // }

  void _updateTab(int index) {
    controller.selectedIndex.value = index;

    switch (index) {
      case 0:
        Get.find<HomeController>().loadData();

        // Get.find<WalletController>().getWalletTransactionsList();

        break;
      default:
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CommonDrawer(),
      onDrawerChanged: (isOpened) {
        if (isOpened) controller.userDetails(AppStorage.getUserDetails());
      },
      appBar: AppBar(
          title: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,',
                    style: AppStyles.tsGreyRegular12,
                  ),
                  Text(
                    controller
                            .userDetailsData.data?.fullName?.capitalizeFirst ??
                        '-',
                    style: Theme.of(context).textTheme.tsMedium16,
                  ),
                ],
              ),
            ],
          ),
          actions: [
            // Obx(
            //   () => GestureDetector(
            //     onTap: () {
            //       final controller = Get.find<WalletController>();
            //       controller.loadData();
            //       controller.selectedTabBarIndex(0);
            //       Get.toNamed(AppRoutes.wallet);
            //     },
            //     child: Container(
            //       margin: EdgeInsets.symmetric(vertical: 8),
            //       padding: EdgeInsets.symmetric(horizontal: 14),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(50),
            //         color: AppColors.grey.withOpacity(.1),
            //       ),
            //       child: Row(
            //         children: [
            //           Icon(
            //             Icons.account_balance_wallet_rounded,
            //             color: AppColors.secondary,
            //           ),
            //           SizedBox(width: 12),
            //           Text(
            //             FormatHelper.formatNumbers(
            //               Get.find<WalletController>().totalCashAmount.value,
            //             ),
            //             style: AppStyles.tsBlackMedium14.copyWith(
            //               color: AppColors.success,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            IconButton(
              splashRadius: 24,
              icon: Icon(Icons.person),
              onPressed: () => Get.toNamed(AppRoutes.profile),
            ),
          ]),
      body: Obx(() => _tabs[controller.selectedIndex.value]),
      floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: Get.isDarkMode
              ? AppColors.cinnamonStickColor
              : AppColors.cinnamonStickColor,
          onPressed: () => _updateTab(2),
          child: Image.asset(AppImages.prayIcon)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 4,
          child: Container(
            height: 60,
            margin: EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTabButton(
                  context,
                  index: 0,
                  label: 'Home',
                  icon: Icons.bar_chart_rounded,
                ),
                _buildTabButton(
                  context,
                  index: 1,
                  label: 'Temples',
                  icon: Icons.analytics_rounded,
                ),
                SizedBox(width: 40),
                _buildTabButton(
                  context,
                  index: 3,
                  label: 'Shop',
                  icon: Icons.trending_up_rounded,
                ),
                _buildTabButton(
                  context,
                  index: 4,
                  label: 'Services',
                  icon: Icons.groups_rounded,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded _buildTabButton(
    BuildContext context, {
    required int index,
    required String label,
    required IconData icon,
  }) {
    return Expanded(
      child: MaterialButton(
        minWidth: 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: controller.selectedIndex.value == index
                  ? Get.isDarkMode
                      ? AppColors.cinnamonStickColor
                      : AppColors.cinnamonStickColor
                  : AppColors.grey,
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.tsRegular11.copyWith(
                    color: controller.selectedIndex.value == index
                        ? Get.isDarkMode
                            ? AppColors.cinnamonStickColor
                            : AppColors.cinnamonStickColor
                        : AppColors.grey,
                  ),
            )
          ],
        ),
        onPressed: () => _updateTab(index),
      ),
    );
  }
}
