import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hackathon_app/core/widgets/input_widget.dart';
import 'package:hackathon_app/featurues/auth/log_in/repository/auth.dart';
import 'package:hackathon_app/featurues/auth/log_in/ui/login_page.dart';
import 'package:hackathon_app/featurues/auth/selection/ui/selection_rout.dart';
import 'package:hackathon_app/featurues/home/home_root.dart';
import 'package:hackathon_app/featurues/home/main/ui/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Initialize routingPage as a Widget type
  Widget routingPage = const Center(child: CircularProgressIndicator()); 

  @override
  void initState() {
    super.initState();
    checkAuthAndNavigate();
  }

  Future<void> checkAuthAndNavigate() async {
    List<String?> authToken = await Auth.getRA();
    setState(() {
      routingPage = (authToken[0] != null) || (authToken[1] != null)
          ? const HomePageRoot()
          : const RoutingRegistrationPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hackathon App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 84, 189, 88)),
        useMaterial3: true,
      ),
      home: routingPage, // Use the routingPage here
    );
  }
}
