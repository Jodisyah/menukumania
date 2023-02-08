import 'package:cloud_firestore/cloud_firestore.dart';
import '/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditTakaranDaging extends StatefulWidget {
  EditTakaranDaging({
    Key? key,
    required this.docs,
  }) : super(key: key);
  QueryDocumentSnapshot docs;
  @override
  _EditTakaranDagingState createState() => _EditTakaranDagingState();
}

class _EditTakaranDagingState extends State<EditTakaranDaging> {
  TextEditingController? nama_makananController;
  TextEditingController? porsi1;
  TextEditingController? porsi2;
  TextEditingController? porsi3;
  TextEditingController? porsi4;
  TextEditingController? porsi5;
  TextEditingController? porsi6;
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
          const Text(
            "Porsi 1 :",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.deepOrange),
          ),
          TextField(
            controller: porsi1 =
                TextEditingController(text: widget.docs['porsi1']),
            textCapitalization: TextCapitalization.characters,
          ),
          const SizedBox(height: 20),
          const Text(
            "Porsi 2 :",
            style: TextStyle(color: Colors.deepOrange),
          ),
          TextField(
            controller: porsi2 =
                TextEditingController(text: widget.docs['porsi2']),
            textCapitalization: TextCapitalization.characters,
          ),
          const SizedBox(height: 20),
          const Text(
            "Porsi 3 :",
            style: TextStyle(color: Colors.deepOrange),
          ),
          TextField(
            controller: porsi3 =
                TextEditingController(text: widget.docs['porsi3']),
            textCapitalization: TextCapitalization.characters,
          ),
          const SizedBox(height: 20),
          const Text(
            "Porsi 4 :",
            style: TextStyle(color: Colors.deepOrange),
          ),
          TextField(
            controller: porsi4 =
                TextEditingController(text: widget.docs['porsi4']),
            textCapitalization: TextCapitalization.characters,
          ),
          const SizedBox(height: 20),
          const Text(
            "Porsi 5 :",
            style: TextStyle(color: Colors.deepOrange),
          ),
          TextField(
            controller: porsi5 =
                TextEditingController(text: widget.docs['porsi5']),
            textCapitalization: TextCapitalization.characters,
          ),
          const SizedBox(height: 20),
          const Text(
            "Porsi 6 :",
            style: TextStyle(color: Colors.deepOrange),
          ),
          TextField(
            controller: porsi6 =
                TextEditingController(text: widget.docs['porsi6']),
            textCapitalization: TextCapitalization.characters,
          ),
          const SizedBox(height: 20),
          const Text(
            "Note",
            style: TextStyle(color: Colors.deepOrange),
          ),
          TextField(
            maxLines: 2,
            controller: noteController =
                TextEditingController(text: widget.docs['note']),
          ),
        ],
      ),
    );
  }

  updateData() {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("Takaran_daging");
    return widget.docs.reference.update(({
      "nama": nama_makananController!.text,
      "porsi1": porsi1!.text,
      "porsi2": porsi2!.text,
      "porsi3": porsi3!.text,
      "porsi4": porsi4!.text,
      "porsi5": porsi5!.text,
      "porsi6": porsi6!.text,
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
                .collection("Takaran_daging")
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
