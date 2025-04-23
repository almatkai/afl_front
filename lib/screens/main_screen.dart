import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главный экран'),
        backgroundColor: const Color(0xFF0A3441),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF0A3441),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Color(0xFF0A3441)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Имя пользователя',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'example@mail.com',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Уведомления'),
              onTap: () {
                // Handle notifications tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Избранные команды'),
              onTap: () {
                // Handle liked teams tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Настройки'),
              onTap: () {
                // Handle settings tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Выйти'),
              onTap: () {
                // Handle logout tap
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Placeholder for recent results
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text(
              'Последние результаты матчей',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Placeholder for upcoming matches
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text(
              'Текущие и предстоящие матчи',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Placeholder for favorite teams/leagues
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text(
              'Избранные команды/лиги',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Placeholder for league news
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text(
              'Новости лиги',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
