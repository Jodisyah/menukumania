import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:MenukuMania/Depok/bottom_nav_pages/bottom_nav_controller.dart';
import 'package:MenukuMania/TANGSEL/bottom_nav_pages/bottom_nav_controller.dart';
import 'package:MenukuMania/drawer.dart';
import 'package:MenukuMania/TANGSEL/func_jadwaltangsel.dart';
// import 'package:MenukuMania/Depok/jadwal%20customer/hari_jumat.dart';
// import 'package:MenukuMania/Depok/jadwal%20customer/hari_kamis.dart';
// import 'package:MenukuMania/Depok/jadwal%20customer/hari_rabu.dart';
// import 'package:MenukuMania/Depok/jadwal%20customer/hari_selasa.dart';
// import 'package:MenukuMania/Depok/jadwal%20customer/hari_senin.dart';
import 'package:MenukuMania/theme.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int categoryIndext = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset("assets/batik3.png", width: double.infinity),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 325),
                child: Text(
                  "Selamat Datang Di MENUKU.ID",
                  style: GoogleFonts.poppins(
                      color: kwhite, fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 255),
                child: Text(
                  "Silahkan Pilih Cabang",
                  style: GoogleFonts.poppins(
                      color: kwhite, fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 320, right: 20),
              child: GestureDetector(
                child: Container(
                  // color: kwhite,
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(21, 255, 255, 255),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(
                        8,
                      ),
                      topRight: Radius.circular(
                        8,
                      ),
                      bottomRight: Radius.circular(
                        8,
                      ),
                      bottomLeft: Radius.circular(
                        8,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Depok',
                      style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: kwhite),
                    ),
                  ),
                ),
                onTap: (() =>  Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                BottomNavControllerDepok(),
                                          ),
                                          (route) => false,
                                        )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 420, right: 20),
              child: GestureDetector(
                  child: Container(
                    // color: kwhite,
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(21, 255, 255, 255),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(
                          8,
                        ),
                        topRight: Radius.circular(
                          8,
                        ),
                        bottomRight: Radius.circular(
                          8,
                        ),
                        bottomLeft: Radius.circular(
                          8,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Tanggerang Selatan',
                        style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: kwhite),
                      ),
                    ),
                  ),
                  onTap: (() => Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                BottomNavControllerTangsel(),
                                          ),
                                          (route) => false,
                                        ))),
            ),
          ],
        ),
      ),
    );
  }
}
