import 'package:flutter/material.dart';

import '../../core/core.dart';

class MandirViewShimmer extends StatelessWidget {
  const MandirViewShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppConstants.getAppPadding(context),
      child: Column(
        children: [
          // Row(
          //   children: [
          //     Expanded(child: SmallCardShimmer()),
          //     SizedBox(width: 8),
          //     Expanded(child: SmallCardShimmer()),
          //     SizedBox(width: 8),
          //     Expanded(child: SmallCardShimmer()),
          //   ],
          // ),

          LargeCardShimmer(),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.0625,
          ),
          CustomCardShimmer(
            height: 50,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.0625,
          ),
          CustomCardShimmer(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.0625,
          ),
          Row(
            children: [
              Expanded(child: CircularCardShimmer()),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.045,
              ),
              Expanded(child: CircularCardShimmer()),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.045,
              ),
              Expanded(child: CircularCardShimmer()),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.045,
              ),
              Expanded(child: CircularCardShimmer()),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.0625,
          ),
          Row(
            children: [
              Expanded(
                  child: CustomCardShimmer(
                width: 40,
              )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.045,
              ),
              Expanded(child: CustomCardShimmer(width: 40)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.045,
              ),
              Expanded(child: CustomCardShimmer(width: 40)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.045,
              ),
              Expanded(child: CustomCardShimmer(width: 40)),
            ],
          ),

          SizedBox(
            height: MediaQuery.of(context).size.width * 0.0625,
          ),
          Row(
            children: [
              Expanded(
                  child: CustomCardShimmer(
                width: MediaQuery.of(context).size.width / 2.31,
                height: 80,
              )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.045,
              ),
              Expanded(
                  child: CustomCardShimmer(
                width: MediaQuery.of(context).size.width / 2.31,
                height: 80,
              )),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.0625,
          ),
          CustomCardShimmer(
            height: 60,
          ),
        ],
      ),
    );
  }
}
