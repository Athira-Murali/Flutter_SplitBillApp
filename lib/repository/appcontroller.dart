import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  checkLoginStatus() {
    if (_auth.currentUser != null) {
      Get.toNamed('/bottomnav');
    } else {
      Get.toNamed('/');
    }
  }
}






// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:personal_wallet/login/login_view.dart';
// import 'package:personal_wallet/screens/bottomnav/bottom_navigationbar.dart';

// class Authenticate extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     if (_auth.currentUser != null) {
//       return const BottomNavBarView();
//     } else {
//       return const LoginScreen();
//     }
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get/get.dart';

// enum LoggedStatus { loggedInitial, notLoggedIn, loggedIn }

// class AppController extends GetxController {
//   static AppController get to => Get.find();
//   final isLogged = LoggedStatus.loggedInitial.obs;
//   final storage = const FlutterSecureStorage();

//   checkLoginStatus() async {
//     String? value = await storage.read(key: "uid");
//     if (value == null) {
//       isLogged.value = LoggedStatus.loggedInitial;
//     } else {
//       isLogged.value = LoggedStatus.loggedIn;
//     }
//   }

//   @override
//   onInit() {
//     super.onInit();
//     checkLoginStatus();
//     ever(isLogged, _fireRoute);
//   }

//   _fireRoute(logged) async {
//     if (logged == LoggedStatus.loggedIn) {
//       Get.offAllNamed("/homepage");
//     } else if (logged == LoggedStatus.notLoggedIn) {
//       Get.offAllNamed("/signin");
//     }
//   }

//   loggedIn() {
//     debugPrint('loggedIn');
//     isLogged.value = LoggedStatus.loggedIn;
//   }

//   notLoggedIn() {
//     debugPrint('notloggedIn');
//     isLogged.value = LoggedStatus.notLoggedIn;
//   }

//   loggedOut() {
//     debugPrint('loggedOut');
//     isLogged.value = LoggedStatus.notLoggedIn;
//     Get.offAllNamed('/signin');
//   }
// }

