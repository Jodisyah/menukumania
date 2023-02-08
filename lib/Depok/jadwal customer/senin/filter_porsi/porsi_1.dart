import 'package:MenukuMania/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Porsi1 extends StatefulWidget {
  const Porsi1({super.key});

  @override
  State<Porsi1> createState() => _Porsi1State();
}

class _Porsi1State extends State<Porsi1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('add_customers_senin')
                .where("porsi_", isEqualTo: '1')
                // .doc('menuku.depok@gmail.com')
                // .collection("customers2")
                // .orderBy('porsi_', descending: false)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Something is wrong"),
                );
              }
              return ListView.builder(
                  itemCount:
                      snapshot.data == null ? 0 : snapshot.data!.docs.length,
                  itemBuilder: (_, index) {
                    DocumentSnapshot _documentSnapshot =
                        snapshot.data!.docs[index];
                    return Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(18, 20, 18, 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: kPrimaryColor,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(
                                                  8,
                                                ),
                                                topRight: Radius.circular(
                                                  8,
                                                ),
                                              ),
                                            ),
                                            // height: 40,
                                            // color: Colors.amber,
                                            child: Stack(
                                              children: [
                                                Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30,
                                                            right: 30,
                                                            top: 9,
                                                            bottom: 5),
                                                    child: Text(
                                                      _documentSnapshot[
                                                          'nama_'],
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: kPrimaryColor,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft: Radius.circular(
                                                      8,
                                                    ),
                                                    bottomRight:
                                                        Radius.circular(
                                                      8,
                                                    ),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              right: 15,
                                                              top: 8),
                                                      child: Row(children: [
                                                        Text(
                                                          "Porsi  : ",
                                                          style: AppStyle
                                                              .mainTitleeee,
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 10),
                                                            child: Text(
                                                                _documentSnapshot[
                                                                        'porsi_'] +
                                                                    " Porsi",
                                                                style: GoogleFonts.poppins(
                                                                    fontSize:
                                                                        19,
                                                                    color:
                                                                        kblackcolor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                          ),
                                                        ),
                                                      ]),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 11,
                                                              right: 15,
                                                              top: 0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Rute  :  ",
                                                            style: AppStyle
                                                                .mainTitleeee,
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 6),
                                                              child: Text(
                                                                  _documentSnapshot[
                                                                      'rute_'],
                                                                  style: AppStyle
                                                                      .mainTitleeee),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10,
                                                                  top: 4,
                                                                  bottom: 10),
                                                          child: Text(
                                                            "Note  : ",
                                                            style: AppStyle
                                                                .mainTitleeee,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 4,
                                                                    right: 15,
                                                                    bottom: 7,
                                                                    left: 10),
                                                            child: Text(
                                                              _documentSnapshot[
                                                                  'note_'],
                                                              // overflow: TextOverflow.ellipsis,
                                                              style: AppStyle
                                                                  .mainTitleeee,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                       Padding(
                            padding: const EdgeInsets.only(left: 0, top: 0),
                            child: Container(
                                // decoration: BoxDecoration(
                                //   color: kPrimaryColor,
                                //   //  border: Border.fromBorderSide(BorderSide(color: Color.fromARGB(255, 255, 255, 255),width: 0.1)
                                //   //       // color: Colors.white,
                                //   //     ),
                                //   borderRadius: const BorderRadius.only(
                                //     topLeft: Radius.circular(
                                //       8,
                                //     ),
                                //     // topRight: Radius.circular(
                                //     //   8,
                                //     // ),
                                //   ),
                                // ),
                                height: 41,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 17, top: 7),
                                  child: Text('${index + 1}' + '.',
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: kwhite)),
                                )),
                          ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
