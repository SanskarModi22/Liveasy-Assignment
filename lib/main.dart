import 'package:flutter/material.dart';
import 'package:liveasy_assignment/views/profile_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Awesome Credit Card Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: const ProfileScreen(),
    );
  }
}
