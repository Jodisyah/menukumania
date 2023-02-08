import 'package:MenukuMania/theme.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const search());
}

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  //Widget appBarTitle = const Text("menuku.id - db address");
  Widget appBarTitle = const TextField(
    decoration: InputDecoration(
      hintText: 'Search...',
    ),
    style: TextStyle(color: Colors.white),
  );
  Icon actionIcon = const Icon(Icons.search);

  String url = 'url';
  String nama = '';
  TextEditingController alamatController = TextEditingController();
  TextEditingController mapsController = TextEditingController();
  TextEditingController searchController = TextEditingController();
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
        .orderBy('porsi', descending: true)
        .get();

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange.shade400,
          elevation: 0,
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.orange.shade400,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: TextField(
                autofocus: true,
                style: TextStyle(color: Colors.white),
                controller: searchController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    color: Colors.white60,
                    onPressed: () {
                      searchController.clear();
                    },
                    icon: Icon(Icons.clear),
                  ),
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.white60),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(5),
                ),
                onChanged: (val) {
                  setState(
                    () {
                      nama = val;
                    },
                  );
                },
              ),
            ),
          )

          // Card(
          //   child: TextField(
          //     decoration: InputDecoration(
          //         prefixIcon: Icon(Icons.search), hintText: 'Search...'),
          //     onChanged: (val) {
          //       setState(() {
          //         nama = val;
          //       });
          //     },
          //   ),
          // ),
          ),
      body: Center(
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
                        //kalo textfiel kosong
                        if (nama.isEmpty) {
                          return Center();
                        }
                        //kalo textfield isi
                        if (customers['nama']
                            .toString()
                            .toLowerCase()
                            .startsWith(nama.toLowerCase())) {
                          return GestureDetector(
                            onTap: () {
                              if (snapshot.hasData) {
                                showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  )),
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
                            child: Container(
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.orange.shade200,
                                        child: Text(
                                          customers["nama"][0],
                                          style: const TextStyle(
                                            color: Colors.deepOrange,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        customers['nama'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        customers['alamat'],
                                        style: const TextStyle(
                                            color: Colors.black54),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
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
                                            color: Colors.red.shade800,
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              if (snapshot.hasData) {
                                                alamatController.text =
                                                    customers['alamat'];
                                                mapsController.text =
                                                    customers['maps'];
                                                showModalBottomSheet(
                                                  context: context,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20),
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
                                                              textAlign:
                                                                  TextAlign
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
                                                              color: Colors
                                                                  .orange
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
                                                            // mapsController
                                                            //     .text = '';
                                                            //tutup keyboard
                                                            Navigator.of(
                                                              context,
                                                            ).pop();
                                                            //snackBar

                                                            ScaffoldMessenger
                                                                .of(
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
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(
                                                                  10,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary:
                                                                Colors.green,
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
                                            icon: const Icon(Icons
                                                .edit_location_alt_rounded),
                                            color: Colors.blue.shade800,
                                          )
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                      height: 10,
                                      thickness: 1,
                                      indent: 5,
                                      endIndent: 5,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                        return Container();
                      },
                    ).toList(),
                  );
          },
        ),
      ),
    );
  }
}
