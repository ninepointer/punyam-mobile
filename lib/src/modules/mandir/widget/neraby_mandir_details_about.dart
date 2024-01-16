import 'package:flutter/material.dart';
import 'package:punyam/src/app/app.dart';

class NearByMandirDetailsAboutWidget extends StatelessWidget {
  final TempleNearByMeList? templeDetails;
  const NearByMandirDetailsAboutWidget({Key? key, this.templeDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppConstants.getAppPadding(context),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Text(
                    "${templeDetails?.description}",
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
