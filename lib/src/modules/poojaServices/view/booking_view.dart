import 'package:flutter/material.dart';
import 'package:stoxhero/src/app/app.dart';

class BookingView extends StatefulWidget {
  const BookingView({Key? key}) : super(key: key);

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    print("inside desc ${MediaQuery.of(context).size.width}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: AppConstants.getAppPadding(context),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Griha Pravesh",
                            style: AppStyles.tsBlackMedium20,
                            softWrap: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        AppImages.homepuja,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "About Pooja",
                        style: AppStyles.tsBlackMedium24
                            .copyWith(color: AppColors.brandYellow),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dignissim massa ac urna vestibulum, a aliquam mi tincidunt. Integer non tincidunt urna. Curabitur nec volutpat tortor. Proin non fermentum erat. Ut lacinia sit amet arcu a ullamcorper. Curabitur luctus nec ligula id varius. Nulla facilisi. Aliquam vitae ipsum a mi semper finibus. Morbi eu justo vel risus efficitur dapibus in vitae purus.In hac habitasse platea dictumst. Suspendisse vel mi vel quam tincidunt aliquet a nec lacus. Sed efficitur, sem a pellentesque volutpat, orci nulla efficitur elit, ut auctor justo erat vitae erat. Nulla facilisi. Suspendisse potenti. Maecenas ac scelerisque urna. Fusce eget nisi eu lacus congue pulvinar at vel turpis.Vivamus ut fermentum justo. Sed vel mauris a tellus consequat scelerisque eu eget purus. Curabitur ac hendrerit lectus. Nulla facilisi. Quisque vel tortor id tortor volutpat malesuada. Sed tincidunt enim in augue venenatis, id rhoncus purus varius. Fusce vel vulputate orci. Nam vehicula, elit sit amet aliquet hendrerit, urna mi aliquam lacus, et efficitur lacus quam vel sapien.Pellentesque ultrices turpis non bibendum eleifend. Nulla facilisi. Nullam lacinia urna sit amet lacus vestibulum, a imperdiet metus malesuada. Morbi id lacus vel purus semper tristique eu ac sem. Etiam vel purus vitae ante luctus venenatis. Sed sit amet dui orci. Nullam eget turpis a velit posuere auctor. Duis consectetur eleifend turpis, vel scelerisque elit vulputate id. Ut vel felis et urna euismod pellentesque. Suspendisse potenti. Integer ut quam sit amet risus tincidunt commodo in ut nisl.Aenean nec mi non elit auctor dignissim vel id elit. In hac habitasse platea dictumst. Ut bibendum massa ac est pharetra eleifend. Quisque sollicitudin malesuada hendrerit. Nulla facilisi. Integer ut justo vel orci ullamcorper fringilla. Morbi malesuada, lacus vel suscipit ultricies, quam erat vulputate lectus, vel varius purus mauris ut ex. Integer ac scelerisque purus."),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width -
                              MediaQuery.of(context).size.width / 5,
                          child: imageGallery(
                            image: AppImages.homepuja,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width -
                              MediaQuery.of(context).size.width / 5,
                          child: imageGallery(
                            image: AppImages.homepuja,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Benefits",
                        style: AppStyles.tsBlackMedium24
                            .copyWith(color: AppColors.brandYellow),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection:
                        Axis.horizontal, // Allowing horizontal scrolling
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width -
                              MediaQuery.of(context).size.width / 5,
                          child: benfitCard(
                              title: "Peace and Freedom from\nWorries",
                              details:
                                  "Pitru Pooja an Amavasya relieves all family members from worries. In life, problems get resolved, and spiritual wealth, material wealth, and happiness increase."),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width -
                              MediaQuery.of(context).size.width / 5,
                          child: benfitCard(
                              title: "Peace and Freedom from\nWorries",
                              details:
                                  "Pitru Pooja an Amavasya relieves all family members from worries. In life, problems get resolved, and spiritual wealth, material wealth, and happiness increase."),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TierWisePaymentDetails(key: tierWiseKey),
                  SizedBox(
                    height: 112,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 80,
        color: AppColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.chiveColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Text("Need Help?"),
              onPressed: () {
                // Handle the button press
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                backgroundColor: MaterialStateProperty.all<Color>(
                    AppColors.cinnamonStickColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Text("View packages"),
              onPressed: () {
                if (tierWiseKey.currentContext != null) {
                  Scrollable.ensureVisible(
                    tierWiseKey.currentContext!,
                    curve: Curves.easeOut,
                    duration: Duration(milliseconds: 300),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget imageGallery({required String image}) {
  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    child: Container(
      height: 220,
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget benfitCard({
  required title,
  required details,
}) {
  return Container(
    height: 250,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(AppImages.templeBackGroundImage),
        fit: BoxFit.fill,
      ),
      color: AppColors.orangeColor,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppStyles.tsBlackMedium20.copyWith(
                    color: AppColors.cinnamonStickColor,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              child: Text(
                details,
                softWrap: true,
                textAlign: TextAlign.center,
                style: AppStyles.tsBlackRegular12.copyWith(
                  color: AppColors.cinnamonStickColor,
                ),
              ),
            ),
          ],
        )),
  );
}
