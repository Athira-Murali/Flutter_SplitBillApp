import 'package:get/get.dart';
import 'package:personal_wallet/login/login_view.dart';
import 'package:personal_wallet/register/register_view.dart';
import 'package:personal_wallet/resetpassword/reset_password.dart';
import 'package:personal_wallet/screens/bottomnav/bottom_navigationbar.dart';
import 'package:personal_wallet/screens/group_chate/group_chate_homescreen.dart';

import 'package:personal_wallet/screens/home/homeview.dart';
import 'package:personal_wallet/screens/splitnow/splitnow_view.dart';



List<GetPage> routes() => [
      GetPage(
          name: "/",
          page: () => const LoginScreen(),
          transition: Transition.cupertino),
           GetPage(
          name: "/bottomnav",
          page: () => const BottomNavBarView(),
          transition: Transition.cupertino),

      GetPage(
          name: "/register",
          page: () => const RegisterScreen(),
          transition: Transition.cupertino),
      GetPage(
          name: "/reset",
          page: () => const ResetPassword(),
          transition: Transition.cupertino),

      GetPage(
          name: "/splitnow",
          page: () => const SplitNow(),
          transition: Transition.cupertino),

      GetPage(
          name: "/home",
          page: () => const HomeScreens(),
          transition: Transition.cupertino),
      GetPage(
          name: "/new_group",
          page: () => const GroupChatHomeScreen(),
          transition: Transition.cupertino),

      //  GetPage(
      // name: "/fetchname",
      // page: () =>  FetchnameView(),
      // transition: Transition.cupertino),

      //const BottomNavBarView(),
      // LoginScreen()
    ];
