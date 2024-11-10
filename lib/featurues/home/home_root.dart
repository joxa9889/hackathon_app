import 'package:flutter/material.dart';
import 'package:hackathon_app/featurues/home/main/ui/main_page.dart';
import 'package:hackathon_app/featurues/home/profile/ui/profile_page.dart';

class HomePageRoot extends StatefulWidget {
  const HomePageRoot({super.key});

  @override
  State<HomePageRoot> createState() => _HomePageRootState();
}

class _HomePageRootState extends State<HomePageRoot> {
  int _currentIndex = 0; // Index to track the selected page

  // List of pages to navigate between
  final List<Widget> _pages = [
    const HomePage(),        // Home Page
    const HomePage(),     // Profile Page
    const HomePage(),      // Camera Page
    const HomePage(),   // Favourite Page
    const ProfilePage(),    // Messages Page
  ];

  // Function to handle Bottom Navigation Bar Item taps
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // Update the current index when a bottom nav item is tapped
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Display the page based on selected index
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          currentIndex: _currentIndex, // Keep track of selected index
          onTap: _onItemTapped, // Callback function to handle navigation
          type: BottomNavigationBarType.fixed, // Fixed 
          backgroundColor: const Color.fromARGB(255, 255, 255, 255), // <-- This works for fixed
          selectedItemColor: const Color.fromARGB(255, 133, 204, 129),// Set background color to green// Set color of selected item
          unselectedItemColor: const Color.fromARGB(179, 164, 164, 164), // Set color of unselected items
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
