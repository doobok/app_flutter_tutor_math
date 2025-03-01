import 'package:flutter/cupertino.dart';
import '../features/balance/presentation/balance_screen.dart';
import '../features/favorites/presentation/favorites_screen.dart';
import '../features/lessons/presentation/lessons_screen.dart';
import '../features/schedule/presentation/schedule_screen.dart';
import '../features/welcome/presentation/welcome_screen.dart';
import '../features/main/presentation/main_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/welcome':
        return CupertinoPageRoute(builder: (_) => const WelcomeScreen());
      case '/main':
        return CupertinoPageRoute(builder: (_) => const MainScreen());
      case '/schedule':
        return CupertinoPageRoute(builder: (_) => const ScheduleScreen());
      case '/lessons':
        return CupertinoPageRoute(builder: (_) => const LessonsScreen());
      case '/favorites':
        return CupertinoPageRoute(builder: (_) => const FavoritesScreen());
      case '/balance':
        return CupertinoPageRoute(builder: (_) => const BalanceScreen());
      default:
        return CupertinoPageRoute(builder: (_) => const WelcomeScreen());
    }
  }
}