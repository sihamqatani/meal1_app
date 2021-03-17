import 'package:flutter/material.dart';
import 'package:meal1app/Modules/Cart.dart';
import 'package:meal1app/screens/Cart_Screen.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
    Container(
      color: Colors.white,
    ),
    Container(
      color: Colors.yellow,
    )
  ];
  int selectedPageIndex = 0;

  void pageView(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: bottomNavigatorSection(),
        body: pages[selectedPageIndex],
      ),
    );
  }

  bottomNavigatorSection() {
    return BottomNavigationBar(
      currentIndex: selectedPageIndex,
      selectedItemColor: Colors.red[100],
      onTap: pageView,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          //  activeIcon: ,
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'اطلب الآن',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.card_giftcard),
          label: 'العروض',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'مفضلاتي',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box),
          label: 'حسابي',
        ),
      ],
    );
  }
}
