import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/custom_icon.dart';
import 'package:myapp/modules/customers/customers.dart';
import 'package:myapp/modules/home/home.dart';
import 'package:myapp/modules/invoice/invoice.dart';
import 'package:myapp/modules/profile/profile.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(context,
        controller: _controller,
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style6,
        padding: const NavBarPadding.symmetric(vertical: 16),
        navBarHeight: 77,
        decoration: const NavBarDecoration(boxShadow: [
          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.05), blurRadius: 15)
        ]),
        confineInSafeArea: true,
        resizeToAvoidBottomInset: true,
        items: [
          PersistentBottomNavBarItem(
            contentPadding: 0,
            icon: const Icon(CustomIcon.home),
            title: ("Home"),
            activeColorPrimary: Theme.of(context).colorScheme.primary,
            inactiveColorPrimary: Theme.of(context).colorScheme.secondary,
          ),
          PersistentBottomNavBarItem(
            contentPadding: 0,
            icon: const Icon(CustomIcon.people),
            title: ("Customer"),
            activeColorPrimary: Theme.of(context).colorScheme.primary,
            inactiveColorPrimary: Theme.of(context).colorScheme.tertiary,
          ),
          PersistentBottomNavBarItem(
            contentPadding: 0,
            icon: const Icon(CustomIcon.receipt_2),
            title: ("Invoice"),
            activeColorPrimary: Theme.of(context).colorScheme.primary,
            inactiveColorPrimary: Theme.of(context).colorScheme.tertiary,
          ),
          PersistentBottomNavBarItem(
            contentPadding: 0,
            icon: const Icon(CustomIcon.setting_2),
            title: ("Settings"),
            activeColorPrimary: Theme.of(context).colorScheme.primary,
            inactiveColorPrimary: Theme.of(context).colorScheme.tertiary,
          ),
        ],
        screens: const [
          Home(),
          Customer(),
          Invoice(),
          Profile()
        ]);
  }
}
