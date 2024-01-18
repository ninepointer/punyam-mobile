import 'package:flutter/material.dart';
import 'package:punyam/src/modules/home/views/maps_view.dart';
import '../../../app/app.dart';

class LocationView extends GetView<HomeController> {
  const LocationView({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppConstants.getAppPadding(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Close the menu
                      },
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        size: 40,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.0125,
                    ),
                    Text(
                      "Select a location",
                      style: AppStyles.tsBlackMedium20,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.0225,
              ),
              SafeArea(
                bottom: false,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        color: Theme.of(context).cardColor,
                        padding: const EdgeInsets.all(8).copyWith(
                          top: 0,
                        ),
                        child: CommonTextField(
                          // controller: controller.searchTextController,
                          padding: EdgeInsets.zero,
                          hintText: 'Search for area, street name...',
                          prefixIcon: Icon(Icons.search,
                              size: 30, color: Colors.redAccent),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {},
                            // onPressed: controller.searchTextController.clear,
                          ),
                          // onChanged: controller.searchInstruments,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.0225,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 30,
                            color: Colors.redAccent,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.0150,
                          ),
                          Text(
                            "Use current location",
                            style: AppStyles.tsBlackRegular16.copyWith(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.0050,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 34,
                          ),
                          Expanded(
                            child: Text(
                              "Ganga vihar Colony, Neha Colony, Somnath Nagar, Dausa",
                              style: AppStyles.tsGreyRegular14,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.0250,
                      ),
                      Divider(
                        thickness: 1,
                        color: AppColors.grey.withOpacity(0.3),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.0250,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(()=>MapsScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 30,
                                  color: Colors.redAccent,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.0150,
                                ),
                                Text(
                                  "Add Address",
                                  style: AppStyles.tsBlackRegular16.copyWith(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.0425,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.grey,
                    ),
                  ),
                  Text(
                    "SAVED ADDRESSES",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 2),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.0425,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.home_outlined,
                        size: 30,
                        color: Colors.grey,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Home",
                          style: AppStyles.tsBlackMedium14,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.0125,
                        ),
                        Text(
                          "Ganga vihar Colony, Neha Colony ",
                          style: AppStyles.tsGreyRegular14,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.0125,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showEditMenu(context);
                              },
                              child: Text("Edit"),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.0225,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text("Delete"),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void showEditMenu(BuildContext context) async {
  final RenderBox overlay =
      Overlay.of(context)!.context.findRenderObject() as RenderBox;

  await showMenu(
    context: context,
    position: RelativeRect.fromRect(
      Rect.fromPoints(
        overlay.localToGlobal(Offset.zero),
        overlay.localToGlobal(overlay.size.bottomRight(Offset.zero)),
      ),
      Offset.zero & overlay.size,
    ),
    items: [
      PopupMenuItem(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context); // Close the menu
            // Handle "Edit Some" action
          },
          child: Text("Edit Some"),
        ),
      ),
      PopupMenuItem(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context); // Close the menu
            // Handle "Edit All" action
          },
          child: Text("Edit All"),
        ),
      ),
    ],
  );
}
