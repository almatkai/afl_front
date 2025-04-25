import 'package:flutter/material.dart';

class MatchesList extends StatelessWidget {
  MatchesList({super.key});

  final List<Map<String, dynamic>> leagues = [
    {
      'name': 'ПРЕМЬЕР-ЛИГА',
      'date': '20 апр.',
      'matches': [
        {'team1': 'Abyroi School', 'team2': 'FC SEMEY', 'time': '18:00'},
        {'team1': 'Pioneer Group', 'team2': 'QAISAR PLAZA', 'time': '18:00'},
        {'team1': 'Alash', 'team2': 'FC KUNTU', 'time': '18:00'},
        {'team1': 'FC Suranshy Batyr', 'team2': 'Пионер элит', 'time': '18:00'},
        {'team1': 'FC Займер', 'team2': 'FC BAKANAS', 'time': '18:00'},
        {'team1': 'Университет Туран', 'team2': 'FC FARES', 'time': '18:00'},
      ]
    },
    {
      'name': 'ЛИГА А',
      'date': '20 апр.',
      'matches': [
        {'team1': 'Кокшетау', 'team2': 'Динамо', 'time': '18:00'},
        {'team1': 'Атамекен', 'team2': 'Астана', 'time': '18:00'},
        {'team1': 'Продинвест', 'team2': 'Дала Кырандары', 'time': '18:00'},
        {'team1': 'Байлис', 'team2': 'Zhas Alash', 'time': '18:00'},
        {'team1': 'Буревестник', 'team2': 'Semey Team', 'time': '18:00'},
      ]
    },
    {
      'name': 'КЕШЕН',
      'date': '',
      'matches': [
        {'team1': 'Экскаваторщик', 'team2': '', 'time': '18:00'},
        {'team1': 'Омак', 'team2': 'Астана', 'time': '18:00'},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: leagues.length,
      itemBuilder: (context, leagueIndex) {
        final league = leagues[leagueIndex];
        final matches = league['matches'] as List<Map<String, dynamic>>;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // League header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Icon(Icons.sports_soccer, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 8),
                  Text(
                    league['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontSize: 13,
                    ),
                  ),
                  const Spacer(),
                  if (league['date'].isNotEmpty)
                    Text(
                      league['date'],
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
            ),

            // Matches
            ...matches.map((match) {
              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[200]!,
                      width: 1,
                    ),
                  ),
                ),
                child: ListTile(
                  leading: const Icon(Icons.star_border, color: Colors.grey),
                  title: Text(
                    '${match['team1']} - ${match['team2']}',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        match['time'],
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'А',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      const Icon(Icons.chevron_right, color: Colors.grey),
                    ],
                  ),
                ),
              );
            }),
          ],
        );
      },
    );
  }
}
