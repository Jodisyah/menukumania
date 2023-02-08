import 'package:cloud_firestore/cloud_firestore.dart';
import '/Resep/add_page.dart';
import '/Resep/edit_page_resep.dart';
import '/Resep/screen_home_page.dart';
import '/Resep/search_screen.dart';
import '/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResepMenuHome extends StatefulWidget {
  const ResepMenuHome({Key? key}) : super(key: key);

  @override
  State<ResepMenuHome> createState() => _ResepMenuHomeState();
}

class _ResepMenuHomeState extends State<ResepMenuHome> {
  @override
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
                      builder: (BuildContext context) => searchResep()),
                ),
                icon: const Icon(Icons.search_sharp),
              ),
            ),
          ],
          elevation: 0.0,
          title: Text(
            'Resep Makanan',
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
                    .collection('Resep')
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
                          .map((note) => ResepHomePage(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditPageResep(
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
              MaterialPageRoute(builder: (context) => AddPageResep()));
        },
        label: Text('Tambah Makanan'),
        backgroundColor: Color.fromARGB(59, 0, 0, 0),
        elevation: 0,
        icon: Icon(Icons.add),
      ),
    );
  }
}
