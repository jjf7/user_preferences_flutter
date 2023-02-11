import 'package:flutter/material.dart';
import 'package:user_preferences/shared_preferences/settings.dart';
import 'package:user_preferences/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontSize: 30);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Preferences'),
      ),
      drawer: const SideMenu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'IsDarkMode: ${Settings.isDarkMode}',
              style: textStyle,
            ),
            const Divider(),
            Text(
              'Gender: ${Settings.gender}',
              style: textStyle,
            ),
            const Divider(),
            Text(
              'Name: ${Settings.name}',
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
