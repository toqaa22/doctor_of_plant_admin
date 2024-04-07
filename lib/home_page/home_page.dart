import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../add_fertlizers/view/add_fertlizers.dart';
import '../add_plant/view/add_plant_view.dart';
import '../all_products/all_products.dart';
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
    const AddPlantView(),
    const AddFertlizers(),
    const AddFertlizers(),

  ];

  //List of the pages icons
  List<IconData> iconList = [
    Icons.store,
    Icons.add_box,
    Icons.store,
    Icons.add_box,


  ];

  //List of the pages titles
  List<String> titleList = [
    'All plants',
    'Add Plants',
    'all Fertlizers',
    'Add Fertlizers',

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

