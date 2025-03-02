import 'dart:io';

import 'package:biteblitz/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../view/CartScreen/cart_view.dart';
import '../view/HomeScreen/home_view.dart';
import '../view/MoreScreen/more_view.dart';
import '../view/ProfileScreen/profile_view.dart';
import '../view/SearchScreen/serach_view.dart';
import 'customdialog.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int? selectedIndex;
  const CustomBottomNavigationBar(this.selectedIndex, {super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex!; // Set the initial index
  }
  int _currentIndex = 0;
  final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog(
                  message:
                  const Text('Do yo want to exit!'),
                  onpressedYes: () {
                    exit(0);
                  },
                  onpressedNo: () {
                    Get.back();
                  },
                  title: const Text('Confirm It!'));
            });
      },
      child:
      SizedBox(
        height: 25,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Navigator(
            key: navigatorKey, // Use the GlobalKey here
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) {
                  return _buildScreenForIndex(_currentIndex);
                },
              );
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: primaryColor,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey.shade700,
            selectedFontSize: 16,
            unselectedFontSize: 14,


            type: BottomNavigationBarType.fixed,

            currentIndex: _currentIndex,
            onTap: _onTabTapped,
            items: [
              BottomNavigationBarItem(
                icon: _buildIcon(
                    0,
                    Icons.home_outlined
                ),
                activeIcon: _buildIcon(
                    0,
                    Icons.home
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(
                    1,Icons.search
                  //  CupertinoIcons.profile_circled,
                ),
                activeIcon:_buildIcon(
                  1,Icons.search
                //  CupertinoIcons.profile_circled,
              ) ,
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(
                    2,Icons.shopping_cart_outlined
                  //CupertinoIcons.bell,
                ),
                label: 'MyCart',
                activeIcon:_buildIcon(
                    2,Icons.shopping_cart
                  //CupertinoIcons.bell,
                ),
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(
                    3,Icons.person_outline                //Icons.more_horiz,
                ),
                activeIcon:_buildIcon(
                    3,Icons.person                //Icons.more_horiz,
                ) ,
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(
                    4,Icons.menu
                  //Icons.more_horiz,
                ),
                activeIcon:_buildIcon(
                  4,Icons.menu
                //Icons.more_horiz,
              ) ,
                label: 'More',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(int index,IconData icon) {
    return Container(
      width: 40, // Adjust the size of the circle as needed
      height: 30, // Adjust the size of the circle as needed
      decoration: BoxDecoration(

        color: _currentIndex == index ? Colors.transparent : Colors.transparent,
      ),
      child: Center
        (
        child: Icon(
          icon,
          size: 22,

        ),
      ),
    );
  }

  //color: _currentIndex == index ? Colors.white : Colors.black,

  Widget _buildScreenForIndex(int index) {
    switch (index) {
      case 0:

        return const MyHome(offer_id: "", offer_title: '',);
      case 1:
        return MySearch();
      case 2:
        return  const MyCart();
      case 3:
        return  const MyProfile();
      case 4:
        return const MyMore();
      default:
        return Container(); // Handle invalid index
    }
  }
}