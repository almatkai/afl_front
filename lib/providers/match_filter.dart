import 'package:flutter/material.dart';

class MatchFilter extends InheritedWidget {
  final String selectedFilter;

  const MatchFilter({
    super.key,
    required this.selectedFilter,
    required super.child,
  });

  static MatchFilter? of(BuildContext context) {
    return context.findAncestorWidgetOfType<MatchFilter>();
  }

  @override
  bool updateShouldNotify(MatchFilter oldWidget) {
    return oldWidget.selectedFilter != selectedFilter;
  }
}
