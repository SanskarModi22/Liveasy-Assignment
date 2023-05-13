import 'package:flutter/material.dart';
import 'package:liveasy_assignment/widgets/custom_text.dart';

import '../constants/constants.dart';
import '../widgets/custom_dropdown.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> genderItems = [
    'English',
    'Hindi',
  ];

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Constants.galleryImg,
            ),
            const CustomText(
              text: 'Please select your Language',
              fontSize: 20,
              bold: true,
            ),
            SizedBox(
              width: Constants.screenWidth(context) / 2,
              child: const CustomText(
                text: 'You can change language at any time',
                color: Constants.grey,
                fontSize: 14,
              ),
            ),
            CustomDropdownButtonFormField(
              items: genderItems,
              selectedValue: selectedValue,
              onChanged: (value) {
                // Do something when changing the item if you want.
              },
              validator: (value) {
                if (value == null) {
                  return 'Please select gender.';
                }
                return null;
              },
              onSaved: (value) {
                selectedValue = value.toString();
              },
            ),
          ],
        ),
      ),
    );
  }
}
