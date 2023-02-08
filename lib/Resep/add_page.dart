import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:datacust/app_style.dart';
import '/theme.dart';
import 'package:flutter/material.dart';

class AddPageResep extends StatefulWidget {
  const AddPageResep({Key? key}) : super(key: key);

  @override
  State<AddPageResep> createState() => _AddPageResepState();
}

class _AddPageResepState extends State<AddPageResep> {
  // int color = Random().nextInt(AppStyle.cardsColor.length);
  // String date = DateTime.now().toString();

  TextEditingController nama_makananController = TextEditingController();
  // TextEditingController porsi1 = TextEditingController();
  // TextEditingController porsi2 = TextEditingController();
  // TextEditingController porsi3 = TextEditingController();
  // TextEditingController porsi4 = TextEditingController();
  // TextEditingController porsi5 = TextEditingController();
  // TextEditingController porsi6 = TextEditingController();
  TextEditingController noteController = TextEditingController();
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppStyle.cardsColor[color],
      appBar: AppBar(backgroundColor: kPrimaryColor,automaticallyImplyLeading: false,
        // backgroundColor: AppStyle.cardsColor[color],
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Tambah Resep Makanan',
          style: TextStyle(color: kwhite),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  textCapitalization: TextCapitalization.characters,
                  controller: nama_makananController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Makanan',
                  ),
                  style: AppStyle.mainTitle,
                ),
                SizedBox(
                  height: 28,
                ),
                // TextField(
                //   controller: porsi1,
                //   keyboardType: TextInputType.multiline,
                //   maxLines: null,
                //   decoration: InputDecoration(
                //     border: InputBorder.none,
                //     hintText: 'Takaran',
                //   ),
                //   style: AppStyle.mainTitle,
                // ),
                // TextField(
                //   controller: porsi2,
                //   keyboardType: TextInputType.multiline,
                //   maxLines: null,
                //   decoration: InputDecoration(
                //     border: InputBorder.none,
                //     hintText: 'Takaran',
                //   ),
                //   style: AppStyle.mainTitle,
                // ),
                // TextField(
                //   controller: porsi3,
                //   keyboardType: TextInputType.multiline,
                //   maxLines: null,
                //   decoration: InputDecoration(
                //     border: InputBorder.none,
                //     hintText: 'Takaran',
                //   ),
                //   style: AppStyle.mainTitle,
                // ),
                // TextField(
                //   controller: porsi4,
                //   keyboardType: TextInputType.multiline,
                //   maxLines: null,
                //   decoration: InputDecoration(
                //     border: InputBorder.none,
                //     hintText: 'Takaran',
                //   ),
                //   style: AppStyle.mainTitle,
                // ),
                // TextField(
                //   controller: porsi5,
                //   keyboardType: TextInputType.multiline,
                //   maxLines: null,
                //   decoration: InputDecoration(
                //     border: InputBorder.none,
                //     hintText: 'Takaran',
                //   ),
                //   style: AppStyle.mainTitle,
                // ),
                // TextField(
                //   controller: porsi6,
                //   keyboardType: TextInputType.multiline,
                //   maxLines: null,
                //   decoration: InputDecoration(
                //     border: InputBorder.none,
                //     hintText: 'Takaran',
                //   ),
                //   style: AppStyle.mainTitle,
                // ),
                TextField(
                  controller: noteController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Resep',
                  ),
                  style: AppStyle.mainTitle,
                ),
                
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () async {
          FirebaseFirestore.instance.collection('Resep').add({
            'nama': nama_makananController.text,
            'note': noteController.text,
            // 'color': color
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError(
              (Error) => print("Failed to add new Note due to $Error"));
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
