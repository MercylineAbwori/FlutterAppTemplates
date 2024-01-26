import 'package:flutter/material.dart';
import 'package:flutter_app_template/components/home.dart';
import 'package:flutter_app_template/components/settings.dart';
import 'package:flutter_app_template/shared/bottom_navbar.dart';

class NavigationPage extends StatefulWidget {

  const NavigationPage({super.key});
  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final _tab1navigatorKey = GlobalKey<NavigatorState>();
  final _tab2navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return PersistentBottomBarScaffold(
      items: [
        PersistentTabItem(
          tab: HomePage(),
          icon: Icons.home_max,
          title: 'Home',
          navigatorkey: _tab1navigatorKey,
        ),
        PersistentTabItem(
          tab: const SettingsPage(),
          icon: Icons.settings,
          title: 'Settings',
          navigatorkey: _tab2navigatorKey,
        ),
      ],
    );
  }
}

