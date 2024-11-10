import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:hackathon_app/core/widgets/green_button.dart';
import 'package:hackathon_app/featurues/auth/log_in/ui/login_page.dart';
import 'package:hackathon_app/featurues/auth/registration/ui/registration_page.dart';

class RoutingRegistrationPage extends StatefulWidget {
  const RoutingRegistrationPage({super.key});

  @override
  State<RoutingRegistrationPage> createState() =>
      _RoutingRegistrationPageState();
}

class _RoutingRegistrationPageState extends State<RoutingRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          Image.asset(
            'assets/imgs/login.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Center(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0, left: 25.0, top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(0, 123, 167, 128).withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 1,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const GlassContainer(
                        width: double.infinity,
                        border: 0,
                        blur: 5,
                        linearGradient: LinearGradient(colors: [
                          Color.fromARGB(30, 197, 197, 197),
                          Color.fromARGB(0, 255, 255, 255),
                        ]),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome!',
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Log In or Register to track your meals, set goals, and stay on top of your healthy journey. Let’s make each day a step closer to a better you!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(), // Pushes content to the bottom
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Centered Row of buttons
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: GlassContainer(
                          border: 0,
                          blur: 5,
                          linearGradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(136, 219, 218, 218),
                              Color.fromARGB(0, 255, 255, 255),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    onPressed: () {
                                      Get.to(() => const RegistrationPage());
                                    },
                                    buttonName: 'Register',
                                    buttonColor:
                                        const Color.fromARGB(255, 57, 136, 61),
                                  ),
                                ),
                                const SizedBox(
                                    width: 10), // Spacing between buttons
                                Expanded(
                                  child: CustomButton(
                                    onPressed: () {
                                      Get.to(() => const LoginPage());
                                    },
                                    buttonName: 'Log In',
                                    buttonColor:
                                        const Color.fromARGB(255, 81, 186, 88),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Space from bottom
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
