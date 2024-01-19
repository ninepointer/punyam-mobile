import 'package:flutter/material.dart';
import 'package:punyam/src/app/app.dart';
import 'package:flutter_html/flutter_html.dart';

class NearByMandirDetailsAboutWidget extends StatelessWidget {
  final TempleNearByMeList? templeDetails;
  const NearByMandirDetailsAboutWidget({Key? key, this.templeDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
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
