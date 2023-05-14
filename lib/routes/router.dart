import 'package:flutter/material.dart';
import 'package:liveasy_assignment/views/otp_screen.dart';
import 'package:liveasy_assignment/views/profile_screen.dart';
import 'package:routemaster/routemaster.dart';

import '../views/home_screen.dart';
import '../views/mobile_screen.dart';

final routes = RouteMap(
  routes: {
    '/': (route) => const MaterialPage(
          child: HomeScreen(
              // name: route.pathParameters['name']!,
              ),
        ),
    '/profileScreen': (_) => const MaterialPage(child: ProfileScreen()),
    '/mobileScreen': (_) => const MaterialPage(
          child: MobileScreen(
              // mobile: routeData.pathParameters['mobile']!,
              ),
        ),
    '/otp/:id': (routeData) => const MaterialPage(
          child: OTPScreen(
              // receivedId: routeData.pathParameters['id']!,
              ),
        ),
  },
);
