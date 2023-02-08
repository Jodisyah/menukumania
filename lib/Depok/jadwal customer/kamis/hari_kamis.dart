import 'package:MenukuMania/Depok/jadwal%20customer/kamis/filter_porsi/porsi_1.dart';
import 'package:MenukuMania/Depok/jadwal%20customer/kamis/filter_porsi/porsi_2.dart';
import 'package:MenukuMania/Depok/jadwal%20customer/kamis/filter_porsi/porsi_3.dart';
import 'package:MenukuMania/Depok/jadwal%20customer/kamis/filter_porsi/porsi_4.dart';
import 'package:MenukuMania/Depok/jadwal%20customer/kamis/filter_porsi/porsi_5.dart';
import 'package:MenukuMania/Depok/jadwal%20customer/kamis/filter_porsi/porsi_6.dart';

import '/Depok/jadwal%20customer/kamis/search_jadwal_kamis.dart';
import '/theme.dart';
import '/Depok/func_jadwalDepok.dart';
// import 'package:e_commerce/widgets/fetchproducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HariKamis extends StatefulWidget {
  @override
  _HariKamisState createState() => _HariKamisState();
}

class _HariKamisState extends State<HariKamis> {
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
                        MaterialPageRoute(builder: (BuildContext context) => searchJadwalKamis()),
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
                                        Porsi1())),
                            child: Text('Porsi 1',
                                style: GoogleFonts.poppins(
                                  color: kblackcolor,
                                )))),
                    PopupMenuItem(
                        child: TextButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Porsi2())),
                            child: Text('Porsi 2',
                                style:
                                    GoogleFonts.poppins(color: kblackcolor)))),
                    PopupMenuItem(
                        child: TextButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Porsi3())),
                            child: Text('Porsi 3',
                                style:
                                    GoogleFonts.poppins(color: kblackcolor)))),
                    PopupMenuItem(
                        child: TextButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Porsi4())),
                            child: Text('Porsi 4',
                                style:
                                    GoogleFonts.poppins(color: kblackcolor)))),
                    PopupMenuItem(
                        child: TextButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Porsi5())),
                            child: Text('Porsi 5',
                                style:
                                    GoogleFonts.poppins(color: kblackcolor)))),
                    PopupMenuItem(
                        child: TextButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Porsi6())),
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
          'Kamis',
          style: GoogleFonts.poppins(
            fontSize: 23,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: Jadwal("add_customers_kamis"),
      ),
    );
  }
}
