import 'package:flutter/material.dart';
import 'package:punyam/src/app/app.dart';

class Tier1Details extends GetView<PoojaServicesController> {
  final Packagess package;
  final String poojaId;

  const Tier1Details({Key? key, required this.package, required this.poojaId});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.orangeColor),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "${package.tier?.tierName}",
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
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 170,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 13,
                                  width: 13,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.orangeColor),
                                  child: Icon(
                                    Icons.check,
                                    size: 10,
                                    color: AppColors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Expanded(
                                  child: Text(
                                    "Link for Recorded Video or Live Streaming of Pitra Dosh Nivaran Poooja and Tarpan pooja in Gaya.",
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  if (package.tier?.poojaItemsIncluded == true)
                    isThisIncluded(title: "Pooja items included"),
                  SizedBox(
                    height: 6,
                  ),
                  if (package.tier?.postPoojaCleanUpIncluded == true)
                    isThisIncluded(title: "Pooja Cleanup included"),
                  SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 15,
                          color: AppColors.orangeColor,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                            "Pandit ji experience: ${package.tier?.minPanditExperience} - ${package.tier?.maxPanditExperience} "),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 15,
                          color: AppColors.orangeColor,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                            "Total number of main pandit: ${package.tier?.numberOfMainPandit}"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 15,
                          color: AppColors.orangeColor,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                            "Total number of assistant pandit: ${package.tier?.numberOfAssistantPandit}"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: Column(children: [
                      Container(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.keyboard_double_arrow_down_sharp,
                          size: 20,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.cinnamonStickColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        child: Text("Book Pooja"),
                        onPressed: () {
                          controller.getindividualPoojaByIdDetails(poojaId);
                          Packagess pakagedetail =
                              Packagess(price: package.price);
                          Tiers selectedTier = Tiers(
                            sId: package.tier?.sId,
                            tierName: package.tier?.tierName,
                            poojaItemsIncluded:
                                package.tier?.poojaItemsIncluded,
                            postPoojaCleanUpIncluded:
                                package.tier?.postPoojaCleanUpIncluded,
                            minPanditExperience:
                                package.tier?.minPanditExperience,
                            maxPanditExperience:
                                package.tier?.maxPanditExperience,
                            numberOfMainPandit:
                                package.tier?.numberOfAssistantPandit,
                            numberOfAssistantPandit:
                                package.tier?.numberOfAssistantPandit,
                          );
                          Get.to(() => SelectedTierDetailsView(
                                tierDetails: selectedTier,
                                packageDetails: pakagedetail,
                              ));
                        },
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget isThisIncluded({required String title}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: Row(
      children: [
        Container(
          height: 13,
          width: 13,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: AppColors.orangeColor),
          child: Icon(
            Icons.check,
            size: 10,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          width: 6,
        ),
        Expanded(
          child: Text(
            "$title",
            softWrap: true,
          ),
        ),
      ],
    ),
  );
}
