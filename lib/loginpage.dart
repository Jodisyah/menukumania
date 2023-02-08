import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:MenukuMania/Depok/bottom_nav_pages/bottom_nav_controller.dart';
import 'package:MenukuMania/splash_screen.dart';
import 'package:MenukuMania/theme.dart';
import 'package:MenukuMania/welcome_page.dart';
import 'package:MenukuMania/widgets/functions.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class LoginPageDepok extends StatefulWidget {
  const LoginPageDepok({super.key});
  @override
  State<LoginPageDepok> createState() => _LoginPageDepokState();
}

class _LoginPageDepokState extends State<LoginPageDepok> {
  TextEditingController econtroller = TextEditingController();
  TextEditingController pcontroller = TextEditingController();
  String error = "";
  bool isLoading = false;
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
            child: Container(
          color: kwhite,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                color: kwhite,
                height: 300,
                width: 270,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 65),
                  child: Image.asset(
                    "assets/logo2.png",
                    height: 50,
                    width: 10,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 210),
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                    color: kPrimaryColor,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          top: 30,
                          left: 24,
                          right: 24,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 23, top: 5),
                              child: Column(
                                children: [
                                  Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 33,
                                      fontWeight: FontWeight.w500,
                                      color: kwhite,
                                      // style: blackTextStyle.copyWith(
                                      //   fontSize: 24,
                                      //   fontWeight: semiBold,
                                      // ),
                                      // ),Container(color: kwhite,height: 5,width: 35,)
                                    ),
                                    //                     Padding(
                                    //     padding: const EdgeInsets.all(8.0),
                                    //     child: TextField(
                                    //       keyboardType: TextInputType.emailAddress,
                                    //       controller: econtroller,
                                    //       decoration: InputDecoration(
                                    //           hintText: 'Email',
                                    //           prefixIcon: const Icon(
                                    //             Icons.email,
                                    //             color: kPrimaryColor,
                                    //           ),border: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(30),
                                    //   ),
                                    //   focusedBorder: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(30),
                                    //     borderSide: const BorderSide(color: kPrimaryColor, width: 2),
                                    //   ),
                                    // ),
                                    //     ),
                                    //   ),
                                  )
                                ],
                              ),
                            ),
                            // Container(color: kwhite,height: 5,width: 35,)
                            // Text(
                            //   ' Show All',style: TextStyle(color: kwhite),
                            // style: blackTextStyle,
                            // ),
                          ],
                        ),
                      ),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 110, left: 15, right: 15),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: econtroller,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              prefixIcon: const Icon(Icons.email,
                                  color: Color.fromARGB(255, 48, 48, 48)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: kPrimaryColor, width: 2),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25, left: 15, right: 15),
                          child: TextField(
                            obscureText: true,
                            controller: pcontroller,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              prefixIcon: const Icon(Icons.password,
                                  color: Color.fromARGB(255, 48, 48, 48)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            error,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 10),
                            child: isLoading == true
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                //                 :Container(height: 50,width: 350,color: kblackcolor,decoration: BoxDecoration(color:kRedColor,
                                // borderRadius: BorderRadius.all(Radius.circular(30)), ))
                                : ElevatedButton(
                                    onPressed: () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      final respone =
                                          await FirebaseStoreMethods().login(
                                              econtroller.text,
                                              pcontroller.text);

                                      respone.fold((left) {
                                        setState(() {
                                          error = left.message;
                                        });
                                      }, (right) => print(right.user!.email));
                                      setState(() {
                                        isLoading = false;
                                      });

                                      if (error.isEmpty) {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                WelcomePage(),
                                          ),
                                          (route) => false,
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(82, 213, 108, 10),
                                        minimumSize: const Size.fromHeight(55),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        elevation: 0,
                                        shadowColor: kblackcolor),
                                    child: Text("MASUK...!!",
                                        style: GoogleFonts.poppins(
                                            color: kwhite,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  )),
                        //  Padding(
                        //    padding: const EdgeInsets.only(top: 140),
                        //                  child: Divider(
                        //   color: Color.fromARGB(255, 71, 71, 71),
                        //   thickness: 1,
                        // ),
                        //  ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 5,right: 250),
                        //   child: Text(
                        //     'MENUKU.ID',
                        //     style: GoogleFonts.poppins(
                        //       fontSize: 20,
                        //       fontWeight: FontWeight.w500,
                        //       color: Color.fromARGB(255, 71, 71, 71),
                        //     ),
                        //   ),
                        // ),
                        //  Padding(
                        //    padding: const EdgeInsets.only(right: 197),
                        //    child: Text(
                        //       'SOLUSI MENU HARIANMU',
                        //       style: GoogleFonts.poppins(
                        //         fontSize: 11,
                        //         fontWeight: FontWeight.w500,
                        //         color: kwhite
                        //       ),
                        //     ),
                        //  ),
                      ])
                    ],
                    // ),

                    // SizedBox(
                    //   height: 16,
                    // ),
                    // SizedBox(
                    //   height: 310,
                    //   child: SingleChildScrollView(
                    //     scrollDirection: Axis.horizontal,
                    //     // child: Row(
                    //     //   children: [
                    //     //     HomepopularItem(
                    //     //       title: 'Senin',
                    //     //       // imageUrl: 'assets/image_product_popular1.png',
                    //     //       price: 34,
                    //     //       isWhislist: true,
                    //     //     ),
                    //     //     HomepopularItem(
                    //     //       title: 'selasa',
                    //     //       // imageUrl: 'assets/image_product_popular2.png',
                    //     //       price: 20,
                    //     //       isWhislist: false,
                    //     //     ),
                    //     //     HomepopularItem(
                    //     //       title: 'Rabu',
                    //     //       // imageUrl: 'assets/image_product_popular3.png',
                    //     //       price: 28,
                    //     //       isWhislist: false,
                    //     //     ),
                    //     //     HomepopularItem(
                    //     //       title: 'Kamis',
                    //     //       // imageUrl: 'assets/image_product_popular3.png',
                    //     //       price: 28,
                    //     //       isWhislist: false,
                    //     //     ),
                    //     //     HomepopularItem(
                    //     //       title: 'Jumat',
                    //     //       // imageUrl: 'assets/image_product_popular3.png',
                    //     //       price: 28,
                    //     //       isWhislist: false,
                    //     //     ),
                    //     //   ],
                    //     // ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 55,
                    // )
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class LoginPageTangsel extends StatefulWidget {
  const LoginPageTangsel({super.key});
  @override
  State<LoginPageTangsel> createState() => _LoginPageTangselState();
}

class _LoginPageTangselState extends State<LoginPageTangsel> {
  TextEditingController econtroller = TextEditingController();
  TextEditingController pcontroller = TextEditingController();
  String error = "";
  bool isLoading = false;
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
            child: Container(
          color: kwhite,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                color: kwhite,
                height: 300,
                width: 270,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 65),
                  child: Image.asset(
                    "assets/logo2.png",
                    height: 50,
                    width: 10,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 210),
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                    color: kPrimaryColor,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          top: 30,
                          left: 24,
                          right: 24,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 23, top: 5),
                              child: Column(
                                children: [
                                  Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 33,
                                      fontWeight: FontWeight.w500,
                                      color: kwhite,
                                      // style: blackTextStyle.copyWith(
                                      //   fontSize: 24,
                                      //   fontWeight: semiBold,
                                      // ),
                                      // ),Container(color: kwhite,height: 5,width: 35,)
                                    ),
                                    //                     Padding(
                                    //     padding: const EdgeInsets.all(8.0),
                                    //     child: TextField(
                                    //       keyboardType: TextInputType.emailAddress,
                                    //       controller: econtroller,
                                    //       decoration: InputDecoration(
                                    //           hintText: 'Email',
                                    //           prefixIcon: const Icon(
                                    //             Icons.email,
                                    //             color: kPrimaryColor,
                                    //           ),border: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(30),
                                    //   ),
                                    //   focusedBorder: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(30),
                                    //     borderSide: const BorderSide(color: kPrimaryColor, width: 2),
                                    //   ),
                                    // ),
                                    //     ),
                                    //   ),
                                  )
                                ],
                              ),
                            ),
                            // Container(color: kwhite,height: 5,width: 35,)
                            // Text(
                            //   ' Show All',style: TextStyle(color: kwhite),
                            // style: blackTextStyle,
                            // ),
                          ],
                        ),
                      ),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 110, left: 15, right: 15),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: econtroller,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              prefixIcon: const Icon(Icons.email,
                                  color: Color.fromARGB(255, 48, 48, 48)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: kPrimaryColor, width: 2),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25, left: 15, right: 15),
                          child: TextField(
                            obscureText: true,
                            controller: pcontroller,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              prefixIcon: const Icon(Icons.password,
                                  color: Color.fromARGB(255, 48, 48, 48)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            error,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 10),
                            child: isLoading == true
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                //                 :Container(height: 50,width: 350,color: kblackcolor,decoration: BoxDecoration(color:kRedColor,
                                // borderRadius: BorderRadius.all(Radius.circular(30)), ))
                                : ElevatedButton(
                                    onPressed: () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      final respone =
                                          await FirebaseStoreMethods().login(
                                              econtroller.text,
                                              pcontroller.text);

                                      respone.fold((left) {
                                        setState(() {
                                          error = left.message;
                                        });
                                      }, (right) => print(right.user!.email));
                                      setState(() {
                                        isLoading = false;
                                      });

                                      if (error.isEmpty) {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  BottomNavControllerDepok()),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(82, 213, 108, 10),
                                        minimumSize: const Size.fromHeight(55),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        elevation: 0,
                                        shadowColor: kblackcolor),
                                    child: Text("MASUK...!!",
                                        style: GoogleFonts.poppins(
                                            color: kwhite,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  )),
                        //  Padding(
                        //    padding: const EdgeInsets.only(top: 140),
                        //                  child: Divider(
                        //   color: Color.fromARGB(255, 71, 71, 71),
                        //   thickness: 1,
                        // ),
                        //  ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 5,right: 250),
                        //   child: Text(
                        //     'MENUKU.ID',
                        //     style: GoogleFonts.poppins(
                        //       fontSize: 20,
                        //       fontWeight: FontWeight.w500,
                        //       color: Color.fromARGB(255, 71, 71, 71),
                        //     ),
                        //   ),
                        // ),
                        //  Padding(
                        //    padding: const EdgeInsets.only(right: 197),
                        //    child: Text(
                        //       'SOLUSI MENU HARIANMU',
                        //       style: GoogleFonts.poppins(
                        //         fontSize: 11,
                        //         fontWeight: FontWeight.w500,
                        //         color: kwhite
                        //       ),
                        //     ),
                        //  ),
                      ])
                    ],
                    // ),

                    // SizedBox(
                    //   height: 16,
                    // ),
                    // SizedBox(
                    //   height: 310,
                    //   child: SingleChildScrollView(
                    //     scrollDirection: Axis.horizontal,
                    //     // child: Row(
                    //     //   children: [
                    //     //     HomepopularItem(
                    //     //       title: 'Senin',
                    //     //       // imageUrl: 'assets/image_product_popular1.png',
                    //     //       price: 34,
                    //     //       isWhislist: true,
                    //     //     ),
                    //     //     HomepopularItem(
                    //     //       title: 'selasa',
                    //     //       // imageUrl: 'assets/image_product_popular2.png',
                    //     //       price: 20,
                    //     //       isWhislist: false,
                    //     //     ),
                    //     //     HomepopularItem(
                    //     //       title: 'Rabu',
                    //     //       // imageUrl: 'assets/image_product_popular3.png',
                    //     //       price: 28,
                    //     //       isWhislist: false,
                    //     //     ),
                    //     //     HomepopularItem(
                    //     //       title: 'Kamis',
                    //     //       // imageUrl: 'assets/image_product_popular3.png',
                    //     //       price: 28,
                    //     //       isWhislist: false,
                    //     //     ),
                    //     //     HomepopularItem(
                    //     //       title: 'Jumat',
                    //     //       // imageUrl: 'assets/image_product_popular3.png',
                    //     //       price: 28,
                    //     //       isWhislist: false,
                    //     //     ),
                    //     //   ],
                    //     // ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 55,
                    // )
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
