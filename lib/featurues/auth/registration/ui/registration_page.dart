import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/core/widgets/date_input.dart';
import 'package:hackathon_app/core/widgets/green_button.dart';
import 'package:hackathon_app/core/widgets/input_widget.dart';
import 'package:hackathon_app/featurues/auth/registration/bloc/registration_bloc.dart';
import 'package:hackathon_app/featurues/preferances/allergies/ui/allergies.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  final registrationBloc = RegistrationBloc();

  // Method to validate all fields
  bool _validateFields() {
    if (_usernameController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _heightController.text.isEmpty ||
        _weightController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "All fields are required!",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image covering the entire screen
          Positioned.fill(
            child: Image.asset(
              'assets/imgs/login.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Colored container with rounded top corners and scrollable content
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.23),
              child: Container(
                padding: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 241, 255, 245),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 213, 251, 231)
                          .withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60 - 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 29,
                            fontFamily: 'Poppins',
                            color: Color.fromARGB(255, 84, 155, 88),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Please Sign Up if you don\'t have an account',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 77, 151, 81),
                          ),
                        ),
                        const SizedBox(height: 25),
                        DefaultInput(
                          controller: _usernameController,
                          inputTitle: 'Username',
                        ),
                        const SizedBox(height: 12),
                        DefaultInput(
                          controller: _passwordController,
                          inputTitle: 'Password',
                          isPassword: true,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Flexible(
                              child: DefaultInput(
                                controller: _heightController,
                                inputTitle: 'Height',
                                isFloat: true,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Flexible(
                              child: DefaultInput(
                                controller: _weightController,
                                inputTitle: 'Weight',
                                isFloat: true,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        CustomDateInput(
                          controller: _birthDateController,
                          inputTitle: 'Birth Date',
                        ),
                        const SizedBox(height: 30),
                        BlocConsumer<RegistrationBloc, RegistrationState>(
                          bloc: registrationBloc,
                          listener: (context, state) {
                            if (state is RegistrationSuccessState) {
                              Get.to(() => const AllergySelectPage());
                            }
                            if (state is RegistrationErrorState) {
                              Get.snackbar(
                                "Error",
                                state.errorMessage,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            }
                          },
                          builder: (context, state) {
                            return CustomButton(
                              onPressed: () {
                                if (_validateFields()) {
                                  registrationBloc.add(
                                    RegistrationButtonClickedEvent(sendData: {
                                      "username": _usernameController.text,
                                      "password": _passwordController.text,
                                      "weight": _weightController.text,
                                      "height": _heightController.text,
                                      "birth_date": _birthDateController.text
                                    }),
                                  );
                                }
                              },
                              buttonName: "Sign Up",
                              buttonColor:
                                  const Color.fromARGB(255, 71, 144, 74),
                              isLoading: state is RegistrationLoadingState,
                            );
                          },
                        ),
                        const SizedBox(height: 15),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 77, 151, 81),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
