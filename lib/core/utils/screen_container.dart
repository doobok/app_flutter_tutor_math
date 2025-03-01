import 'package:flutter/cupertino.dart';

import '../../features/balance/presentation/balance_screen.dart';
import '../../features/favorites/presentation/favorites_screen.dart';
import '../../features/lessons/presentation/lessons_screen.dart';
import '../../features/schedule/presentation/schedule_screen.dart';

class ScreenContainer extends StatelessWidget {
  final int currentIndex;

  const ScreenContainer({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentIndex,
      children: const [
        ScheduleScreen(),
        LessonsScreen(),
        FavoritesScreen(),
        BalanceScreen(),
      ],
    );
  }
}