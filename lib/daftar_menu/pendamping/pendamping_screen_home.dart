import 'package:cloud_firestore/cloud_firestore.dart';
import '/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget PendampingScreenHome(Function()? ontap, QueryDocumentSnapshot docs) {
  bool isliked;
  return InkWell(
    onTap: ontap,
    child: Container(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 5),
                                child: Stack(
                                  children: [
                                    ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: kwhite,
                                        child: Text(
                                          docs["nama"][0],
                                          style: const TextStyle(
                                            color: const Color(0xffF99B45),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        docs['nama'],
                                        style: const TextStyle(
                                            color: Color(0xff284E60),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      trailing: StreamBuilder<Object>(
                                        stream: null,
                                        builder: (context, snapshot) {
                                          return Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                color: Color(0xffD95980),
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (BuildContext ctx) {
                                                      return AlertDialog(
                                                        title: const Text("Konfirmasi"),
                                                        content: Text(docs['nama_makanan'] +
                                                            " - Yakin nih beb... mw d apus...?"),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              docs.reference.delete();
                                                              Navigator.of(context).pop();
                                                            },
                                                            child: const Text("iya"),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(context).pop();
                                                            },
                                                            child: const Text("Jangan"),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                ),
                                              ),
                                      
                                            ],
                                          );
                                        }
                                      ),
                                    ),
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
