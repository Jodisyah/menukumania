// // import 'package:app_arraudhah/Errors/error.dart';
// // import 'package:either_dart/either.dart';
// import 'package:datacust_2/widgets/Errors/error.dart';
// import 'package:either_dart/either.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// // class Functions {
// //   FirebaseAuth auth = FirebaseAuth.instance;
// //   FirebaseFirestore firestore = FirebaseFirestore.instance;

// //   Map<String, bool> bookmarks = {};

// //   Future<bool> signin(String email, String password) async {
// //     try {
// //       UserCredential userCredential = await auth.signInWithEmailAndPassword(
// //           email: email, password: password);

// //       return true;
// //     } on FirebaseAuthException catch (e) {
// //       if (e.code == 'user-not-found') {
// //         print('No user found for that email.');
// //       } else if (e.code == 'wrong-password') {
// //         print('Wrong password provided for that user.');
// //       }

// //       return false;
// //     }
// //   }

// //   Future<bool> register(String email, String password) async {
// //     try {
// //       UserCredential userCredential = await auth.createUserWithEmailAndPassword(
// //         email: email,
// //         password: password,
// //       );
// //       return true;
// //     } on FirebaseAuthException catch (e) {
// //       if (e.code == 'weak-password') {
// //         print('The password provided is too weak.');
// //       } else if (e.code == 'email-already-in-use') {
// //         print('The account already exists for that email.');
// //       }
// //     } catch (e) {
// //       print(e);
// //     }
// //     return false;
// //   }


// // signup function
// class FirebaseStoreMethods {
//   FirebaseAuth auth = FirebaseAuth.instance;
//    FirebaseFirestore firestore = FirebaseFirestore.instance;

//   Map<String, bool> bookmarks = {};

//   Future<Either<CustomError, UserCredential>> signUp(
//       String email, String password) async {
//     try {
//       UserCredential user = await auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       return Right(user);
//     } catch (e) {
//       return Left(CustomError(message: e.toString()));
//     }
//   }

//   Future<void> signOut() async {
//     await auth.signOut();
//   }


// // signin function
//   Future<Either<CustomError, UserCredential>> login(
//       String email, String password) async {
//     try {
//       UserCredential user = await auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       return Right(user);
//     } catch (e) {
//       return Left(CustomError(message: e.toString()));
//     }
//   }

//   Future<void> getitems() async {
//     await firestore
//         .collection("items")
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//       for (var element in querySnapshot.docs) {
//         bookmarks[element["name"].toString()] = false;
//       }
//     });

//     await firestore
//         .collection("users")
//         .add({"email": auth.currentUser!.email, "bookmarks": bookmarks});
//   }
// // -------------------------------------------------------
//   Future<void> getitmeslogin() async {
//     await firestore
//         .collection("users")
//         .where("email", isEqualTo: auth.currentUser!.email)
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//       for (var element in querySnapshot.docs) {
//         bookmarks = Map.from(element["bookmarks"]);
//       }
//     });
//   }

//   Future<void> update(String email, String item) async {
//     Map<String, bool> bookmark = {};

//     await firestore
//         .collection("users")
//         .where("email", isEqualTo: email)
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//       for (var element in querySnapshot.docs) {
//         bookmark = Map.from(element["bookmarks"]);
//         print(bookmark);
//       }
//     });

//     for (var element in bookmark.keys) {
//       if (element == item) {
//         bookmark[item] = bookmark[item]! ? false : true;
//       }
//     }

//     await firestore
//         .collection("users")
//         .where("email", isEqualTo: email)
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//       for (var element in querySnapshot.docs) {
//         element.reference.update({"bookmarks": bookmark});
//       }
//     });

//     await getitmeslogin();
//   }
// }

// //ini dia dari sebelah

// class FireAuth {
//   // For registering a new user
//   static Future<User?> registerUsingEmailPassword({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;

//     try {
//       UserCredential userCredential = await auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       user = userCredential.user;
//       await user!.updateProfile(displayName: name);
//       await user.reload();
//       user = auth.currentUser;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }

//     return user;
//   }

//   // For signing in an user (have already registered)
//   // static Future<User?> signInUsingEmailPassword({
//   //   required String email,
//   //   required String password,
//   // }) async {
//   //   FirebaseAuth auth = FirebaseAuth.instance;
//   //   User? user;

//   //   try {
//   //     UserCredential userCredential = await auth.signInWithEmailAndPassword(
//   //       email: email,
//   //       password: password,
//   //     );
//   //     user = userCredential.user;
//   //   } on FirebaseAuthException catch (e) {
//   //     if (e.code == 'user-not-found') {
//   //       print('No user found for that email.');
//   //     } else if (e.code == 'wrong-password') {
//   //       print('Wrong password provided.');
//   //     }
//   //   }

//   //   return user;
//   // }

//   static Future<User?> refreshUser(User user) async {
//     FirebaseAuth auth = FirebaseAuth.instance;

//     await user.reload();
//     User? refreshedUser = auth.currentUser;

//     return refreshedUser;
//   }
// }





// import 'package:datacust_2/widgets/Errors/error.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:MenukuMania/widgets/Errors/error.dart';
// class Functions {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   FirebaseFirestore firestore = FirebaseFirestore.instance;

//   Map<String, bool> bookmarks = {};

//   Future<bool> signin(String email, String password) async {
//     try {
//       UserCredential userCredential = await auth.signInWithEmailAndPassword(
//           email: email, password: password);

//       return true;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');
//       }

//       return false;
//     }
//   }

//   Future<bool> register(String email, String password) async {
//     try {
//       UserCredential userCredential = await auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return true;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//     return false;
//   }


// signup function
class FirebaseStoreMethods {
  FirebaseAuth auth = FirebaseAuth.instance;
   FirebaseFirestore firestore = FirebaseFirestore.instance;

  Map<String, bool> bookmarks = {};

  Future<Either<CustomError, UserCredential>> signUp(
      String email, String password) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(user);
    } catch (e) {
      return Left(CustomError(message: e.toString()));
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }


// signin function
  Future<Either<CustomError, UserCredential>> login(
      String email, String password) async {
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(user);
    } catch (e) {
      return Left(CustomError(message: e.toString()));
    }
  }

  Future<void> getitems() async {
    await firestore
        .collection("items")
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var element in querySnapshot.docs) {
        bookmarks[element["name"].toString()] = false;
      }
    });

    await firestore
        .collection("users")
        .add({"email": auth.currentUser!.email, "bookmarks": bookmarks});
  }
// -------------------------------------------------------
  Future<void> getitmeslogin() async {
    await firestore
        .collection("users")
        .where("email", isEqualTo: auth.currentUser!.email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var element in querySnapshot.docs) {
        bookmarks = Map.from(element["bookmarks"]);
      }
    });
  }

  Future<void> update(String email, String item) async {
    Map<String, bool> bookmark = {};

    await firestore
        .collection("users")
        .where("email", isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var element in querySnapshot.docs) {
        bookmark = Map.from(element["bookmarks"]);
        print(bookmark);
      }
    });

    for (var element in bookmark.keys) {
      if (element == item) {
        bookmark[item] = bookmark[item]! ? false : true;
      }
    }

    await firestore
        .collection("users")
        .where("email", isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var element in querySnapshot.docs) {
        element.reference.update({"bookmarks": bookmark});
      }
    });

    await getitmeslogin();
  }
}

//ini dia dari sebelah

class FireAuth {
  // For registering a new user
  static Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
      await user!.updateProfile(displayName: name);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    return user;
  }

  // For signing in an user (have already registered)
  // static Future<User?> signInUsingEmailPassword({
  //   required String email,
  //   required String password,
  // }) async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user;

  //   try {
  //     UserCredential userCredential = await auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     user = userCredential.user;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided.');
  //     }
  //   }

  //   return user;
  // }

  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }
}
