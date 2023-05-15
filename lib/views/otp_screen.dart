import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasy_assignment/views/home_screen.dart';
import 'package:liveasy_assignment/views/profile_screen.dart';
import 'package:logger/logger.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:routemaster/routemaster.dart';

import '../constants/constants.dart';
import '../widgets/custom_text.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, this.phoneNo});
  final String? phoneNo;
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

  Logger log = Logger();
  OtpFieldController otpController = OtpFieldController();
  String? otp;
  FirebaseAuth auth = FirebaseAuth.instance;
  String? _verificationCode;

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phoneNo}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          log.e(e.message);
        },
        codeSent: (String? verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: const Duration(seconds: 120));
  }

  void navigateToProfileScreen(BuildContext context) {
    Routemaster.of(context).push('/profileScreen');
  }

  Future<void> verifyOTPCode({String? otpText}) async {
    // log.i(widget.receivedId);
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: _verificationCode!, smsCode: otpText!))
          .then(
        (value) async {
          if (value.user != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.greenAccent[400],
                content: const Text("Successfully Authenticated"),
              ),
            );
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          }
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            // Handle back button press
          },
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
              text: 'Verify Phone',
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
              child: CustomText(
                text: 'Code is sent to ${widget.phoneNo}',
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
              width: 350,
              child: OTPTextField(
                  controller: otpController,
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 45,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 0,
                  style: const TextStyle(fontSize: 17),
                  otpFieldStyle: OtpFieldStyle(
                    backgroundColor: Constants.lightBlue,
                  ),
                  onChanged: (pin) {
                    // print("Changed: $pin");
                  },
                  onCompleted: (pin) {
                    setState(() {
                      otp = pin;
                      log.i(otp);
                    });
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            child: SizedBox(
              width: Constants.screenWidth(context) / 1.2,
              child: Center(
                  child: Row(
                children: [
                  const Text(
                    'Didn\'t  receive the code? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const OTPScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Request Again',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await verifyOTPCode(otpText: otp);
              log.d('Successfully Authenticated');
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Constants.blue, // Text color of the button
              textStyle: const TextStyle(
                fontSize: 16,
              ), // Text style of the button's label
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ), // Padding around the button's label
              shape: const RoundedRectangleBorder(
                  // Border radius of the button
                  ),
            ),
            child: const CustomText(
              text: 'VERIFY AND CONTINUE',
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Expanded(
            child: Image.asset(
              Constants.page3Vector,
              width: Constants.screenWidth(
                  context), // Replace with your image path
              fit: BoxFit.cover, // Adjust the BoxFit based on your needs
            ),
          ),
        ],
      ),
    );
  }
}
