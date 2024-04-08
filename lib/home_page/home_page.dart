import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../add_products/view/add_products.dart';
import '../all_products/all_products.dart';
import '../auth/login_page.dart';
import '../constants.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomNavIndex = 0;

  //List of the pages
  final List<Widget> _widgetOptions = [
    const AllProducts(),
    const AddProducts(),
  ];

  //List of the pages icons
  List<IconData> iconList = [
    Icons.store,
    Icons.add_box,
  ];

  List<String> titleList = [
    'All Products',
    'Add Products',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[_bottomNavIndex],
              style: TextStyle(
                color: Constants.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            // Icon(
            //   Icons.notifications,
            //   color: Constants.blackColor,
            //   size: 30.0,
            // )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: _widgetOptions[_bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseAuth.instance.signOut().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>const SignIn()), (route) => false)

          });

        },
        backgroundColor: Constants.primaryColor,
        child: const Icon(Icons.login,color: Colors.white,)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: AnimatedBottomNavigationBar(
          splashColor: Constants.primaryColor,
          activeColor: Constants.primaryColor,
          inactiveColor: Colors.black.withOpacity(.5),
          icons: iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
            });
          }),
    );
  }
}
