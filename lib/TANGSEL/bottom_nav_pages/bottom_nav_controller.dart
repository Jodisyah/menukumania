import 'package:flutter/material.dart';
import 'package:MenukuMania/Depok/bottom_nav_pages/address.dart';
import 'package:MenukuMania/Depok/bottom_nav_pages/jadwal.dart';
import 'package:MenukuMania/Depok/bottom_nav_pages/profile.dart';
import 'package:MenukuMania/TANGSEL/bottom_nav_pages/address.dart';
import 'package:MenukuMania/TANGSEL/bottom_nav_pages/jadwal.dart';
import 'package:MenukuMania/TANGSEL/bottom_nav_pages/profile.dart';
import 'package:MenukuMania/theme.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:google_fonts/google_fonts.dart';

class BottomNavControllerTangsel extends StatefulWidget {
  const BottomNavControllerTangsel({Key? key}) : super(key: key);

  @override
  State<BottomNavControllerTangsel> createState() =>
      _BottomNavControllerTangselState();
}

class _BottomNavControllerTangselState extends State<BottomNavControllerTangsel> {
  final _pages = [
    AddressTangsel(),
    JadwalTangsel(),
    ProfileTangsel(),
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
