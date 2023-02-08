import 'package:cloud_firestore/cloud_firestore.dart';
import '/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditPageResep extends StatefulWidget {
  EditPageResep({
    Key? key,
    required this.docs,
  }) : super(key: key);
  QueryDocumentSnapshot docs;
  @override
  _EditPageResepState createState() => _EditPageResepState();
}

class _EditPageResepState extends State<EditPageResep> {
  TextEditingController? nama_makananController;
  TextEditingController? noteController;
  setDataToTextField(data) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: ListView(
        children: [
          Center(
            child: Container(
              color: kPrimaryColor,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 0),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: kwhite),
                    maxLines: null,
                    textCapitalization: TextCapitalization.characters,
                    controller: nama_makananController = TextEditingController(
                      text: widget.docs['nama'],
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Makanan',
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
                  controller: noteController =
                TextEditingController(text: widget.docs['note']),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '....',
                  ),
                  style: AppStyle.mainTitle,
                ),
        ],
      ),
    );
  }

  updateData() {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("Resep");
    return widget.docs.reference.update(({
      "nama": nama_makananController!.text,
      'note': noteController!.text,
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 246, 243),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Resep")
                // .doc(FirebaseAuth.instance.currentUser!.email)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              var data = snapshot.data;
              if (data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return setDataToTextField(data);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          updateData();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(
            const SnackBar(
              content: Text(
                'Berhasil...!',
              ),
              backgroundColor: Colors.cyan,
              elevation: 10,
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(
                10,
              ),
            ),
          );
          Navigator.of(
            context,
          ).pop();
        },
        child: Icon(Icons.save_as_outlined),
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
