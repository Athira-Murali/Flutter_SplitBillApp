import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_wallet/repository/appcontroller.dart';
import 'package:personal_wallet/utils/routes.dart';
import 'package:personal_wallet/utils/theme/app_theme.dart';

import 'package:get/get.dart';

Future<void> initToffeeRideApp() async {
  debugPrint("SplitBill App : initializing Firebase");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeAppControllers();

  // await Future.wait<void>([
  //   if (TRPlatformSupport.isFirebaseSupported())
  //     Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
  //   initializeAppControllers(),
  // ]);

  //should only call after initialize app controller
  //AppController.to.navigateBasedOnLogin();
}

Future<void> initializeAppControllers() async {
  Get.put(AppController(), permanent: true);
  debugPrint("SplitBillApp : AppController sucessfully initialized");
}

class SplitBillApp extends StatelessWidget {
  const SplitBillApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      getPages: routes(),
      // home: const HomeScreens()
    );
  }
}
