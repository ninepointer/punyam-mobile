import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../app/app.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({Key? key}) : super(key: key);

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  late PoojaServicesController controller;
  String selectedCity = 'Noida'; // Set the default city
  String selectedState = '';

  @override
  void initState() {
    controller = Get.find<PoojaServicesController>();
    super.initState();
    controller.addressTextController.clear();
    controller.mobileNumberTextController.clear();
    controller.bookingDateTextController.clear();
    controller.fullNameTextController.clear();

    // Set the default state based on the default city
    updateStateBasedOnCity(selectedCity);
    selectedState = selectedState.isNotEmpty ? selectedState : '';
  }

  void updateStateBasedOnCity(String city) {
    switch (city) {
      case "Noida":
        selectedState = "Uttar Pradesh";
        break;
      case "Delhi":
        selectedState = "Delhi";
        break;
      case "Gurgaon":
        selectedState = "Haryana";
        break;
      default:
        selectedState = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.isProfileLoadingStatus,
        child: ListViewShimmer(
          itemCount: 5,
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
                Text(
                  'Name',
                  style: Theme.of(context).textTheme.tsGreyMedium12,
                ),
                SizedBox(height: 8),
                CommonTextField(
                  hintText: 'Enter Your Full Name',
                  keyboardType: TextInputType.name,
                  controller: controller.fullNameTextController,
                  padding: EdgeInsets.only(bottom: 8),
                ),
                Text(
                  'Mobile Number',
                  style: Theme.of(context).textTheme.tsGreyMedium12,
                ),
                SizedBox(height: 8),
                CommonTextField(
                  hintText: 'Enter Your Mobile Number',
                  controller: controller.mobileNumberTextController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  padding: EdgeInsets.only(bottom: 8),
                ),
                Text(
                  'Choose Date and Time',
                  style: Theme.of(context).textTheme.tsGreyMedium12,
                ),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: () => controller.showDateTimePicker(context),
                  child: CommonTextField(
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
                SizedBox(height: 8),
                Text(
                  'Enter your Address',
                  style: Theme.of(context).textTheme.tsGreyMedium12,
                ),
                SizedBox(height: 8),
                CommonTextField(
                  hintText: 'Enter Your Address',
                  keyboardType: TextInputType.name,
                  controller: controller.addressTextController,
                  padding: EdgeInsets.only(bottom: 8),
                ),
                CommonTextField(
                  hintText: 'Pin Code',
                  keyboardType: TextInputType.number,
                  controller: controller.addressTextController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  padding: EdgeInsets.only(bottom: 8),
                ),
                DropdownButtonFormField2<String>(
                  value: selectedCity,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCity = newValue.toString();
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
                    ),
                  ),
                  menuItemStyleData: MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16).copyWith(left: 0),
                    filled: true,
                    fillColor: AppColors.grey.withOpacity(.1),
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
                        color: AppColors.primary,
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
                CommonTextField(
                  hintText: 'State',
                  controller: TextEditingController(text: selectedState),
                  isDisabled: true,
                  padding: EdgeInsets.only(bottom: 8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
