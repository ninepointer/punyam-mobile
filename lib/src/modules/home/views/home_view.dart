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
  late MandirController mandirController;

  Uri? initialUri;
  Uri? latestUri;
  bool _initialUriIsHandled = false;

  List<Widget> _tabs = [
    DashboardView(),
    // MandirView(),
    // MandirView(),
    MandirView(),
    PoojaServicesView(),
  ];

  @override
  void initState() {
    super.initState();
    // _handleInitialUri();
    // _handleIncomingLinks();
    // _handelInitialNotification();

    controller = Get.find<HomeController>();
    controller.getUserCurrentLocation();
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
        Get.find<PoojaServicesController>().loadData();
        Get.find<MandirController>().loadData();
        // Get.find<CollegeContestController>().getLiveCollegeContestList();

        break;
      case 1:
        Get.find<MandirController>().loadData();
        break;
      case 2:
        Get.find<PoojaServicesController>().loadData();
        // Get.find<MandirController>().loadData();
        break;
      // case 3:
      //   Get.find<MandirController>().loadData();
      //   break;
      // case 3:
      //   break;
      default:
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: CommonDrawer(),
      // onDrawerChanged: (isOpened) {
      //   if (isOpened) controller.userDetails(AppStorage.getUserDetails());
      // },
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            // Get.toNamed(AppRoutes.location);
          },
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 4),
                child: Icon(
                  Icons.location_on,
                  size: 30,
                ),
              ),
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (controller.locationByLatandLong.value.isNotEmpty)?
                      Row(
                        children: [
                          Text(
                            "${controller.locationByLatandLong.first.addressComponents?.first.shortName}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down)
                        ],
                      ):Text(
                        'No location selected',
                        style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    (controller.locationByLatandLong.value.isNotEmpty)?
                      Container(
                        width: MediaQuery.of(context).size.width -
                            MediaQuery.of(context).size.width * 0.36,
                        child: Text(
                          "${controller.locationByLatandLong.first.formattedAddress?.replaceAll(controller.addressComponent.first.shortName.toString() + ", ", "")}",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ):Text('Please turn on your location!', style: TextStyle(
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,),
                  ],
                ),
              )
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.profile),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 20, // Adjust the radius as needed
                backgroundColor: AppColors.brandYellow.withOpacity(1),
                child: ClipOval(
                  child: controller.userDetails.value.data?.profilePhoto == null
                      ? Image.asset(
                          Get.isDarkMode
                              ? AppImages.darkAppLogo
                              : AppImages.lightAppLogo,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          controller
                                  .userDetails.value.data?.profilePhoto?.url ??
                              '',
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
          ),
        ],
      ),

      body: Obx(() => _tabs[controller.selectedIndex.value]),
      // floatingActionButton: FloatingActionButton(
      //     elevation: 0,
      //     backgroundColor: Get.isDarkMode
      //         ? AppColors.cinnamonStickColor
      //         : AppColors.cinnamonStickColor,
      //     onPressed: () {},
      //     //_updateTab(2)
      //     child: Image.asset(AppImages.prayIcon)),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                  label: 'Mandir',
                  icon: Icons.analytics_rounded,
                ),
                // SizedBox(width: 40),
                // _buildTabButton(
                //   context,
                //   index: 3,
                //   label: 'Store',
                //   icon: Icons.trending_up_rounded,
                // ),
                _buildTabButton(
                  context,
                  index: 2,
                  label: 'Pooja',
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
