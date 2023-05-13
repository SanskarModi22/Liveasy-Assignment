import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/custom_text.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  TextEditingController mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            size: 30,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Constants.screenHeight(context) / 7,
          ),
          const Padding(
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            child: CustomText(
              text: 'Please enter your mobile number',
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
                text: 'You\'ll receive a 4 digit code to verify next',
                color: Constants.grey,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            child: Container(
              // height: 100,
              width: Constants.screenWidth(context) / 1.4,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      Constants.indiaFlag,
                    ),
                    const CustomText(
                      text: '+91',
                      bold: true,
                    ),
                    const CustomText(
                      text: '-',
                    ),
                    SizedBox(
                      width: 170,
                      child: TextField(
                        controller: mobileController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Mobile Number',
                            hintStyle: TextStyle(
                              color: Constants.grey,
                            )),
                      ),
                    )
                  ]),
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
          Expanded(
            child: Container(),
          ),
          Image.asset(
            Constants.page3Vector,
            width:
                Constants.screenWidth(context), // Replace with your image path
            fit: BoxFit.cover, // Adjust the BoxFit based on your needs
          ),
        ],
      ),
    );
  }
}
