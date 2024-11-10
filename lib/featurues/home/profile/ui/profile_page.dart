import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    'joxa',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: Colors.grey,
              ),
              const Row(
                children: [
                  Expanded(
                    child: Card(child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                      child: Text('Weight: 65', style: TextStyle(fontWeight: FontWeight.w600)),
                    )),
                  ),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                        child: Text('Height: 170', style: TextStyle(fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                      child: const Text('Chest Size: 65', style: TextStyle(fontWeight: FontWeight.w600)),
                    )),
                  ),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                        child: const Text('Waist Size: 170', style: TextStyle(fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                      child: const Text('Hips Size: 65', style: TextStyle(fontWeight: FontWeight.w600)),
                    )),
                  ),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                        child: const Text('BMI: 27', style: TextStyle(fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
