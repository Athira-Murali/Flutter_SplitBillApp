import 'package:flutter/material.dart';
import 'package:personal_wallet/screens/bottomnav/bottom_navigationbar.dart';



class MoneyManagerBottomNavigation extends StatelessWidget {
  const MoneyManagerBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: BottomNavBarView.selectedIndexNotifier,
      builder: (BuildContext context, int updatedIndex, Widget? _){
        return BottomNavigationBar(
          
          elevation: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
        currentIndex: updatedIndex,
        onTap: (newIndex){BottomNavBarView.selectedIndexNotifier.value = newIndex;},
        items:const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
      ]
      );
      },
    );
  }
}
