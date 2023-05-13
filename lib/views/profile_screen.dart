import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/custom_text.dart';

enum Gender { male, female }

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Gender? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              bottom: 20,
            ),
            child: CustomText(
              text: 'Please select your profile',
              fontSize: 20,
              bold: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: Constants.screenWidth(context) / 1.1,
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 2,
                      color: Colors.black,
                    )),
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(Constants.shipperImg),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              CustomText(
                                text: 'Shipper',
                                bold: true,
                              ),
                              SizedBox(
                                width: 200,
                                child: CustomText(
                                  text:
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing',
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      leading: Radio<Gender>(
                        value: Gender.male,
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: Constants.screenWidth(context) / 1.1,
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 2,
                      color: Colors.black,
                    )),
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(Constants.transporterImg),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              CustomText(
                                text: 'Transporter',
                                bold: true,
                              ),
                              SizedBox(
                                width: 200,
                                child: CustomText(
                                  text:
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing',
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      leading: Radio<Gender>(
                        value: Gender.female,
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle button press
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
              text: 'CONTINUE',
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
