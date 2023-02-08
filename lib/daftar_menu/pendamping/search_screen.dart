
import '/daftar_menu/ayam/edit_page.dart';
import '/daftar_menu/pendamping/edit_page.dart';
import '/daftar_menu/pendamping/pendamping_screen_home.dart';
import '/theme.dart';

import '/Depok/func_jadwalDepok.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(searchPendamping());
}

class searchPendamping extends StatefulWidget {
  //const searchPendamping({Key? key}) : super(key: key);

  @override
  State<searchPendamping> createState() => _searchPendampingState();
}

class _searchPendampingState extends State<searchPendamping> {
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
        FirebaseFirestore.instance.collection('Takaran_pendamping');
    FirebaseFirestore.instance.collection('Takaran_pendamping').where('nama').get();

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
                        if (customers['nama']
                            .toString()
                            .toLowerCase()
                            .startsWith(nama.toLowerCase()))
                             {
                          return 
                          PendampingScreenHome((){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditTakaranPendamping(docs: customers,),
                                ));
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
