import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_preferences/shared_preferences/settings.dart';

import '../providers/theme_provider.dart';
import '../widgets/side_menu.dart';

class PreferencesScreen extends StatefulWidget {
  static String routeName = 'preferences';
  const PreferencesScreen({Key? key}) : super(key: key);

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              SwitchListTile.adaptive(
                value: Settings.isDarkMode,
                title: const Text('Dark Mode'),
                onChanged: (value) {
                  final ThemeProvider themeProvider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  Settings.isDarkMode = value;

                  value
                      ? themeProvider.setThemeDark()
                      : themeProvider.setThemeLight();

                  setState(() {});
                },
              ),
              const Divider(),
              RadioListTile(
                value: 1,
                groupValue: Settings.gender,
                title: const Text('Masculino'),
                onChanged: (value) {
                  Settings.gender = value ?? 1;
                  setState(() {});
                },
              ),
              RadioListTile(
                value: 2,
                groupValue: Settings.gender,
                title: const Text('Femenino'),
                onChanged: (value) {
                  Settings.gender = value ?? 2;
                  setState(() {});
                },
              ),
              const Divider(),
              TextFormField(
                initialValue: Settings.name,
                decoration: const InputDecoration(
                  label: Text('Name User'),
                  helperText: 'Introduce name',
                ),
                onChanged: (value) {
                  Settings.name = value;
                  setState(() {});
                },
              )
            ],
          )),
    );
  }
}
