import 'package:cloud_firestore/cloud_firestore.dart';
import '/theme.dart';
// import '/Depok/bottom_nav_pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditPageKamisTangsel extends StatefulWidget {
  EditPageKamisTangsel(this.docs, {Key? key}) : super(key: key);
  QueryDocumentSnapshot docs;

  @override
  _EditPageKamisTangselState createState() => _EditPageKamisTangselState();
}
class _EditPageKamisTangselState extends State<EditPageKamisTangsel> {
  TextEditingController namaController = TextEditingController();
  TextEditingController porsiController = TextEditingController();
  TextEditingController hariController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController mapsController = TextEditingController();

  setDataToTextField() {
    return ListView(
      children: [
        Text(
          "Nama",
          style: TextStyle(color: kPrimaryColor),
        ),
        TextField(
          textCapitalization: TextCapitalization.characters,
          controller: namaController = TextEditingController(
            text: widget.docs['nama_'],
          ),
        ),
        Text(
          "Porsi",
          style: TextStyle(color: kPrimaryColor),
        ),
        TextField(
          controller: porsiController = TextEditingController(
            text: widget.docs['porsi_'],
          ),
        ),
        Text(
          "Hari",
          style: TextStyle(color: kPrimaryColor),
        ),
        TextField(
          controller: hariController = TextEditingController(
            text: widget.docs['hari_'],
          ),
        ),
        Text(
          "tanggal",
          style: TextStyle(color: kPrimaryColor),
        ),
        TextField(
          controller: tanggalController = TextEditingController(
            text: widget.docs['tanggal_'],
          ),
        ),
        Text(
          "Note",
          style: TextStyle(color: kPrimaryColor),
        ),
        TextField(
          controller: noteController = TextEditingController(
            text: widget.docs['note_'],
          ),
        ),
        Text(
          "Status Pembayaran",
          style: TextStyle(color: kPrimaryColor),
        ),
        TextField(
          controller: statusController = TextEditingController(
            text: widget.docs['status_'],
          ),
        ),
        Text(
          "Alamat",
          style: TextStyle(color: kPrimaryColor),
        ),
        TextField(
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          controller: alamatController = TextEditingController(
            text: widget.docs['alamat_'],
          ),
        ),
        Text(
          "Maps",
          style: TextStyle(color: kPrimaryColor),
        ),
        TextField(
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          controller: mapsController = TextEditingController(
            text: widget.docs['maps_'],
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            widget.docs.reference.update(({
              "nama_": namaController.text,
              "porsi_": porsiController.text,
              "hari_": hariController.text,
              "tanggal_": tanggalController.text,
              "note_": noteController.text,
              "status_": statusController.text,
              "alamat_": alamatController.text,
              "maps_": mapsController.text
            }));
            namaController.text = '';
            porsiController.text = '';
            hariController.text = '';
            tanggalController.text = '';
            noteController.text = '';
            statusController.text = '';
            alamatController.text = '';
            mapsController.text = '';
            //tutup keyboard
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(
              const SnackBar(
                content: Text(
                  'Berhasil Update Customer...!',
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
          child: Text('Update'),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('add_customers_tangsel_kamis')
              .orderBy('nama_', descending: false)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              //buat tampilin data di textfield
              namaController.text = widget.docs['nama_'];
              porsiController.text = widget.docs['porsi_'];
              hariController.text = widget.docs['hari_'];
              tanggalController.text = widget.docs['tanggal_'];
              noteController.text = widget.docs['note_'];
              statusController.text = widget.docs['status_'];
              alamatController.text = widget.docs['alamat_'];
              mapsController.text = widget.docs['maps_'];
            }
            // var data = snapshot.data;
            // if(data==null){
            //   return Center(child: CircularProgressIndicator(),);
            // }
            return setDataToTextField();
          },
        ),
      )),
    );
  }
}
