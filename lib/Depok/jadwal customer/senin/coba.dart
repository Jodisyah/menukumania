// import 'package:cloud_firestore/cloud_firestore.dart';
// import '/theme.dart';
// // import '/ui/loginpage.dart';
// // import '/ui/pilih_cabang.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:google_fonts/google_fonts.dart';

// class testing extends StatefulWidget {
//   @override
//   _testingState createState() => _testingState();
// }

// class _testingState extends State<testing> {
//   // TextEditingController? _nameController;
//   // TextEditingController ?_phoneController;
//   // TextEditingController ?_ageController;

//   // setDataToTextField(data) {
//   //   return Column(
//   //     children: [
//   //       // TextFormField(
//   //       //   controller: _nameController = TextEditingController(text: data['cabang']),
//   //       // ),
//   //       // TextFormField(
//   //       //   controller: _phoneController = TextEditingController(text: data['phone']),
//   //       // ),
//   //       // TextFormField(
//   //       //   controller: _ageController = TextEditingController(text: data['age']),
//   //       // ),
//   //       // ElevatedButton(onPressed: ()=>updateData(), child: Text("Update"))
//   //     ],
//   //   );
//   // }

//   // updateData() {
//   //   CollectionReference _collectionRef =
//   //       FirebaseFirestore.instance.collection("daerah_cabang");
//   //   return _collectionRef.doc(FirebaseAuth.instance.currentUser!.email).update({
//   //     // "cabang":_nameController!.text,
//   //     // "phone":_phoneController!.text,
//   //     // "age":_ageController!.text,
//   //   }).then((value) => print("Updated Successfully"));
//   // }

//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     body: SafeArea(child: Padding(
//   //       padding: const EdgeInsets.all(20.0),
//   //       child: StreamBuilder(
//   //         stream: FirebaseFirestore.instance.collection("daerah_cabang").doc(FirebaseAuth.instance.currentUser!.email).snapshots(),
//   //         builder: (BuildContext context, AsyncSnapshot snapshot){
//   //           var data = snapshot.data;
//   //           if(data==null){
//   //             return Center(child: CircularProgressIndicator(),);
//   //           }
//   //           return setDataToTextField(data);
//   //         },

//   //       ),
//   //     )),
//   //   );
//   // }
//   @override
//    Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: FutureBuilder<QuerySnapshot>(
//         future: FirebaseFirestore
//                 .instance
//                 .collection('add_customers_senin') 
//                 .where("status_", 
//                 // isEqualTo: FirebaseAuth.instance.currentUser!.uid
//                 isEqualTo: 'lunas'
//                 )// 👈 Your where condition here
//                 .get(), 
//         builder: (_, snapshot) {
//           if (snapshot.hasError) return Text('Error = ${snapshot.error}');
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Text("Loading");
//           }
//           return ListView(
//               children: snapshot.data!.docs.map((DocumentSnapshot document) {
//             Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//             return ListTile(
//               title:
//                Container(child: Text(data['status_'])), // 👈 Your valid data here
//             );
//           }).toList());
//         },
//       )),
//     );
//   }
//   }

