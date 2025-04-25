import 'package:flutter/material.dart';
import 'team_details_page.dart';

class MatchDetailsPage extends StatelessWidget {
  final Map<String, dynamic> match;

  const MatchDetailsPage({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Map<String, String>>> teamLineups = {
      'team1': [
        {'name': 'Алексей Петров', 'position': 'Вратарь', 'number': '1'},
        {'name': 'Максим Иванов', 'position': 'Защитник', 'number': '4'},
        {'name': 'Денис Смирнов', 'position': 'Защитник', 'number': '5'},
        {'name': 'Артем Козлов', 'position': 'Полузащитник', 'number': '8'},
        {'name': 'Николай Морозов', 'position': 'Полузащитник', 'number': '10'},
        {'name': 'Андрей Волков', 'position': 'Нападающий', 'number': '9'},
      ],
      'team2': [
        {'name': 'Сергей Новиков', 'position': 'Вратарь', 'number': '1'},
        {'name': 'Игорь Соколов', 'position': 'Защитник', 'number': '2'},
        {'name': 'Павел Федоров', 'position': 'Защитник', 'number': '3'},
        {'name': 'Дмитрий Попов', 'position': 'Полузащитник', 'number': '7'},
        {'name': 'Владимир Лебедев', 'position': 'Полузащитник', 'number': '11'},
        {'name': 'Михаил Комаров', 'position': 'Нападающий', 'number': '9'},
      ],
    };

    final Map<String, List<Map<String, String>>> matchEvents = {
      'events': [
        {'time': '15\'', 'type': 'Гол', 'player': 'Андрей Волков', 'team': match['team1']},
        {'time': '32\'', 'type': 'Желтая карточка', 'player': 'Игорь Соколов', 'team': match['team2']},
        {'time': '45\'', 'type': 'Гол', 'player': 'Михаил Комаров', 'team': match['team2']},
        {'time': '67\'', 'type': 'Гол', 'player': 'Андрей Волков', 'team': match['team1']},
      ],
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('${match['team1']} vs ${match['team2']}'),
        backgroundColor: const Color(0xFF0A3441),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Score section
            Container(
              color: const Color(0xFF0A3441),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TeamDetailsPage(teamName: match['team1']),
                          ),
                        );
                      },
                      child: Text(
                        match['team1'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      match['score'] ?? '0 - 0',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TeamDetailsPage(teamName: match['team2']),
                          ),
                        );
                      },
                      child: Text(
                        match['team2'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Match events
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'События матча',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...matchEvents['events']!.map((event) {
                    IconData icon;
                    Color color;
                    switch (event['type']) {
                      case 'Гол':
                        icon = Icons.sports_soccer;
                        color = Colors.green;
                        break;
                      case 'Желтая карточка':
                        icon = Icons.square;
                        color = Colors.yellow;
                        break;
                      default:
                        icon = Icons.sports_soccer;
                        color = Colors.black;
                    }
                    return ListTile(
                      leading: Text(event['time']!),
                      title: Row(
                        children: [
                          Icon(icon, color: color),
                          const SizedBox(width: 8),
                          Text('${event['player']} (${event['team']})'),
                        ],
                      ),
                      subtitle: Text(event['type']!),
                    );
                  }).toList(),
                ],
              ),
            ),

            // Team lineups
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Составы команд',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Team 1 lineup
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              match['team1'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            ...teamLineups['team1']!.map((player) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                '${player['number']}. ${player['name']} (${player['position']})',
                                style: const TextStyle(fontSize: 12),
                              ),
                            )).toList(),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Team 2 lineup
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              match['team2'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            ...teamLineups['team2']!.map((player) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                '${player['number']}. ${player['name']} (${player['position']})',
                                style: const TextStyle(fontSize: 12),
                              ),
                            )).toList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
