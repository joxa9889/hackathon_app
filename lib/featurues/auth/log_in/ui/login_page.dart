import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/core/widgets/green_button.dart';
import 'package:hackathon_app/core/widgets/input_widget.dart';
import 'package:hackathon_app/featurues/auth/log_in/bloc/login_bloc.dart';
import 'package:hackathon_app/featurues/home/home_root.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final logInBloc = LoginBloc();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/imgs/login.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.23),
            child: Container(
              padding: const EdgeInsets.only(right: 25, left: 25),
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
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 29,
                          fontFamily: 'Poppins',
                          color: Color.fromARGB(255, 84, 155, 88),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Please Sign In to continue',
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
                      const SizedBox(height: 30),
                      BlocConsumer<LoginBloc, LoginState>(
                        bloc: logInBloc,
                        listener: (context, state) {
                          if (state is LogInSuccessState) {
                            Get.to(() => const HomePageRoot());
                          }
                          if (state is LogInErrorState) {
                            Get.snackbar(
                              'Error',
                              'Invalid username or password',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          }
                        },
                        builder: (context, state) {
                          return CustomButton(
                            onPressed: () {
                              logInBloc.add(LogInButtonPressedEvent(
                                email: _usernameController.text,
                                password: _passwordController.text,
                              ));
                            },
                            buttonName: "Log In",
                            buttonColor: const Color.fromARGB(255, 71, 144, 74),
                            isLoading: state is LogInLoadingState,
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Don\'t have an account?',
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
        ],
      ),
    );
  }
}
