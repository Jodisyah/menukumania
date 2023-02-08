import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:MenukuMania/Depok/jadwal%20customer/jumat/hari_jumat.dart';
import 'package:MenukuMania/Depok/jadwal%20customer/kamis/hari_kamis.dart';
import 'package:MenukuMania/Depok/jadwal%20customer/rabu/hari_rabu.dart';
import 'package:MenukuMania/Depok/jadwal%20customer/selasa/hari_selasa.dart';
import 'package:MenukuMania/Depok/jadwal%20customer/senin/hari_senin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:MenukuMania/Depok/jadwal%20customer/hari_jumat.dart';
// import 'package:MenukuMania/Depok/jadwal%20customer/hari_kamis.dart';
// import 'package:MenukuMania/Depok/jadwal%20customer/hari_rabu.dart';
// import 'package:MenukuMania/Depok/jadwal%20customer/hari_selasa.dart';
// import 'package:MenukuMania/Depok/jadwal%20customer/hari_senin.dart';
import 'package:MenukuMania/TANGSEL/bottom_nav_pages/jadwal.dart';
import 'package:MenukuMania/drawer.dart';
import 'package:MenukuMania/TANGSEL/func_jadwaltangsel.dart';
import 'package:MenukuMania/theme.dart';

class JadwalDepok extends StatelessWidget {
  const JadwalDepok({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference customers =
      FirebaseFirestore.instance.collection('customers2');
  FirebaseFirestore.instance
      .collection('customers2')
      .orderBy('porsi', descending: true)
      .get();
    return Scaffold(backgroundColor: kPrimaryColor,
    // drawer: const MyDrawer(),
      // appBar: AppBar(automaticallyImplyLeading: false,elevation: 0,
      // // actions: [IconButton(onPressed: (() =>Navigator.of(context).push(
      // //         MaterialPageRoute(builder: (BuildContext context) => BottomNavControllerDepok()),
      // //       ) ), icon: Icon(Icons.home))],
      //     title: Text(
      //       'Jadwal Catering',
      //       style: GoogleFonts.poppins(
      //         fontSize: 23,
      //         fontWeight: FontWeight.w500,
      //       ),
      //     ),
      //     backgroundColor: kPrimaryColor,
      //     ),
      body: SafeArea(
        
        child: ListView(
          children: [
            Stack(children: [
              
              Image.asset("assets/back.png", width: double.infinity),
              Padding(
                  padding: const EdgeInsets.only(top: 40,left: 55),
                  child: Text(
                    "Jadwal Catering Depok",
                    style: GoogleFonts.poppins(color: kwhite, fontSize: 24,fontWeight: FontWeight.w500),
                  ),
                ),
              Padding(
                    padding: const EdgeInsets.only(left: 20, top: 120,right: 20),
                    child: GestureDetector(
                      child: Container(
                        // color: kwhite,
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:  Color.fromARGB(13, 255, 255, 255),
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
                            'Senin',
                            style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: kwhite),
                          ),
                        ),
                      ),
                      onTap: (() => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  HariSenin(),
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 230,right: 20),
                    child: GestureDetector(
                        child: Container(
                          // color: kwhite,
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                           color:  Color.fromARGB(13, 255, 255, 255),
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
                              'Selasa',
                              style: GoogleFonts.poppins(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: kwhite),
                            ),
                          ),
                        ),
                        onTap: (() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    HariSelasa(),
                              ),
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 340,right: 20),
                    child: GestureDetector(
                        child: Container(
                          // color: kwhite,
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                           color:  Color.fromARGB(13, 255, 255, 255),
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
                              'Rabu',
                              style: GoogleFonts.poppins(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: kwhite),
                            ),
                          ),
                        ),
                        onTap: (() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    HariRabu(),
                              ),
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 450,right: 20),
                    child: GestureDetector(
                        child: Container(
                          // color: kwhite,
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                          color:  Color.fromARGB(13, 255, 255, 255),
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
                              'Kamis',
                              style: GoogleFonts.poppins(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: kwhite),
                            ),
                          ),
                        ),
                        onTap: (() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    HariKamis(),
                              ),
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 560,right: 20),
                    child: GestureDetector(
                        child: Container(
                          // color: kwhite,
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                          color:  Color.fromARGB(13, 255, 255, 255),
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
                              'Jumat',
                              style: GoogleFonts.poppins(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: kwhite),
                            ),
                          ),
                        ),
                        onTap: (() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    HariJumat(),
                              ),
                            ))),
                  ),
                  //  Padding(
                  //   padding: const EdgeInsets.only(left: 20),
                  //   child: Container(
                  //     color: kwhite,
                  //     height: 70,
                  //     width: 350,
                  //   ),
                  // )
                ],
              ),
          ],
        ),
          // Column(
          //   children: [
          //     Row(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.only(top: 0),
          //           child: Container(
          //             height: 50,
          //             child: Stack(
          //               children: [
          //                 Align(
          //                   child: Container(alignment: Alignment.center,
          //                     // height: 102,
          //                     width: MediaQuery.of(context).size.width,
          //                     decoration: BoxDecoration(
          //                       color: Color.fromARGB(255, 239, 239, 239),
          //                       borderRadius: BorderRadius.circular(0),
          //                     ),
          //                     child: CarouselSlider(
          //                       items: [
          //                         Row(
          //                           mainAxisAlignment: MainAxisAlignment.start,
          //                           children: [
          //                             Padding(
          //                               padding: const EdgeInsets.only(left: 6),
          //                               child: TextButton(
          //                                 onPressed: () => Navigator.push(context,
          //                                     MaterialPageRoute(builder: (context) {
          //                                   return HariSenin();
          //                                 })),
          //                                 child: Container(
          //                                   child: Text(
          //                                     'Senin',
          //                                     style: GoogleFonts.poppins(
          //                                         color: Colors.black,
          //                                         fontSize: 18),
          //                                   ),
          //                                 ),
          //                               ),
          //                             ),
          //                             Padding(
          //                               padding: const EdgeInsets.only(left: 6),
          //                               child: TextButton(
          //                                 onPressed: () => Navigator.push(context,
          //                                     MaterialPageRoute(builder: (context) {
          //                                   return HariSelasa();
          //                                 })),
          //                                 child: Container(
          //                                   child: Text(
          //                                     'Selasa',
          //                                     style: GoogleFonts.poppins(
          //                                         color: Colors.black,
          //                                         fontSize: 18),
          //                                   ),
          //                                 ),
          //                               ),
          //                             ),
          //                             Padding(
          //                               padding: const EdgeInsets.only(left: 6),
          //                               child: TextButton(
          //                                 onPressed: () => Navigator.push(context,
          //                                     MaterialPageRoute(builder: (context) {
          //                                   return HariRabu();
          //                                 })),
          //                                 child: Container(
          //                                   child: Text(
          //                                     'Rabu',
          //                                     style: GoogleFonts.poppins(
          //                                         color: Colors.black,
          //                                         fontSize: 18),
          //                                   ),
          //                                 ),
          //                               ),
          //                             ),
          //                             Padding(
          //                               padding: const EdgeInsets.only(left: 6),
          //                               child: TextButton(
          //                                 onPressed: () => Navigator.push(context,
          //                                     MaterialPageRoute(builder: (context) {
          //                                   return HariKamis();
          //                                 })),
          //                                 child: Container(
          //                                   child: Text(
          //                                     'Kamis',
          //                                     style: GoogleFonts.poppins(
          //                                         color: Colors.black,
          //                                         fontSize: 18),
          //                                   ),
          //                                 ),
          //                               ),
          //                             ),
          //                             Padding(
          //                               padding: const EdgeInsets.only(left: 6),
          //                               child: TextButton(
          //                                 onPressed: () => Navigator.push(context,
          //                                     MaterialPageRoute(builder: (context) {
          //                                   return HariJumat();
          //                                 })),
          //                                 child: Container(
          //                                   child: Text(
          //                                     'Jumat',
          //                                     style: GoogleFonts.poppins(
          //                                         color: Colors.black,
          //                                         fontSize: 18),
          //                                   ),
          //                                 ),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ],
          //                       options: CarouselOptions(
          //                           enableInfiniteScroll: false,
          //                           viewportFraction: 1,
          //                           height: 100,
          //                           onPageChanged: (value, _) {
          //                             setState(() {
          //                               categoryIndext = value;
          //                             });
          //                           }),
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //     SizedBox(
          //       height: 10.0,
          //     ),

          //     // SafeArea(
          //     //   child: Jadwal("add_customers_senin"),
          //     // )
          //     // Expanded(
          //     //   child: StreamBuilder<QuerySnapshot>(
          //     //     stream: FirebaseFirestore.instance
          //     //         .collection('customers').orderBy('nama',descending: false)
          //     //         .snapshots(),
          //     //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //     //       if (snapshot.connectionState == ConnectionState.waiting) {
          //     //         return Center(
          //     //           child: CircularProgressIndicator(),
          //     //         );
          //     //       }
          //     //       if (snapshot.hasData) {
          //     //         return

          //     //         ListView(
          //     //           children: snapshot.data!.docs
          //     //               .map((note) => HomeScreen(() {
          //     //                     Navigator.push(
          //     //                       context,
          //     //                       MaterialPageRoute(
          //     //                         builder: (context) => DetailCustomers(note),
          //     //                       ),
          //     //                     );
          //     //                   }, note))
          //     //               .toList(),
          //     //         );
          //     //       }
          //     //       return Text(
          //     //         'Tidak ada customer',
          //     //       );
          //     //     },
          //     //   ),
          //     // ),
          //   ],
          // ),
        
      ),
      
    );
  }
}
