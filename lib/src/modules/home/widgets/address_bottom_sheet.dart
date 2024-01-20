import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:punyam/src/app/app.dart';
import 'package:punyam/src/core/core.dart';
import 'package:punyam/src/core/widgets/common_text_field_for_signin.dart';

class AddressBottomSheet extends StatefulWidget {
  AddressBottomSheet({Key? key}) : super(key: key);

  @override
  _AddressBottomSheetState createState() => _AddressBottomSheetState();
}

class _AddressBottomSheetState extends State<AddressBottomSheet> {
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<HomeController>();
    controller.loadData();
    controller.clearDataField();
    updateStateBasedOnCity(controller.selectedCity);
    controller.selectedState =
        controller.selectedState.isNotEmpty ? controller.selectedState : '';
  }

  void updateStateBasedOnCity(String city) {
    switch (city) {
      case "Noida":
        controller.selectedState = "Uttar Pradesh";
        break;
      case "Delhi":
        controller.selectedState = "Delhi";
        break;
      case "Gurgaon":
        controller.selectedState = "Haryana";
        break;
      default:
        controller.selectedState = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Enter Complete Address',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            Divider(),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Save address as *",
                        style: AppStyles.tsGreyRegular14,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: CommonTextFieldForSingIn(
                      hintText: 'Address type eg-home/office',
                      keyboardType: TextInputType.name,
                      controller: controller.homeTagTextController,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: CommonTextFieldForSingIn(
                      hintText: 'Name*',
                      keyboardType: TextInputType.name,
                      controller: controller.homeNameTextController,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: CommonTextFieldForSingIn(
                      hintText: 'Contact no*',
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: controller.homeContactNoTextController,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: CommonTextFieldForSingIn(
                            hintText: 'Flat / House no* ',
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            controller: controller.homehouseNoTextController,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: CommonTextFieldForSingIn(
                            hintText: 'Floor no',
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            controller: controller.homefloorNoTextController,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: CommonTextFieldForSingIn(
                      hintText: 'Locality*',
                      keyboardType: TextInputType.name,
                      controller: controller.homelocalityTextController,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: CommonTextFieldForSingIn(
                            hintText: 'Nearby landmark',
                            keyboardType: TextInputType.name,
                            controller: controller.homelandmarkTextController,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: CommonTextFieldForSingIn(
                            hintText: 'Pin code*',
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            controller: controller.homePinCodeTextController,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField2<String>(
                          value: controller.selectedCity,
                          onChanged: (String? newValue) {
                            setState(() {
                              controller.selectedCity = newValue.toString();
                              updateStateBasedOnCity(newValue.toString());
                            });
                          },
                          items: <String>[
                            'Noida',
                            'Delhi',
                            'Gurgaon'
                          ] // Add an empty string as the default value
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(
                                      0.5), // Adjust the opacity and color
                                  spreadRadius: 4,
                                  blurRadius:
                                      10, // Increase the blur radius if needed
                                  offset: Offset(0,
                                      2), // Adjust the offset to control the shadow direction
                                ),
                              ],
                            ),
                          ),
                          menuItemStyleData: MenuItemStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.all(16).copyWith(left: 0),
                            filled: true,
                            fillColor: AppColors.white.withOpacity(.1),
                            hintText: 'Select City',
                            hintStyle: AppStyles.tsGreyRegular14,
                            errorStyle: AppStyles.tsGreyRegular12.copyWith(
                              color: AppColors.danger.shade700,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                width: 2,
                                color: AppColors.orangeColor,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                width: 2,
                                color: AppColors.danger,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: CommonTextFieldForSingIn(
                            hintText: 'State',
                            controller: TextEditingController(
                                text: controller.selectedState),
                            isDisabled: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CommonOutlinedButton(
                    onPressed: () async {
                      if (_areMandatoryFieldsFilled()) {
                        await controller.saveUserAddress();
                        await controller.getUserSaveAddressDetails();
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      } else {
                        SnackbarHelper.showSnackbar(
                            "Please fill mandatory fields.");
                      }
                    },
                    label: 'Save Address',
                    backgroundColor: AppColors.cinnamonStickColor,
                    labelColor: AppColors.cinnamonStickColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _areMandatoryFieldsFilled() {
    return controller.homeNameTextController.text.isNotEmpty &&
        controller.homeContactNoTextController.text.isNotEmpty &&
        controller.homehouseNoTextController.text.isNotEmpty &&
        controller.homelocalityTextController.text.isNotEmpty &&
        controller.homePinCodeTextController.text.isNotEmpty;
  }
}
