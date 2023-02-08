import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:MenukuMania/loginpage.dart';
import 'package:MenukuMania/theme.dart';

class ProfileTangsel extends StatefulWidget {
  @override
  _ProfileTangselState createState() => _ProfileTangselState();
}

class _ProfileTangselState extends State<ProfileTangsel> {
  // TextEditingController? _nameController;
  // TextEditingController ?_phoneController;
  // TextEditingController ?_ageController;

  // setDataToTextField(data) {
  //   return Column(
  //     children: [
  //       // TextFormField(
  //       //   controller: _nameController = TextEditingController(text: data['cabang']),
  //       // ),
  //       // TextFormField(
  //       //   controller: _phoneController = TextEditingController(text: data['phone']),
  //       // ),
  //       // TextFormField(
  //       //   controller: _ageController = TextEditingController(text: data['age']),
  //       // ),
  //       // ElevatedButton(onPressed: ()=>updateData(), child: Text("Update"))
  //     ],
  //   );
  // }

  // updateData() {
  //   CollectionReference _collectionRef =
  //       FirebaseFirestore.instance.collection("daerah_cabang");
  //   return _collectionRef.doc(FirebaseAuth.instance.currentUser!.email).update({
  //     // "cabang":_nameController!.text,
  //     // "phone":_phoneController!.text,
  //     // "age":_ageController!.text,
  //   }).then((value) => print("Updated Successfully"));
  // }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SafeArea(child: Padding(
  //       padding: const EdgeInsets.all(20.0),
  //       child: StreamBuilder(
  //         stream: FirebaseFirestore.instance.collection("daerah_cabang").doc(FirebaseAuth.instance.currentUser!.email).snapshots(),
  //         builder: (BuildContext context, AsyncSnapshot snapshot){
  //           var data = snapshot.data;
  //           if(data==null){
  //             return Center(child: CircularProgressIndicator(),);
  //           }
  //           return setDataToTextField(data);
  //         },

  //       ),
  //     )),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    Widget bonusCard(data) {
      return Column(
        children: [
          Container(
            height: 50,
            // decoration: BoxDecoration(
            //   image: const DecorationImage(
            //     image: AssetImage(
            //       'assets/image_card.png',
            //     ),
            //   ),
              // borderRadius: BorderRadius.circular(35),
              // boxShadow: [
              //   BoxShadow(
              //     color: kwhite.withOpacity(1),
              //     blurRadius: 50,
              //     offset: Offset(0, 10),
              //   ),
              // ],
            // ),
          ),
          Container(
            width: double.infinity,
            height: 180,
            padding: EdgeInsets.only(left: 55),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   'Siapa Ni',
                          //   style: GoogleFonts.poppins(
                          //       fontSize: 30,
                          //       fontWeight: FontWeight.w500,
                          //       color: kblackcolor),
                          //   // style: creamTextStyle.copyWith(
                          //   //   fontWeight: light,
                          //   // ),
                          // ),
                          Text(
                            data['admin'],
                            style: GoogleFonts.poppins(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                color: kblackcolor),
                            // style: creamTextStyle.copyWith(
                            //   fontSize: 20,
                            //   fontWeight: medium,
                            // ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(
                    //     right: 6,
                    //   ),
                    //   child: Text(
                    //     'Kelas Mawar',
                    //     // style: creamTextStyle.copyWith(
                    //     //   fontWeight: light,
                    //     // ),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 38,
                ),
                Text(
                  'Nomor Telepon',
                  style: GoogleFonts.poppins(
                      fontSize: 17, fontWeight: FontWeight.w400),
                  // style: creamTextStyle.copyWith(
                  //   fontWeight: light,
                  // ),
                ),
                Expanded(
                  child: Text(
                    data['telepon'],
                    style: GoogleFonts.poppins(
                        fontSize: 17, fontWeight: FontWeight.w400),
                    // style: creamTextStyle.copyWith(
                    //   fontSize: 26,
                    //   fontWeight: medium,
                  ),
                ),
                // ),
              ],
            ),
          ),
        ],
      );
    }

    Widget Judul() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15,top: 40,bottom: 30),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
          //         IconButton(
          //   onPressed: () async {
          //     await FirebaseAuth.instance.signOut();
          //     Navigator.pushAndRemoveUntil(
          //         context,
          //         MaterialPageRoute(builder: (context) => LoginPageDepok()),
          //         (route) => false);
          //   },
          //   icon: Icon(Icons.logout,color: kblackcolor,),
          // ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50,top: 50),
            child: Container(
              width: 250,
              margin: EdgeInsets.only(
                bottom: 30,
                left: 15,
                right: 15,
              ),
              child: Image.asset(
                "assets/logo2.png",
                width: 50,
              ),
              // style: blackTextStyle.copyWith(
              //   fontWeight: semiBold,
              //   fontSize: 32,
              // ),
              // textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

    Widget title(data) {
      return Container(
        margin: EdgeInsets.only(top: 75,bottom: 10),
        child: Text(
          'TANGGERANG SELATAN',
          style: GoogleFonts.poppins(fontSize: 37, fontWeight: FontWeight.w500),textAlign: TextAlign.center,
          // style: blackTextStyle.copyWith(
          //   fontWeight: semiBold,
          //   fontSize: 32,
          // ),
        ),
      );
    }

    Widget subtitle(data) {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(
          'Komplek Griya Jakarta', style: GoogleFonts.poppins(fontSize: 17),
          // style: greyTextStyle.copyWith(
          //   fontWeight: light,
          //   fontSize: 16,
          // ),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget startButton() {
      return Container(
        width: 220,
        height: 55,
        margin: EdgeInsets.only(
          top: 50,
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/bottomnav");
          },
          style: TextButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            'Lets Go...',
            // style: creamTextStyle.copyWith(fontWeight: medium, fontSize: 18),
          ),
        ),
      );
    }

    return Scaffold(
      // drawer: const MyDrawer(),
      backgroundColor: kwhite,
      // appBar: AppBar(elevation: 0,backgroundColor: kPrimaryColor,),
      // appBar: AppBar(backgroundColor: Colors.white,elevation: 0, actions: [
      //   Padding(
      //     padding: const EdgeInsets.only(right:15),
      //     child: IconButton(
      //       onPressed: () async {
      //         await FirebaseAuth.instance.signOut();
      //         Navigator.pushAndRemoveUntil(
      //             context,
      //             MaterialPageRoute(builder: (context) => LoginPage()),
      //             (route) => false);
      //       },
      //       icon: Icon(Icons.logout,color: kblackcolor,),
      //     ),
      //   ),
      // ],),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("daerah_cabang")
            .doc(FirebaseAuth.instance.currentUser!.email)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var data = snapshot.data;
          if (data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Judul(),
                  bonusCard(data),
                  title(data),
                  subtitle(data),
                  // startButton(),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
