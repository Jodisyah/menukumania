import 'package:flutter/material.dart';
import 'package:MenukuMania/Depok/bottom_nav_pages/address.dart';
import 'package:MenukuMania/Depok/bottom_nav_pages/jadwal.dart';
import 'package:MenukuMania/Depok/bottom_nav_pages/profile.dart';
import 'package:MenukuMania/theme.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:google_fonts/google_fonts.dart';

class BottomNavControllerDepok extends StatefulWidget {
  const BottomNavControllerDepok({Key? key}) : super(key: key);

  @override
  State<BottomNavControllerDepok> createState() =>
      _BottomNavControllerDepokState();
}

class _BottomNavControllerDepokState extends State<BottomNavControllerDepok> {
  final _pages = [
    Address(),
    JadwalDepok(),
    Profile(),
  ];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        selectedItemColor: kPrimaryColor,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        selectedLabelStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Address"),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: "Jadwal"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}
