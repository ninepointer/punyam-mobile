import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:punyam/src/core/widgets/common_text_field_for_signin.dart';
import '../../../app/app.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  late PoojaServicesController controller;

  @override
  void initState() {
    controller = Get.find<PoojaServicesController>();
    super.initState();
    controller.addressTextController.clear();
    controller.mobileNumberTextController.clear();
    controller.bookingDateTextController.clear();
    controller.fullNameTextController.clear();
    controller.addressTextController.clear();
    controller.pinCodeTextController.clear();
    controller.selectedCity = "Noida";
    controller.selectedState = "Utter Pradesh";
    // Set the default state based on the default city
    controller.updateStateBasedOnCity(controller.selectedCity);
    controller.selectedState =
        controller.selectedState.isNotEmpty ? controller.selectedState : '';
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.isProfileLoadingStatus,
        child: ListViewShimmer(
          itemCount: 8,
          shimmerCard: SmallCardShimmer(),
        ),
        replacement: Container(
          color: Theme.of(context).cardColor,
          margin: EdgeInsets.only(top: 4),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    hintText: 'Enter Your Full Name',
                    keyboardType: TextInputType.name,
                    controller: controller.fullNameTextController,
                  ),
                ),
                SizedBox(height: 12),
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
                    hintText: 'Enter Your Mobile Number',
                    controller: controller.mobileNumberTextController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                SizedBox(height: 12),
                GestureDetector(
                  onTap: () => controller.showDateTimePicker(context),
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
                      isDisabled: true,
                      padding: EdgeInsets.zero,
                      controller: controller.bookingDateTextController,
                      hintText: 'Choose Your Booking Date',
                      suffixIcon: Icon(
                        Icons.calendar_month,
                        color: AppColors.grey,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter booking date and time';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 12),
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
                    hintText: 'Enter Your Address',
                    keyboardType: TextInputType.name,
                    controller: controller.addressTextController,
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
                    hintText: 'Pin Code',
                    keyboardType: TextInputType.number,
                    controller: controller.pinCodeTextController,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                DropdownButtonFormField2<String>(
                  value: controller.selectedCity,
                  onChanged: (String? newValue) {
                    setState(() {
                      controller.selectedCity = newValue.toString();
                      controller.updateStateBasedOnCity(newValue.toString());
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
                          color: Colors.grey
                              .withOpacity(0.5), // Adjust the opacity and color
                          spreadRadius: 4,
                          blurRadius: 10, // Increase the blur radius if needed
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
                    contentPadding: EdgeInsets.all(16).copyWith(left: 0),
                    filled: true,
                    fillColor: AppColors.white.withOpacity(.1),
                    hintText: 'Quantity',
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
                        color: AppColors.cinnamonStickColor,
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
                SizedBox(height: 8),
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
                    hintText: 'State',
                    controller:
                        TextEditingController(text: controller.selectedState),
                    isDisabled: true,
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
