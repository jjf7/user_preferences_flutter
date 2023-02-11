import 'package:flutter/material.dart';
import 'package:user_preferences/providers/theme_provider.dart';
import 'package:user_preferences/screens/home_screen.dart';
import 'package:user_preferences/screens/preferences.dart';
import 'package:user_preferences/shared_preferences/settings.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Settings.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkMode: Settings.isDarkMode),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    ThemeData theme(String actualTheme) {
      return actualTheme == 'dark' ? ThemeData.dark() : ThemeData.light();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Preferences',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        PreferencesScreen.routeName: (_) => const PreferencesScreen(),
      },
      theme: theme(themeProvider.currentTheme).copyWith(
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
      ),
    );
  }
}
