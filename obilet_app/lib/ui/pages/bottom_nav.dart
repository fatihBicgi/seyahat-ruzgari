
import 'package:flutter/material.dart';
import 'package:obilet_app/ui/pages/help_page.dart';
import 'package:obilet_app/ui/pages/home_page.dart';
import 'package:obilet_app/ui/pages/profile_page.dart';
import 'package:obilet_app/ui/pages/search_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int currentIndex = 0;
  var pages = [const HomePage(), const SearchPage(),const HelpPage() , const ProfilePage()];
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black54,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Ara"),
          BottomNavigationBarItem(icon: Icon(Icons.travel_explore),label: "Seyehatlerim"),
          BottomNavigationBarItem(icon: Icon(Icons.help_outline),label: "Yardım"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: "Profilim"),

        ],
      ),
    );
  }
}
