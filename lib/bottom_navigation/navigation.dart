//import 'package:clean_bottom_navigation_bar/clean_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:routeplan/order_screen.dart';
import 'package:routeplan/bookings/bookings.dart';
import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
/* import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
 */
class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    OrderScreen(),
    Bookings(),
    Bookings(),
  ];

  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    final viewPadding = MediaQuery.of(context).viewPadding;
    double barHeight;
    double barHeightWithNotch = 67;
    double arcHeightWithNotch = 67;

    if (size.height > 700) {
      barHeight = 70;
    } else {
      barHeight = size.height * 0.1;
    }

    if (viewPadding.bottom > 0) {
      barHeightWithNotch = (size.height * 0.07) + viewPadding.bottom;
      arcHeightWithNotch = (size.height * 0.075) + viewPadding.bottom;
    }
    return Scaffold(
     /*  bottomNavigationBar: CleanNavigationBar(
        showFab: true,
        barHeight: 60,
        fabHeight: -30,
        currentIndex: _currentIndex,
        activeColor: Theme.of(context).primaryColor,
        tabColor: Theme.of(context).cardColor,
        indicatorColor: Theme.of(context).indicatorColor,
        titleStyle: Theme.of(context)
            .textTheme
            .caption
            /* .merge(TextStyle(color: Theme.of(context).cardColor)) */,
        onTap: onTabTapped,
        items: [
          CleanNavigationBarItem(title: Text('Home'), icon: Icons.home),
          CleanNavigationBarItem(title: Text('Search'), icon: Icons.search),
          CleanNavigationBarItem(title: Text('Bag'), icon: Icons.card_travel),
          CleanNavigationBarItem(
              title: Text('Orders'), icon: Icons.shopping_cart),
          CleanNavigationBarItem(
              title: Text('Settings'), icon: Icons.person_outline),
        ],
      ) */
      body: _children[_currentIndex],
     bottomNavigationBar: CircleBottomNavigationBar(
        initialSelection: _currentIndex,
        barHeight: viewPadding.bottom > 0 ? barHeightWithNotch : barHeight,
        arcHeight: viewPadding.bottom > 0 ? arcHeightWithNotch : barHeight,
        itemTextOff: viewPadding.bottom > 0 ? 0 : 1,
        itemTextOn: viewPadding.bottom > 0 ? 0 : 1,
        circleOutline: 15.0,
        shadowAllowance: 0.0,
        circleSize: 50.0,
        blurShadowRadius: 50.0,
        circleColor: Colors.blueAccent,
        activeIconColor: Colors.white,
        inactiveIconColor: Colors.grey,
        tabs: getTabsData(),
        onTabChangedListener: (index) => setState(() => _currentIndex = index),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

List<TabData> getTabsData() {
  return [
    TabData(
      icon: Icons.home,
      iconSize: 18,
      title: 'Home',
      fontSize: 9,
      fontWeight: FontWeight.bold,
    ),
    TabData(
      icon: Icons.menu_book_outlined,
      iconSize: 18,
      title: 'Order',
      fontSize: 9,
      fontWeight: FontWeight.bold,
    ),
    TabData(
      icon: Icons.verified_user_rounded,
      iconSize: 18,
      title: 'My Accounr',
      fontSize: 9,
      fontWeight: FontWeight.bold,
    ),
   
  ];
}