import 'package:google_fonts/google_fonts.dart';

import '/Depok/jadwal%20customer/selasa/screen_jadwal.dart';
import '/Depok/jadwal%20customer/senin/screen_jadwal.dart';
import '/theme.dart';
// import '/Depok/detail_customer.dart';
// import '/Depok/home_screen.dart';
import '/Depok/func_jadwalDepok.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(searchJadwalSelasa());
}

class searchJadwalSelasa extends StatefulWidget {
  //const searchJadwalSelasa({Key? key}) : super(key: key);

  @override
  State<searchJadwalSelasa> createState() => _searchJadwalSelasaState();
}

class _searchJadwalSelasaState extends State<searchJadwalSelasa> {
  // String _bayar = 'Lunas';
  String nama = '';
  bool _isShown = true;

  TextEditingController namaController = TextEditingController();
  TextEditingController porsiController = TextEditingController();
  TextEditingController hariController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController mapsController = TextEditingController();
  TextEditingController clearController = TextEditingController();

  //ini tadinya method untuk dropdown status bayar, tapi error
  // void _pilihStatus(String newValue) {
  //   setState(() {
  //     _bayar = newValue;
  //   });
  // }

   Widget widgetSearch(customers, index) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(18, 20, 18, 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(
                              8,
                            ),
                            topRight: Radius.circular(
                              8,
                            ),
                          ),
                        ),
                        // height: 40,
                        // color: Colors.amber,
                        child: Stack(
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 30, right: 30, top: 9, bottom: 5),
                                child: Text(
                                  customers['nama_'],
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: kPrimaryColor,
                              ),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(
                                  8,
                                ),
                                bottomRight: Radius.circular(
                                  8,
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 15, top: 8),
                                  child: Row(children: [
                                    Text(
                                      "Porsi  : ",
                                      style: AppStyle.mainTitleeee,
                                    ),
                                    Expanded(
                                      child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                              customers['porsi_'] + " Porsi",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 19,
                                                  color: kblackcolor,
                                                  fontWeight:
                                                      FontWeight.w600))),
                                    ),
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 11, right: 15, top: 0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Rute  :  ",
                                        style: AppStyle.mainTitleeee,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 6),
                                          child: Text(customers['rute_'],
                                              style: AppStyle.mainTitleeee),
                                        ),
                                      ),
                                      // Text('${index + 1}' + '.',
                                      //     style: GoogleFonts.poppins(
                                      //         fontSize: 18,
                                      //         fontWeight: FontWeight.w500,
                                      //         color: kblackcolor)),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 4, bottom: 10),
                                      child: Text(
                                        "Note  : ",
                                        style: AppStyle.mainTitleeee,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 4,
                                            right: 15,
                                            bottom: 7,
                                            left: 10),
                                        child: Text(
                                          customers['note_'],
                                          // overflow: TextOverflow.ellipsis,
                                          style: AppStyle.mainTitleeee,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference customers =
        FirebaseFirestore.instance.collection('add_customers_selasa');
    // FirebaseFirestore.instance
    //     .collection("add_customers_senin")
    //     .doc('menuku.depok@gmail.com')
    //     // untuk ambil data sesuai auth //
    //     // .doc(FirebaseAuth.instance
    //     //     .currentUser!.email)
    //     .collection("customers2")
    //     .where('nama_')
    //     .get();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0,
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                autofocus: true,
                controller: clearController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {
                      clearController.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
                onChanged: (val) {
                  setState(
                    () {
                      nama = val;
                    },
                  );
                },
              ),
            ),
          )

          // Card(
          //   child: TextField(
          //     decoration: InputDecoration(
          //         prefixIcon: Icon(Icons.search), hintText: 'Search...'),
          //     onChanged: (val) {
          //       setState(() {
          //         nama = val;
          //       });
          //     },
          //   ),
          // ),
          ),
      body: Center(
        child: StreamBuilder(
          stream: customers.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (_, index) {
                      var customers = snapshot.data!.docs[index].data()
                          as Map<String, dynamic>;
                          if (nama.isEmpty) {
                          return Center();
                        }
                      if (customers['nama_']
                          .toString()
                          .toLowerCase()
                          .startsWith(nama.toLowerCase())) {
                        return widgetSearch(customers, index);
                      }
                      if (nama.isEmpty) {
                          return Center();
                        }
                      if (customers['rute_']
                          .toString()
                          .toLowerCase()
                          .startsWith(nama.toLowerCase())) {
                        return widgetSearch(customers, index);
                      }
                      if (nama.isEmpty) {
                          return Center();
                        }
                      if (customers['porsi_']
                          .toString()
                          .toLowerCase()
                          .startsWith(nama.toLowerCase())) {
                        return widgetSearch(customers, index);
                      }
                      return Container();
                    });
            // : ListView(
            //     children: snapshot.data!.docs.map(
            //       (customers) {
            //         if (nama.isEmpty) {
            //           return Center();
            //         }
            //         if (customers['nama_']
            //             .toString()
            //             .toLowerCase()
            //             .startsWith(nama.toLowerCase())) {
            //           return SearchScreenJadwalJumat(() {
            //             // Navigator.push(
            //             //     context,
            //             //     MaterialPageRoute(
            //             //       builder: (context) =>
            //             //           DetailCustomersSearch(customers),
            //             //     ));
            //           }, customers);
            //         }
            //         if (nama.isEmpty) {
            //           return Center();
            //         }
            //         if (customers['porsi_']
            //             .toString()
            //             .toLowerCase()
            //             .startsWith(nama.toLowerCase()))
            //              {
            //           return SearchScreenJadwalJumat(() {
            //             // Navigator.push(
            //             //     context,
            //             //     MaterialPageRoute(
            //             //       builder: (context) =>
            //             //           DetailCustomersSearch(customers),
            //             //     ));
            //           }, customers);
            //         }
            //         if (nama.isEmpty) {
            //           return Center();
            //         }
            //         if (customers['rute_']
            //             .toString()
            //             .toLowerCase()
            //             .startsWith(nama.toLowerCase()))
            //              {
            //           return SearchScreenJadwalJumat(() {
            //             // Navigator.push(
            //             //     context,
            //             //     MaterialPageRoute(
            //             //       builder: (context) =>
            //             //           DetailCustomersSearch(customers),
            //             //     ));
            //           }, customers);
            //         }
            //         return Container();
            //       },
            //     ).toList(),
            //   );
          },
        ),
      ),);}}
