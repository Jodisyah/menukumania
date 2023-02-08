import '/Depok/jadwal%20customer/selasa/screen_jadwal.dart';
import '/Depok/jadwal%20customer/senin/screen_jadwal.dart';
import '/TANGSEL/jadwal%20customer/selasa/screen_jadwal.dart';
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
  runApp(searchJadwalSelasaTangsel());
}

class searchJadwalSelasaTangsel extends StatefulWidget {
  //const searchJadwalSelasaTangsel({Key? key}) : super(key: key);

  @override
  State<searchJadwalSelasaTangsel> createState() => _searchJadwalSelasaTangselState();
}

class _searchJadwalSelasaTangselState extends State<searchJadwalSelasaTangsel> {
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

  @override
  Widget build(BuildContext context) {
    CollectionReference customers =
        FirebaseFirestore.instance.collection('add_customers_tangsel_selasa');
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
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: snapshot.data!.docs.map(
                      (customers) {
                        if (nama.isEmpty) {
                          return Center();
                        }
                        if (customers['nama_']
                            .toString()
                            .toLowerCase()
                            .startsWith(nama.toLowerCase())) {
                          return SearchScreenJadwalSelasa_Tangsel(() {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) =>
                            //           DetailCustomersSearch(customers),
                            //     ));
                          }, customers);
                        }
                        if (nama.isEmpty) {
                          return Center();
                        }
                        if (customers['porsi_']
                            .toString()
                            .toLowerCase()
                            .startsWith(nama.toLowerCase()))
                             {
                          return SearchScreenJadwalSelasa_Tangsel(() {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) =>
                            //           DetailCustomersSearch(customers),
                            //     ));
                          }, customers);
                        }
                         if (nama.isEmpty) {
                          return Center();
                        }
                        if (customers['rute_']
                            .toString()
                            .toLowerCase()
                            .startsWith(nama.toLowerCase()))
                             {
                          return SearchScreenJadwalSelasa_Tangsel(() {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) =>
                            //           DetailCustomersSearch(customers),
                            //     ));
                          }, customers);
                        }
                        return Container();
                      },
                    ).toList(),
                  );
          },
        ),
      ),
    );
  }
}
