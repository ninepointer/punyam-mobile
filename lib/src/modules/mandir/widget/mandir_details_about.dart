import 'package:flutter/material.dart';
import 'package:punyam/src/app/app.dart';

class MandirDetailsAboutWidget extends StatelessWidget {
  final AllMandirData? templeDetails;
  const MandirDetailsAboutWidget({Key? key, this.templeDetails})
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
