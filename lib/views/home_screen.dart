import 'package:flutter/material.dart';
import 'package:liveasy_assignment/widgets/custom_text.dart';
import 'package:routemaster/routemaster.dart';

import '../constants/constants.dart';
import '../widgets/custom_dropdown.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToMobileScreen(BuildContext context) {
    Routemaster.of(context).push('/mobileScreen');
  }

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
            SizedBox(
              height: Constants.screenHeight(context) / 4.5,
            ),
            Image.asset(
              Constants.galleryImg,
              width: 90,
              height: 60,
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: CustomText(
                text: 'Please select your Language',
                fontSize: 20,
                bold: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              child: SizedBox(
                width: Constants.screenWidth(context) / 2,
                child: const CustomText(
                  text: 'You can change language at any time',
                  color: Constants.grey,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              child: SizedBox(
                width: Constants.screenWidth(context) / 1.5,
                child: CustomDropdownButtonFormField(
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
              ),
            ),
            ElevatedButton(
              onPressed: () {
                navigateToMobileScreen(context);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Constants.blue, // Text color of the button
                textStyle: const TextStyle(
                  fontSize: 16,
                ), // Text style of the button's label
                padding: const EdgeInsets.symmetric(
                  horizontal: 110,
                  vertical: 20,
                ), // Padding around the button's label
                shape: const RoundedRectangleBorder(
                    // Border radius of the button
                    ),
              ),
              child: const CustomText(
                text: 'NEXT',
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Image.asset(
              Constants.page1Vector,
              width: Constants.screenWidth(
                  context), // Replace with your image path
              fit: BoxFit.cover, // Adjust the BoxFit based on your needs
            ),
          ],
        ),
      ),
    );
  }
}
