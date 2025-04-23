import 'package:flutter/material.dart';
import '../widgets/matches_list.dart';

class LeagueHomePage extends StatefulWidget {
  const LeagueHomePage({super.key});

  @override
  State<LeagueHomePage> createState() => _LeagueHomePageState();
}

class _LeagueHomePageState extends State<LeagueHomePage> {
  final List<String> categories = ['МАТЧИ', 'НОВОСТИ', 'ТУРНИРЫ', 'КОМАНДЫ'];
  final List<String> filters = ['ВСЕ', 'ЛИГА', 'ЗАВЕРШЕННЫЕ', 'РАСПИСАНИЕ'];

  String selectedCategory = 'МАТЧИ';
  String selectedFilter = 'ВСЕ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A3441),
        elevation: 0,
        title: const Text(
          'АСТАНА\nЛИГА ЛЮБИТЕЛЕЙ ФУТБОЛА',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: const [
          Icon(Icons.notifications_outlined, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.person_outline, color: Colors.white),
          SizedBox(width: 16),
        ],
      ),
      drawer: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx < -10) {
            Navigator.of(context).pop();
          }
        },
        child: Drawer(
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
      ),
      body: Column(
        children: [
          // Categories bar
          Container(
            color: const Color(0xFF0A3441),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: categories.map((category) {
                bool isSelected = category == selectedCategory;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: isSelected ? Colors.red : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // Filter tabs with animated red box and dynamic text color
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final filterCount = filters.length;
                final filterWidth = constraints.maxWidth / filterCount;
                final selectedIndex = filters.indexOf(selectedFilter);

                return TweenAnimationBuilder<double>(
                  tween: Tween(end: selectedIndex * filterWidth),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  builder: (context, animatedLeft, child) {
                    return Stack(
                      children: [
                        // Animated red box
                        Positioned(
                          left: animatedLeft,
                          top: 0,
                          bottom: 0,
                          width: filterWidth,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        // Gray text layer
                        Row(
                          children: filters.map((filter) {
                            return Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedFilter = filter;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  child: Text(
                                    filter,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        // White text layer with ShaderMask
                        ShaderMask(
                          shaderCallback: (bounds) {
                            final totalWidth = constraints.maxWidth;
                            final start = (animatedLeft + 4) / totalWidth; // Account for margin
                            final end = (animatedLeft + filterWidth - 4) / totalWidth; // Account for margin
                            return LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: const [
                                Colors.transparent,
                                Colors.white,
                                Colors.white,
                                Colors.transparent,
                              ],
                              stops: [
                                start - 0.05 > 0 ? start - 0.05 : 0.0,
                                start,
                                end,
                                end + 0.05 < 1 ? end + 0.05 : 1.0,
                              ],
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.srcIn,
                          child: Row(
                            children: filters.map((filter) {
                              return Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedFilter = filter;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                    child: Text(
                                      filter,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),

          // Match list
          Expanded(
            child: MatchesList(),
          ),
        ],
      ),
    );
  }
}