import 'screens/league_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0A3441),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A3441),
        ),
      ),
      home: const LeagueHomePage(categories: ['МАТЧИ', 'НОВОСТИ', 'ТУРНИРЫ', 'КОМАНДЫ']),
    );
  }
}
