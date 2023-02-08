import '/theme.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class pendampingAddPage extends StatefulWidget {
  const pendampingAddPage({Key? key}) : super(key: key);

  @override
  State<pendampingAddPage> createState() => _pendampingAddPageState();
}

class _pendampingAddPageState extends State<pendampingAddPage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController porsi1Controller = TextEditingController();
  TextEditingController porsi2Controller = TextEditingController();
  TextEditingController porsi3Controller = TextEditingController();
  TextEditingController porsi4Controller = TextEditingController();
  TextEditingController porsi5Controller = TextEditingController();
  TextEditingController porsi6Controller = TextEditingController();
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference Menu = FirebaseFirestore.instance.collection('Takaran_pendamping');

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffF99B45),
        title: const Text("Tambah Menu Pendamping"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: const Color(0xff284E60), width: 2.0)),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListView(
              children: [
                TextField(
                  textCapitalization: TextCapitalization.characters,
                  controller: namaController,
                  decoration: const InputDecoration(labelText: 'Nama Menu'),
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                  controller: porsi1Controller,
                  decoration: const InputDecoration(labelText: 'porsi1'),
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                  controller: porsi2Controller,
                  decoration: const InputDecoration(labelText: 'porsi2'),
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                  controller: porsi3Controller,
                  decoration: const InputDecoration(labelText: 'porsi3'),
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                  controller: porsi4Controller,
                  decoration: const InputDecoration(labelText: 'porsi4'),
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                  controller: porsi5Controller,
                  decoration: const InputDecoration(labelText: 'porsi5'),
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                  controller: porsi6Controller,
                  decoration: const InputDecoration(labelText: 'porsi6'),
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                  controller: noteController,
                  decoration: const InputDecoration(labelText: 'Note'),
                ),
                ElevatedButton(
                    onPressed: () {
                      Menu.add({
                        'nama': namaController.text,
                        'porsi1': porsi1Controller.text ,
                        'porsi2': porsi2Controller.text ,
                        'porsi3': porsi3Controller.text ,
                        'porsi4': porsi4Controller.text ,
                        'porsi5': porsi5Controller.text ,
                        'porsi6': porsi6Controller.text ,
                        'note': noteController.text,
                      });
                      namaController.text = '';
                      porsi1Controller.text = '';
                      porsi2Controller.text = '';
                      porsi3Controller.text = '';
                      porsi4Controller.text = '';
                      porsi5Controller.text = '';
                      porsi6Controller.text = '';
                      noteController.text = '';

                      //buat tutup keyboard
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Berhasil tambah menu...")));
                    },
                    style: ElevatedButton.styleFrom(primary: KGreenColor),
                    child: const Text("SAVE"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
