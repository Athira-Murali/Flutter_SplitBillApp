
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:personal_wallet/utils/routes.dart';
// import 'package:personal_wallet/utils/theme/app_theme.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: AppTheme.lightTheme,
//       getPages: routes(),
//       // home: const HomeScreens()
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:personal_wallet/splitbill_app.dart';

void main() async {
  await initToffeeRideApp();
  runApp(const SplitBillApp());
}




