import 'package:flutter/material.dart';

class NewsItem {
  final String title;
  final String content;
  final String date;

  NewsItem({
    required this.title,
    required this.content,
    required this.date,
  });
}

class NewsPage extends StatelessWidget {
  final List<NewsItem> newsItems = [
    NewsItem(
      title: "Команда А одержала важную победу",
      content: "В напряженном матче Команда А показала отличную игру и одержала победу со счетом 3:1. Особенно отличился нападающий команды, забивший два мяча.",
      date: "25 апреля 2025",
    ),
    NewsItem(
      title: "Команда Б готовится к решающему матчу",
      content: "Тренер Команды Б рассказал о подготовке к важному матчу полуфинала. Команда проводит усиленные тренировки и настроена на победу.",
      date: "24 апреля 2025",
    ),
    NewsItem(
      title: "Команда В объявила о новом трансфере",
      content: "Команда В подписала контракт с перспективным полузащитником. Это усиление должно помочь команде в борьбе за высокие места.",
      date: "23 апреля 2025",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: newsItems.length,
      itemBuilder: (context, index) {
        final item = newsItems[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.content,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  item.date,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
