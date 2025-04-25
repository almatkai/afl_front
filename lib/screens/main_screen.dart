import 'package:flutter/material.dart';
import 'league_home_page.dart';

class MainScreen extends StatelessWidget {
  final List<String> categories = ['МАТЧИ', 'НОВОСТИ', 'ТУРНИРЫ', 'КОМАНДЫ'];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LeagueHomePage(categories: categories);
  }
}
