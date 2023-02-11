import 'package:flutter/material.dart';
import 'package:user_preferences/screens/home_screen.dart';
import 'package:user_preferences/screens/preferences.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/menu-img.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(),
          ),
          ListTile(
            leading: const Icon(Icons.supervised_user_circle_outlined),
            title: const Text('User Information'),
            onTap: () =>
                Navigator.pushReplacementNamed(context, HomeScreen.routeName),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.contact_page_outlined),
            title: const Text('Page'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => Navigator.pushReplacementNamed(
                context, PreferencesScreen.routeName),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
