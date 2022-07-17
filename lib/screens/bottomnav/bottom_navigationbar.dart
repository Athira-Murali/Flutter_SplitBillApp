import 'package:flutter/material.dart';
import 'package:personal_wallet/screens/bottomnav/widgets/bottom_navigation.dart';

import 'package:personal_wallet/screens/home/homeview.dart';

import 'package:personal_wallet/screens/notification/notification_view.dart';
import 'package:personal_wallet/screens/profile/profile_view.dart';
import 'package:personal_wallet/screens/search/search_view.dart';

class BottomNavBarView extends StatelessWidget {
  const BottomNavBarView({Key? key}) : super(key: key);
  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = const [
    HomeScreens(),
    //SplitView(),
    SearchScreen(),

    ProfileScreens(),
    NotificationScreens()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      // bottomNavigationBar: const MoneyManagerBottomNavigation(),
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: selectedIndexNotifier,
        builder: (BuildContext context, int updatedIndex, Widget? _) {
          return _pages[updatedIndex];
        },
      )),
      bottomNavigationBar: const BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: SizedBox(
            height: 64,
            child: MoneyManagerBottomNavigation(),
          )),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            debugPrint("add transactions");
          } else {
            debugPrint("add category");
          }
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: const MoneyManagerBottomNavigation(),
    );
  }
}
