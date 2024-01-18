import 'package:flutter/material.dart';
import 'package:punyam/src/core/core.dart';

class AddressBottomSheet extends StatelessWidget {
  const AddressBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
        children: [
        Text('Enter Complete Address', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20), ),
        Divider(),
        Container(
          child: Column(
            children: [
              CommonTextField(hintText: 'Name'),
              CommonTextField(hintText: 'Contact Number'),
              Divider(),
              CommonTextField(hintText: 'Address'),
              CommonTextField(hintText: 'Pin Code'),
              SizedBox(height: 24,),
              CommonOutlinedButton(label: 'Save Address', backgroundColor: AppColors.cinnamonStickColor, labelColor: AppColors.cinnamonStickColor),
            ],
          ),
        )
      ]),
    );
  }
}

