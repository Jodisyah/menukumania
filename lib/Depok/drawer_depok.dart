
import 'package:MenukuMania/Depok/bottom_nav_pages/address.dart';
import 'package:MenukuMania/Depok/bottom_nav_pages/bottom_nav_controller.dart';
import 'package:MenukuMania/Depok/bottom_nav_pages/jadwal.dart';
import 'package:MenukuMania/Resep/resep_home_page.dart';
import 'package:MenukuMania/TANGSEL/bottom_nav_pages/bottom_nav_controller.dart';
import 'package:MenukuMania/daftar_menu/ayam/ayam_home_page.dart';
import 'package:MenukuMania/daftar_menu/daging/daging_home_page.dart';
import 'package:MenukuMania/daftar_menu/pendamping/pendamping_home_page.dart';
import 'package:MenukuMania/daftar_menu/seafood/seafood_home_page.dart';
import 'package:MenukuMania/loginpage.dart';
import 'package:MenukuMania/welcome_page.dart';

import '/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyDrawerDepok extends StatelessWidget {
  const MyDrawerDepok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 6,
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
          ),
          child: Column(
            children: [
              const SizedBox(height: 40),
              ListTile(
                leading: Padding(
                  padding:  const EdgeInsets.only(left: 5),
                  child: Text(
                    "MENUKU.ID",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                // subtitle: Padding(
                //   padding: const EdgeInsets.only(right: 0),
                //   child: Text(
                //     "1.3 Version",
                //     style: TextStyle(color: kScallopColor),
                //   ),
                // ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
         ListTile(
              leading: Text(
                'DEPOK',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
        ListTile(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => Address()),
        ),
      leading: const Icon(Icons.group),
      title: const Text(
        'Alamat Customer',
        style: TextStyle(fontSize: 16),
      ),
        ),
        Divider(
      color: kPrimaryColor,
      thickness: 1,
        ),
        ListTile(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => JadwalDepok()),
        ),
      leading: const Icon(Icons.dvr),
      title: const Text(
        'Jadwal Catering',
        style: TextStyle(fontSize: 16),
      ),
        ),
      //   Divider(
      // color: kPrimaryColor,
      // thickness: 1,
      //   ),
      //   ListTile(
      //         onTap: () => Navigator.of(context).push(
      //           MaterialPageRoute(builder: (BuildContext context) => ResepMenuHome()),
      //         ),
      //         leading: const Icon(Icons.checklist_outlined),
      //         title: const Text(
      //           'Resep Makanan',
      //           style: TextStyle(fontSize: 16),
      //         ),
      //       ),
        Divider(
      color: kPrimaryColor,
      thickness: 1,
        ),
        ListTile(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => ayamHomePage()),
              ),
              leading: const Icon(Icons.check_box),
              title: const Text(
                'Takaran Menu Ayam',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => dagingHomePage()),
              ),
              leading: const Icon(Icons.check_box),
              title: const Text(
                'Takaran Menu Daging',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => seafoodHomePage()),
              ),
              leading: const Icon(Icons.check_box),
              title: const Text(
                'Takaran Menu Seafood',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext context) => pendampingHomePage()),
              ),
              leading: const Icon(Icons.check_box),
              title: const Text(
                'Takaran Menu Pendamping',
                style: TextStyle(fontSize: 16),
              ),
            ),
         Divider(
          color: kPrimaryColor,
          thickness: 1,
        ),
        ListTile(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        BottomNavControllerTangsel()),
              ),
              leading: const Icon(Icons.home_work),
              title: const Text(
                'Cabang Tangsel',
                style: TextStyle(fontSize: 16),
              ),
            ),
        ListTile(
          onTap: ()=>Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPageDepok()),
                  (route) => false),
          leading: const Icon(Icons.logout),
          title: const Text(
            'LOGOUT',
            style: TextStyle(fontSize: 16),
          ),
        ),
        // ListTile(
        //   onTap: () => Navigator.of(context).push(
        //       MaterialPageRoute(builder: (BuildContext context) => seafoodPage()),
        //     ),
        //   leading: const Icon(Icons.check_box),
        //   title: const Text(
        //     'Menu Seafood',
        //     style: TextStyle(fontSize: 16),
        //   ),
        // ),
        // ListTile(
        //   onTap: () => Navigator.of(context).push(
        //       MaterialPageRoute(builder: (BuildContext context) => pendampingPage()),
        //     ),
        //   leading: const Icon(Icons.check_box),
        //   title: const Text(
        //     'Menu Pendamping',
        //     style: TextStyle(fontSize: 16),
        //   ),
        // ),
        // Divider(
        //   color: kPrimaryColor,
        //   thickness: 1,
        // ),
        // ListTile(
        //   onTap: () => Navigator.of(context).push(
        //       MaterialPageRoute(builder: (BuildContext context) => JadwalMenu()),
        //     ),
        //   leading: const Icon(Icons.checklist_outlined),
        //   title: const Text(
        //     'Jadwal Menu',
        //     style: TextStyle(fontSize: 16),
        //   ),
        // ),
      ]),
    );
  }
}
