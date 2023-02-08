import 'package:MenukuMania/Depok/bottom_nav_pages/search.dart';
import 'package:MenukuMania/Depok/drawer_depok.dart';
import 'package:url_launcher/url_launcher.dart';

// import '/drawer.dart';
// import '/homepage/addpage.dart';
// import '/homepage/search.dart';
import '/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final Uri url = Uri.parse('https://flutter.dev');

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  //string buat manggil UrlLauncher
  String url = '';

  TextEditingController alamatController = TextEditingController();
  TextEditingController mapsController = TextEditingController();
  TextEditingController ruteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
     List<String> Rute = [
      "RUTE 1",
      "RUTE 2",
      "RUTE 3",
      "RUTE 4",
      "RUTE 5",
      "RUTE 6"
    ];
    CollectionReference customers =
        FirebaseFirestore.instance.collection('customers');
    FirebaseFirestore.instance
        .collection('customers')
        .orderBy('nama', descending: false)
        .snapshots();

    return Scaffold(
      drawer:const MyDrawerDepok(),
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text("MENUKU MANIA - DEPOK "),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => search(),
              ),
            ),
            icon: Icon(Icons.search_sharp),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: StreamBuilder(
              stream: customers.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                return (snapshot.connectionState == ConnectionState.waiting)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView(
                        children: snapshot.data!.docs.map(
                        (customers) {
                          return GestureDetector(
                            onTap: () {
                              if (snapshot.hasData) {
                                showModalBottomSheet(
                                  context: context,
                                  // shape: const RoundedRectangleBorder(
                                  //     borderRadius: BorderRadius.only(
                                  //   topLeft: Radius.circular(20),
                                  //   topRight: Radius.circular(20),
                                  // )),
                                  builder: (BuildContext context) => Padding(
                                    padding: const EdgeInsets.only(
                                      top: 20.0,
                                      left: 20,
                                      right: 20,
                                    ),
                                    child: ListView(
                                      children: [
                                        Container(
                                          height: 40,
                                          color: Colors.orange.shade200,
                                          child: Center(
                                            child: Text(
                                              customers['nama'],
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.deepOrange,
                                              ),
                                            ),
                                          ),
                                        ),
                                        
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          "Alamat:",
                                          style: TextStyle(
                                            color: Colors.deepOrange,
                                          ),
                                        ),
                                         const SizedBox(
                                          height: 10,
                                        ),
                                        Text(customers['rute']),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(customers['alamat']),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            //UrlLauncher
                                            _mapsURL() async {
                                              url = customers['maps'];
                                              if (await canLaunch(url)) {
                                                await launch(url);
                                              } else {
                                                throw 'Gagal kluarin alamat $url';
                                              }
                                            }

                                            //end Url Launcher
                                            _mapsURL();
                                          },
                                          icon: const Icon(
                                              Icons.pin_drop_rounded),
                                          label: const Text("Maps"),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Container(color: kwhite,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Stack(
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Container(color: Colors.grey,
                                      //   width: double.infinity,
                                      // ),

                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 12,top: 7
                                            ),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.orange.shade200,
                                              child: Text(
                                                customers["nama"][0],
                                                style: const TextStyle(fontSize: 21,
                                                  color: Colors.deepOrange,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 65,
                                          right: 100,bottom: 5
                                        ),
                                        child: ListTile(
                                                title: Text(
                                                  customers['nama'],
                                                  style: const TextStyle(fontSize: 17,
                                                      fontWeight: FontWeight.w500,
                                                      color: kblackcolor),
                                                ),
                                             subtitle: Text(
                                                customers['alamat'],
                                                style: const TextStyle(
                                                    color: Color.fromARGB(137, 0, 0, 0)),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                        ),),
                                      
                                      // Padding(
                                      //   padding: const EdgeInsets.only(left: 15),
                                      //   child: CircleAvatar(
                                      //     backgroundColor: Colors.orange.shade200,
                                      //     child: Text(
                                      //       customers["nama"][0],
                                      //       style: const TextStyle(
                                      //         color: Colors.deepOrange,
                                      //         fontWeight: FontWeight.w400,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),

                                      Padding(
                                        padding: const EdgeInsets.only(right: 5,bottom: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                //UrlLauncher
                                                _mapsURL() async {
                                                  url = customers['maps'];
                                                  if (await canLaunch(url)) {
                                                    await launch(url);
                                                  } else {
                                                    throw 'Could not launch $url';
                                                  }
                                                }

                                                //end Url Launcher
                                                _mapsURL();
                                              },
                                              icon: const Icon(
                                                  Icons.pin_drop_rounded),
                                              color: Colors.red.shade800,iconSize: 28,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                if (snapshot.hasData) {
                                                  alamatController.text =
                                                      customers['alamat'];
                                                  mapsController.text =
                                                      customers['maps'];
                                                  showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    context: context,
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.only(
                                                      topLeft: Radius.circular(20),
                                                      topRight: Radius.circular(20),
                                                    )),
                                                    builder:
                                                        (BuildContext context) =>
                                                            Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        top: 20.0,
                                                        left: 20,
                                                        right: 20,
                                                      ),
                                                      child: ListView(
                                                        children: [
                                                          Container(
                                                            height: 40,
                                                            color: Colors
                                                                .orange.shade200,
                                                            child: Center(
                                                              child: Text(
                                                                customers['nama'],
                                                                textAlign: TextAlign
                                                                    .center,
                                                                style: TextStyle(
                                                                  color: Colors
                                                                      .orange
                                                                      .shade800,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 17,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 20),
                                                          const Text(
                                                            "Alamat",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .deepOrange),
                                                          ),
                                                          TextField(
                                                            maxLines: 3,
                                                            controller:
                                                                alamatController,
                                                          ),
                                                          Text(
                                                            "Rute Pengantaran",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .deepOrange),
                                                          ),
                                                          TextField(
                                                            controller:
                                                                ruteController,
                                                            readOnly: true,
                                                            decoration:
                                                                InputDecoration(
                                                              prefixIcon:
                                                                  DropdownButton<
                                                                      String>(
                                                                hint: Text(
                                                                    customers[
                                                                        'rute']),
                                                                items: Rute.map(
                                                                    (String
                                                                        value) {
                                                                  return DropdownMenuItem<
                                                                      String>(
                                                                    value:
                                                                        value,
                                                                    child: new Text(
                                                                        value),
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        ruteController.text =
                                                                            value;
                                                                      });
                                                                    },
                                                                  );
                                                                }).toList(),
                                                                onChanged:
                                                                    (_) {},
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "Maps",
                                                            style: TextStyle(
                                                                color: Colors.orange
                                                                    .shade900),
                                                          ),
                                                          TextField(
                                                            maxLines: 2,
                                                            controller:
                                                                mapsController,
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          ElevatedButton(
                                                            onPressed: () async {
                                                              customers.reference
                                                                  .update({
                                                                "alamat":
                                                                    alamatController
                                                                        .text,
                                                                "maps":
                                                                    mapsController
                                                                        .text,
                                                                        "rute":
                                                                    ruteController
                                                                        .text
                                                              });

                                                              // alamatController
                                                              //     .text = '';
                                                              // mapsController.text =
                                                              //     '';
                                                              //tutup keyboard
                                                              Navigator.of(
                                                                context,
                                                              ).pop();
                                                              //snackBar

                                                              ScaffoldMessenger.of(
                                                                context,
                                                              ).showSnackBar(
                                                                const SnackBar(
                                                                  content: Text(
                                                                    'Berhasil Update Customer...!',
                                                                  ),
                                                                  backgroundColor:
                                                                      Colors.cyan,
                                                                  elevation: 10,
                                                                  behavior:
                                                                      SnackBarBehavior
                                                                          .floating,
                                                                  margin: EdgeInsets
                                                                      .all(
                                                                    10,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                              primary: Colors.green,
                                                            ),
                                                            child: const Text(
                                                              "SAVE",
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                              icon: const Icon(
                                                  Icons.edit_location_alt_rounded),
                                              color: Colors.blue.shade800,iconSize: 26,
                                            )
                                          ],
                                        ),
                                      ),
                                      // ListTile(
                                      //   leading: CircleAvatar(
                                      //     backgroundColor: Colors.orange.shade200,
                                      //     child: Text(
                                      //       customers["nama"][0],
                                      //       style: const TextStyle(
                                      //         color: Colors.deepOrange,
                                      //         fontWeight: FontWeight.w400,
                                      //       ),
                                      //     ),
                                      //   ),
                                      //   title: Padding(
                                      //     padding: const EdgeInsets.only(top: 0),
                                      //     child: Text(
                                      //       customers['nama'],
                                      //       style: const TextStyle(
                                      //           fontWeight: FontWeight.w500,color:kblackcolor),
                                      //     ),
                                      //   ),
                                      //   subtitle: Text(
                                      //     customers['alamat'],
                                      //     style: const TextStyle(
                                      //         color: kblackcolor),
                                      //     overflow: TextOverflow.ellipsis,
                                      //   ),
                                      //   trailing: Row(
                                      //     mainAxisSize: MainAxisSize.min,
                                      //     children: [
                                      //       IconButton(
                                      //         onPressed: () {
                                      //           //UrlLauncher
                                      //           _mapsURL() async {
                                      //             url = customers['maps'];
                                      //             if (await canLaunch(url)) {
                                      //               await launch(url);
                                      //             } else {
                                      //               throw 'Could not launch $url';
                                      //             }
                                      //           }

                                      //           //end Url Launcher
                                      //           _mapsURL();
                                      //         },
                                      //         icon: const Icon(
                                      //             Icons.pin_drop_rounded),
                                      //         color: Colors.red.shade800,
                                      //       ),
                                      //       IconButton(
                                      //         onPressed: () {
                                      //           if (snapshot.hasData) {
                                      //             alamatController.text =
                                      //                 customers['alamat'];
                                      //             mapsController.text =
                                      //                 customers['maps'];
                                      //             showModalBottomSheet(isScrollControlled: true,
                                      //               context: context,
                                      //               shape:
                                      //                   const RoundedRectangleBorder(
                                      //                       borderRadius:
                                      //                           BorderRadius.only(
                                      //                 topLeft: Radius.circular(20),
                                      //                 topRight: Radius.circular(20),
                                      //               )),
                                      //               builder:
                                      //                   (BuildContext context) =>
                                      //                       Padding(
                                      //                 padding:
                                      //                     const EdgeInsets.only(
                                      //                   top: 20.0,
                                      //                   left: 20,
                                      //                   right: 20,
                                      //                 ),
                                      //                 child: ListView(
                                      //                   children: [
                                      //                     Container(
                                      //                       height: 40,
                                      //                       color: Colors
                                      //                           .orange.shade200,
                                      //                       child: Center(
                                      //                         child: Text(
                                      //                           customers['nama'],
                                      //                           textAlign: TextAlign
                                      //                               .center,
                                      //                           style: TextStyle(
                                      //                             color: Colors
                                      //                                 .orange
                                      //                                 .shade800,
                                      //                             fontWeight:
                                      //                                 FontWeight
                                      //                                     .bold,
                                      //                             fontSize: 17,
                                      //                           ),
                                      //                         ),
                                      //                       ),
                                      //                     ),
                                      //                     const SizedBox(
                                      //                         height: 20),
                                      //                     const Text(
                                      //                       "Alamat",
                                      //                       style: TextStyle(
                                      //                           color: Colors
                                      //                               .deepOrange),
                                      //                     ),
                                      //                     TextField(
                                      //                       maxLines: 3,
                                      //                       controller:
                                      //                           alamatController,
                                      //                     ),
                                      //                     Text(
                                      //                       "Maps",
                                      //                       style: TextStyle(
                                      //                           color: Colors.orange
                                      //                               .shade900),
                                      //                     ),
                                      //                     TextField(
                                      //                       maxLines: 2,
                                      //                       controller:
                                      //                           mapsController,
                                      //                     ),
                                      //                     const SizedBox(
                                      //                       height: 15,
                                      //                     ),
                                      //                     ElevatedButton(
                                      //                       onPressed: () async {
                                      //                         customers.reference
                                      //                             .update({
                                      //                           "alamat":
                                      //                               alamatController
                                      //                                   .text,
                                      //                           "maps":
                                      //                               mapsController
                                      //                                   .text
                                      //                         });

                                      //                         alamatController
                                      //                             .text = '';
                                      //                         mapsController.text =
                                      //                             '';
                                      //                         //tutup keyboard
                                      //                         Navigator.of(
                                      //                           context,
                                      //                         ).pop();
                                      //                         //snackBar

                                      //                         ScaffoldMessenger.of(
                                      //                           context,
                                      //                         ).showSnackBar(
                                      //                           const SnackBar(
                                      //                             content: Text(
                                      //                               'Berhasil Update Customer...!',
                                      //                             ),
                                      //                             backgroundColor:
                                      //                                 Colors.cyan,
                                      //                             elevation: 10,
                                      //                             behavior:
                                      //                                 SnackBarBehavior
                                      //                                     .floating,
                                      //                             margin: EdgeInsets
                                      //                                 .all(
                                      //                               10,
                                      //                             ),
                                      //                           ),
                                      //                         );
                                      //                       },
                                      //                       style: ElevatedButton
                                      //                           .styleFrom(
                                      //                         primary: Colors.green,
                                      //                       ),
                                      //                       child: const Text(
                                      //                         "SAVE",
                                      //                       ),
                                      //                     )
                                      //                   ],
                                      //                 ),
                                      //               ),
                                      //             );
                                      //           }
                                      //         },
                                      //         icon: const Icon(
                                      //             Icons.edit_location_alt_rounded),
                                      //         color: Colors.blue.shade800,
                                      //       )
                                      //     ],
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList());
              }),
        ),
      ),
    );
  }
}
