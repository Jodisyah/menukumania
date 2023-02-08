import 'package:MenukuMania/TANGSEL/jadwal%20customer/senin/filter_porsi/porsi_1.dart';
import 'package:MenukuMania/TANGSEL/jadwal%20customer/senin/filter_porsi/porsi_2.dart';
import 'package:MenukuMania/TANGSEL/jadwal%20customer/senin/filter_porsi/porsi_3.dart';
import 'package:MenukuMania/TANGSEL/jadwal%20customer/senin/filter_porsi/porsi_4.dart';
import 'package:MenukuMania/TANGSEL/jadwal%20customer/senin/filter_porsi/porsi_5.dart';
import 'package:MenukuMania/TANGSEL/jadwal%20customer/senin/filter_porsi/porsi_6.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/TANGSEL/func_jadwaltangsel.dart';
import '/TANGSEL/jadwal%20customer/senin/search_jadwal_senin.dart';
import '/theme.dart';
import '/Depok/func_jadwalDepok.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:e_commerce/widgets/fetchproducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HariSeninTangsel extends StatefulWidget {
  @override
  _HariSeninTangselState createState() => _HariSeninTangselState();
}

class _HariSeninTangselState extends State<HariSeninTangsel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         actions: [Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Row(
            children: [
              IconButton(
                  onPressed: () 
                      => Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) => searchJadwalSeninTangsel()),
                      ),
                  icon: const Icon(Icons.search_sharp),
                ),
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                        child: TextButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Porsi1Tangsel())),
                            child: Text('Porsi 1',
                                style: GoogleFonts.poppins(
                                  color: kblackcolor,
                                )))),
                    PopupMenuItem(
                        child: TextButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Porsi2Tangsel())),
                            child: Text('Porsi 2',
                                style:
                                    GoogleFonts.poppins(color: kblackcolor)))),
                    PopupMenuItem(
                        child: TextButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Porsi3Tangsel())),
                            child: Text('Porsi 3',
                                style:
                                    GoogleFonts.poppins(color: kblackcolor)))),
                    PopupMenuItem(
                        child: TextButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Porsi4Tangsel())),
                            child: Text('Porsi 4',
                                style:
                                    GoogleFonts.poppins(color: kblackcolor)))),
                    PopupMenuItem(
                        child: TextButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Porsi5Tangsel())),
                            child: Text('Porsi 5',
                                style:
                                    GoogleFonts.poppins(color: kblackcolor)))),
                    PopupMenuItem(
                        child: TextButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Porsi6Tangsel())),
                            child: Text('Porsi 6',
                                style:
                                    GoogleFonts.poppins(color: kblackcolor)))),
                  ],
                  splashRadius: 25,
                  icon: Icon(Icons.filter_list_sharp),
                ),
            ],
          ),
        ),],
          title: Text(
            'Senin',
            style: GoogleFonts.poppins(
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: kPrimaryColor,
          ),
      body: SafeArea(
        child: StreamBuilder<Object>(
          stream: null,
          builder: (context, snapshot) {
            return JadwalCateringTangsel("add_customers_tangsel_senin");
          }
        ),
      ),
    );
  }
}
