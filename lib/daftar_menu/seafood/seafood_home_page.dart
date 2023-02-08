import 'package:MenukuMania/daftar_menu/seafood/seafood_addpage.dart';

import '/daftar_menu/ayam/ayam_screen_home.dart';
import '/daftar_menu/ayam/edit_page.dart';
import '/daftar_menu/ayam/search_screen.dart';
import '/daftar_menu/seafood/edit_page.dart';
import '/daftar_menu/seafood/seafood_screen_home.dart';
import '/daftar_menu/seafood/search_screen.dart';

import '/daftar_menu/ayam/ayam_addpage.dart';
import '/Depok/drawer_depok.dart';
// import '/daftar_menu/drawer.dart';
import '/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class seafoodHomePage extends StatefulWidget {
  const seafoodHomePage({Key? key}) : super(key: key);

  @override
  State<seafoodHomePage> createState() => _seafoodHomePageState();
}

class _seafoodHomePageState extends State<seafoodHomePage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController porsi1Controller = TextEditingController();
  TextEditingController porsi2Controller = TextEditingController();
  TextEditingController porsi3Controller = TextEditingController();
  TextEditingController porsi4Controller = TextEditingController();
  TextEditingController porsi5Controller = TextEditingController();
  TextEditingController porsi6Controller = TextEditingController();

 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 246, 243),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: IconButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => searchSeafood()),
                ),
                icon: const Icon(Icons.search_sharp),
              ),
            ),
          ],
          elevation: 0.0,
          title: Text(
            'Takaran Makanan Seafood',
            style: TextStyle(fontSize: 18),
          ),
          centerTitle: true,
          backgroundColor: kPrimaryColor),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'Buat catatan disini',
            //   style: GoogleFonts.roboto(
            //     color: Colors.white,
            //     fontWeight: FontWeight.bold,
            //     fontSize: 22,
            //   ),
            // ),
            // SizedBox(
            //   height: 20.0,
            // ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Takaran_seafood')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return ListView(
                      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 2),
                      children: snapshot.data!.docs
                          .map((note) => SeafoodScreenHome(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditTakaranSeafood(
                                      docs: note,
                                    ),
                                  ),
                                );
                              }, note))
                          .toList(),
                    );
                  }
                  return const Divider(
                    color: Colors.grey,
                    height: 10,
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  );
                  // Text(
                  //   '',
                  //   style: GoogleFonts.nunito(color: Colors.white),
                  // );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => seafoodAddPage()));
        },
        label: Text('Tambah Makanan'),
        backgroundColor: Color.fromARGB(59, 0, 0, 0),
        elevation: 0,
        icon: Icon(Icons.add),
      ),
    );
  }
}
