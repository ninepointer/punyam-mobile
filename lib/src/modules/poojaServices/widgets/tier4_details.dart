import 'package:flutter/material.dart';
import 'package:punyam/src/app/app.dart';

class Tier4Details extends StatelessWidget {
  const Tier4Details({Key? key});

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
                      "Griha Pravesh ",
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
                    height: 300,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      itemCount: 5,
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
                              height: 18,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40,
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
                        child: Text("PARTICIPATE"),
                        onPressed: () {
                          Get.to(() => SelectedTierDetailsView());
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
