// import 'package:cloud_firestore/cloud_firestore.dart';
// import '/Depok/jadwal%20customer/jumat/edit.dart';
// import '/theme.dart';
// // import '/Depok/edit.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// // import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// Widget SearchScreenJadwalJumat(Function()? ontap, QueryDocumentSnapshot docs,) {
//   List<String> status = ["Lunas", "Belum Lunas"];
//   int NU = 1;
//   int i = 1;



  

  

//   TextEditingController namaController = TextEditingController();
//   TextEditingController porsiController = TextEditingController();
//   TextEditingController hariController = TextEditingController();
//   TextEditingController tanggalController = TextEditingController();
//   TextEditingController noteController = TextEditingController();
//   TextEditingController statusController = TextEditingController();
//   TextEditingController alamatController = TextEditingController();
//   TextEditingController mapsController = TextEditingController();

//   // CollectionReference customers_ =
//   //     FirebaseFirestore.instance.collection('add_customers_senin');
//   // FirebaseFirestore.instance
//   //     .collection('add_customers_senin')
//   //     .orderBy('porsi_', descending: true)
//   //     .get();

//   // bool isliked;
//   CollectionReference customers =
//       FirebaseFirestore.instance.collection("add_customers_jumat");
//   FirebaseFirestore.instance
//       .collection('add_customers_jumat')
//       .orderBy('porsi_', descending: true)
//       .get();

//   return InkWell(
//     onTap: ontap,
//     child: Column(
//       children: [
        
//         Container(
//           child: Padding(
//             padding: EdgeInsets.fromLTRB(18, 20, 18, 20),
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(
//                   10,
//                 ),
//               ),
//               child: Stack(
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           color: kPrimaryColor,
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(
//                               8,
//                             ),
//                             topRight: Radius.circular(
//                               8,
//                             ),
//                           ),
//                         ),
//                         // height: 40,
//                         // color: Colors.amber,
//                         child: Stack(
//                           children: [
//                             Center(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 30, right: 30, top: 9, bottom: 5),
//                                 child: Text(
//                                   docs['nama_'],
//                                   style: GoogleFonts.poppins(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Column(
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(
//                                 color: kPrimaryColor,
//                               ),
//                               borderRadius: const BorderRadius.only(
//                                 bottomLeft: Radius.circular(
//                                   8,
//                                 ),
//                                 bottomRight: Radius.circular(
//                                   8,
//                                 ),
//                               ),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 10, right: 15, top: 8),
//                                   child: Row(children: [
//                                     Text(
//                                       "Porsi  : ",
//                                       style: AppStyle.mainTitleeee,
//                                     ),
//                                     Expanded(
//                                       child: Padding(
//                                         padding:
//                                             const EdgeInsets.only(left: 10),
//                                         child: Text(docs['porsi_'] + " Porsi",
//                                             style: GoogleFonts.poppins(
//                                                 fontSize: 19,
//                                                 color: kblackcolor,
//                                                 fontWeight: FontWeight.w600))
//                                       ),
//                                     ),
//                                   ]),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 11, right: 15, top: 0),
//                                   child: Row(
//                                     children: [
//                                       Text(
//                                         "Rute  :  ",
//                                         style: AppStyle.mainTitleeee,
//                                       ),
//                                       Expanded(
//                                         child: Padding(
//                                           padding:
//                                               const EdgeInsets.only(left: 6),
//                                           child: Text(docs['rute_'],
//                                               style: AppStyle.mainTitleeee),
//                                         ),
//                                       ),
//                                       Text('${NU ++}')
//                                     ],
//                                   ),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 10, top: 4, bottom: 10),
//                                       child: Text(
//                                         "Note  : ",
//                                         style: AppStyle.mainTitleeee,
//                                       ),
//                                     ),
//                                     Expanded(
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(
//                                             top: 4,
//                                             right: 15,
//                                             bottom: 7,
//                                             left: 10),
//                                         child: Text(
//                                           docs['note_'],
//                                           // overflow: TextOverflow.ellipsis,
//                                           style: AppStyle.mainTitleeee,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
                                
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }


