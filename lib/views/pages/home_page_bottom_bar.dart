import 'package:flutter/material.dart';
import 'package:just_travel/providers/auth_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_navbar/navbar_items.dart';
import '../widgets/bottom_navbar/screens.dart';

class HomePageBottomBar extends StatelessWidget {
  static const String routeName = '/home_bottom_bar';
  const HomePageBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);

    return Consumer<AuthProvider>(
      builder: (context, value, child) => PersistentTabView(
        context,
        controller: _controller,
        screens: screens(),
        items: navBarsItems(),
        confineInSafeArea: true,
        hideNavigationBar: value.isSignOut,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),

        navBarStyle: NavBarStyle
            .style1, //// Choose the nav bar style with this property.
      ),
    );
  }
}
