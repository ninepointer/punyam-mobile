import 'package:flutter/material.dart';
import 'package:punyam/src/app/app.dart';
import 'package:flutter_html/flutter_html.dart';

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
                Html(data: """${templeDetails?.description} """),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
