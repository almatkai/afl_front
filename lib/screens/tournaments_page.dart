import 'package:flutter/material.dart';

class TournamentItem {
  final String name;
  final String status;
  final String date;
  final List<String> teams;

  TournamentItem({
    required this.name,
    required this.status,
    required this.date,
    required this.teams,
  });
}

class TournamentsPage extends StatelessWidget {
  final List<TournamentItem> tournaments = [
    TournamentItem(
      name: "Весенний Кубок",
      status: "Четвертьфинал",
      date: "30 апреля 2025",
      teams: ["Команда А", "Команда Б", "Команда В", "Команда Г"],
    ),
    TournamentItem(
      name: "Летняя Лига",
      status: "Регистрация",
      date: "1 июня 2025",
      teams: ["Команда А", "Команда Д", "Команда Е"],
    ),
    TournamentItem(
      name: "Кубок Города",
      status: "Групповой этап",
      date: "15 мая 2025",
      teams: ["Команда Б", "Команда В", "Команда Г", "Команда Е"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tournaments.length,
      itemBuilder: (context, index) {
        final tournament = tournaments[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tournament.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        tournament.status,
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      tournament.date,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Участники:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: tournament.teams.map((team) {
                    return Chip(
                      label: Text(team),
                      backgroundColor: Colors.grey.shade200,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
