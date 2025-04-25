import 'package:flutter/material.dart';

class TeamDetailsPage extends StatelessWidget {
  final String teamName;

  const TeamDetailsPage({super.key, required this.teamName});

  Map<String, dynamic> get teamData {
    switch (teamName) {
      case 'Abyroi School':
        return {
          'fullName': 'Футбольный Клуб Абырой Скул',
          'founded': '2018',
          'coach': 'Александр Петров',
          'homeStadium': 'Стадион "Абырой"',
          'teamColors': ['Синий', 'Белый'],
          'players': [
            {
              'name': 'Алексей Петров',
              'number': '1',
              'position': 'Вратарь',
              'age': '28',
              'stats': {'matches': '15', 'cleanSheets': '6'}
            },
            {
              'name': 'Максим Иванов',
              'number': '4',
              'position': 'Защитник',
              'age': '25',
              'stats': {'matches': '18', 'goals': '2'}
            },
            {
              'name': 'Денис Смирнов',
              'number': '5',
              'position': 'Защитник',
              'age': '24',
              'stats': {'matches': '16', 'assists': '3'}
            },
            {
              'name': 'Артем Козлов',
              'number': '8',
              'position': 'Полузащитник',
              'age': '23',
              'stats': {'matches': '17', 'goals': '5', 'assists': '7'}
            },
            {
              'name': 'Николай Морозов',
              'number': '10',
              'position': 'Полузащитник',
              'age': '26',
              'stats': {'matches': '18', 'goals': '8', 'assists': '5'}
            },
            {
              'name': 'Андрей Волков',
              'number': '9',
              'position': 'Нападающий',
              'age': '27',
              'stats': {'matches': '16', 'goals': '12', 'assists': '4'}
            },
          ],
          'recentResults': [
            {'opponent': 'FC SEMEY', 'score': '2:1', 'date': '20 апр.', 'isHome': true},
            {'opponent': 'Pioneer Group', 'score': '1:1', 'date': '13 апр.', 'isHome': false},
            {'opponent': 'FC KUNTU', 'score': '3:0', 'date': '6 апр.', 'isHome': true},
          ],
        };
      case 'FC SEMEY':
        return {
          'fullName': 'Футбольный Клуб Семей',
          'founded': '2015',
          'coach': 'Борис Николаев',
          'homeStadium': 'Центральный стадион Семея',
          'teamColors': ['Красный', 'Черный'],
          'players': [
            {
              'name': 'Сергей Новиков',
              'number': '1',
              'position': 'Вратарь',
              'age': '30',
              'stats': {'matches': '16', 'cleanSheets': '5'}
            },
            {
              'name': 'Игорь Соколов',
              'number': '2',
              'position': 'Защитник',
              'age': '27',
              'stats': {'matches': '17', 'goals': '1'}
            },
            {
              'name': 'Павел Федоров',
              'number': '3',
              'position': 'Защитник',
              'age': '26',
              'stats': {'matches': '18', 'assists': '2'}
            },
            {
              'name': 'Дмитрий Попов',
              'number': '7',
              'position': 'Полузащитник',
              'age': '24',
              'stats': {'matches': '15', 'goals': '4', 'assists': '6'}
            },
            {
              'name': 'Владимир Лебедев',
              'number': '11',
              'position': 'Полузащитник',
              'age': '25',
              'stats': {'matches': '18', 'goals': '6', 'assists': '8'}
            },
            {
              'name': 'Михаил Комаров',
              'number': '9',
              'position': 'Нападающий',
              'age': '28',
              'stats': {'matches': '17', 'goals': '10', 'assists': '3'}
            },
          ],
          'recentResults': [
            {'opponent': 'Abyroi School', 'score': '1:2', 'date': '20 апр.', 'isHome': false},
            {'opponent': 'FC FARES', 'score': '2:0', 'date': '13 апр.', 'isHome': true},
            {'opponent': 'FC Займер', 'score': '1:1', 'date': '6 апр.', 'isHome': false},
          ],
        };
      default:
        return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = teamData;
    if (data.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(teamName)),
        body: const Center(child: Text('Информация о команде недоступна')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(data['fullName']),
        backgroundColor: const Color(0xFF0A3441),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Team Info Section
            Container(
              padding: const EdgeInsets.all(16),
              color: const Color(0xFF0A3441),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.sports_soccer, size: 40, color: Color(0xFF0A3441)),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['fullName'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Основан: ${data['founded']}',
                              style: const TextStyle(color: Colors.white70),
                            ),
                            Text(
                              'Тренер: ${data['coach']}',
                              style: const TextStyle(color: Colors.white70),
                            ),
                            Text(
                              'Стадион: ${data['homeStadium']}',
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Recent Results
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Последние матчи',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...data['recentResults'].map<Widget>((result) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          result['isHome']
                              ? '${teamName} - ${result['opponent']}'
                              : '${result['opponent']} - $teamName',
                        ),
                        subtitle: Text(result['date']),
                        trailing: Text(
                          result['score'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),

            // Squad List
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Состав команды',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...data['players'].map<Widget>((player) {
                    return Card(
                      child: ExpansionTile(
                        title: Text(player['name']),
                        subtitle: Text('${player['position']} | №${player['number']}'),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Возраст: ${player['age']}'),
                                const SizedBox(height: 8),
                                Text('Матчи: ${player['stats']['matches']}'),
                                if (player['stats']['cleanSheets'] != null)
                                  Text('Сухие матчи: ${player['stats']['cleanSheets']}'),
                                if (player['stats']['goals'] != null)
                                  Text('Голы: ${player['stats']['goals']}'),
                                if (player['stats']['assists'] != null)
                                  Text('Голевые передачи: ${player['stats']['assists']}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
