import 'package:flutter/material.dart';
import '../screens/match_details_page.dart';
import '../screens/team_details_page.dart';

class MatchesList extends StatelessWidget {
  final String selectedFilter;
  
  MatchesList({super.key, required this.selectedFilter});

  static final List<Map<String, dynamic>> leagues = [
    {
      'name': 'ПРЕМЬЕР-ЛИГА',
      'date': '20 апр.',
      'matches': [
        {'team1': 'Abyroi School', 'team2': 'FC SEMEY', 'time': '18:00', 'status': 'ЗАВЕРШЕННЫЕ', 'score': '2:1'},
        {'team1': 'Pioneer Group', 'team2': 'QAISAR PLAZA', 'time': '18:00', 'status': 'РАСПИСАНИЕ'},
        {'team1': 'Alash', 'team2': 'FC KUNTU', 'time': '18:00', 'status': 'ЗАВЕРШЕННЫЕ', 'score': '0:0'},
        {'team1': 'FC Suranshy Batyr', 'team2': 'Пионер элит', 'time': '18:00', 'status': 'РАСПИСАНИЕ'},
        {'team1': 'FC Займер', 'team2': 'FC BAKANAS', 'time': '18:00', 'status': 'ЛИГА'},
        {'team1': 'Университет Туран', 'team2': 'FC FARES', 'time': '18:00', 'status': 'ЛИГА'},
      ]
    },
    {
      'name': 'ЛИГА А',
      'date': '20 апр.',
      'matches': [
        {'team1': 'Кокшетау', 'team2': 'Динамо', 'time': '18:00', 'status': 'ЗАВЕРШЕННЫЕ', 'score': '3:2'},
        {'team1': 'Атамекен', 'team2': 'Астана', 'time': '18:00', 'status': 'РАСПИСАНИЕ'},
        {'team1': 'Продинвест', 'team2': 'Дала Кырандары', 'time': '18:00', 'status': 'ЛИГА'},
        {'team1': 'Байлис', 'team2': 'Zhas Alash', 'time': '18:00', 'status': 'ЗАВЕРШЕННЫЕ', 'score': '1:1'},
        {'team1': 'Буревестник', 'team2': 'Semey Team', 'time': '18:00', 'status': 'ЛИГА'},
      ]
    },
    {
      'name': 'КЕШЕН',
      'date': '',
      'matches': [
        {'team1': 'Экскаваторщик', 'team2': 'Динамо-2', 'time': '18:00', 'status': 'РАСПИСАНИЕ'},
        {'team1': 'Омак', 'team2': 'Астана-2', 'time': '18:00', 'status': 'ЛИГА'},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: leagues.length,
      itemBuilder: (context, leagueIndex) {
        final league = leagues[leagueIndex];
        var matches = league['matches'] as List<Map<String, dynamic>>;

        // Filter matches based on selected filter
        if (selectedFilter != 'ВСЕ') {
          matches = matches.where((match) => match['status'] == selectedFilter).toList();
        }

        // If no matches after filtering, don't show this league
        if (matches.isEmpty) {
          return const SizedBox.shrink();
        }

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
              final bool isCompleted = match['status'] == 'ЗАВЕРШЕННЫЕ';
              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[200]!,
                      width: 1,
                    ),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    if (isCompleted || match['status'] == 'ЛИГА') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MatchDetailsPage(match: match),
                        ),
                      );
                    }
                  },
                      child: ListTile(
                        leading: const Icon(Icons.star_border, color: Colors.grey),
                        title: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
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
                                  fontSize: 14,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            const Text(' - ', style: TextStyle(fontSize: 14)),
                            GestureDetector(
                              onTap: () {
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
                                  fontSize: 14,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isCompleted)
                          Text(
                            match['score'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                          )
                        else
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
                ),
              );
            }),
          ],
        );
      },
    );
  }
}
