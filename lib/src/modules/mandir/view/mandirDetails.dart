import 'package:flutter/material.dart';
import 'package:stoxhero/src/app/app.dart';

class MandirDetailsView extends StatefulWidget {
  const MandirDetailsView({super.key});

  @override
  State<MandirDetailsView> createState() => _MandirDetailsViewState();
}

class _MandirDetailsViewState extends State<MandirDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.templeBackGroundImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: IconButton(
                          iconSize: 20,
                          icon: Icon(Icons.favorite_outline_outlined),
                          onPressed: () => {},
                          color:
                              Colors.black, // Adjust the icon color if needed
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: IconButton(
                          iconSize: 20,
                          icon: Icon(Icons.share),
                          onPressed: () => {},
                          color:
                              Colors.black, // Adjust the icon color if needed
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                mandirDetailsCard(
                  mandirName: "Hanuman Mandir",
                  godName: "Hanuman Ji",
                  morningTime: "6:00AM to 12:00PM",
                  eveningTime: "4:00PM to 9:00PM",
                  address: "11,Karnipura railway crossing,Ajmer",
                )
              ],
            ),
          ),
          DefaultTabController(
            length: 2,
            child: TabBar(
              tabs: [
                Tab(
                  child: Text(
                    'About',
                    style: Theme.of(context).textTheme.tsRegular16,
                    textAlign: TextAlign.center,
                  ),
                ),
                Tab(
                  child: Text(
                    'Photos',
                    style: Theme.of(context).textTheme.tsRegular16,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            //   TabBarView(
            //   children: [
            //     MandirDetailsAboutWidget(),
            //     MandirDetailsPhtosWidget(),
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}

Widget mandirDetailsCard({
  required String mandirName,
  required String godName,
  required String morningTime,
  required String eveningTime,
  required String address,
}) {
  return Container(
    child: CommonCard(
      color: AppColors.white,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(mandirName, style: AppStyles.tsBlackMedium20),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$morningTime     |",
                style: AppStyles.tsBlackMedium12,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                "$eveningTime",
                style: AppStyles.tsBlackMedium12,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$address",
                style: AppStyles.tsBlackMedium12,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                godName,
                style: AppStyles.tsBlackMedium14
                    .copyWith(color: AppColors.cinnamonStickColor),
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
            MaterialButton(
              onPressed: () {},
              child: Icon(
                Icons.directions_outlined,
                color: AppColors.cinnamonStickColor,
              ),
              height: 30,
              padding: EdgeInsets.zero,
            )
          ],
        )
      ],
    ),
  );
}
