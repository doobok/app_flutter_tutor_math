import 'package:flutter/cupertino.dart';
import 'package:tutor_math/features/auth/presentation/login_screen.dart';
import '../features/balance/presentation/balance_screen.dart';
import '../features/favorites/presentation/favorites_screen.dart';
import '../features/lessons/presentation/lessons_screen.dart';
import '../features/schedule/presentation/schedule_screen.dart';
import '../features/main/presentation/main_screen.dart';
import '../features/user/presentation/user_profile_screen.dart';

class AppRoutes {
  // Основные маршруты
  static const String login = '/login';
  static const String main = '/main';
  static const String schedule = '/schedule';
  static const String lessons = '/lessons';
  static const String favorites = '/favorites';
  static const String balance = '/balance';
  static const String userProfile = '/user_profile';

  // Вспомогательные маршруты (например, модальные окна)
  static const String settings = '/settings';
  static const String about = '/about';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.login:
        return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.main:
        return CupertinoPageRoute(builder: (_) => const MainScreen());
      case AppRoutes.schedule:
        return CupertinoPageRoute(builder: (_) => const ScheduleScreen());
      case AppRoutes.lessons:
        return CupertinoPageRoute(builder: (_) => const LessonsScreen());
      case AppRoutes.favorites:
        return CupertinoPageRoute(builder: (_) => const FavoritesScreen());
      case AppRoutes.balance:
        return CupertinoPageRoute(builder: (_) => const BalanceScreen());
      case AppRoutes.userProfile:
        return CupertinoPageRoute(builder: (_) => const UserProfileScreen());
      // Пример передачи аргументов
      //   if (args is UserProfileArguments) {
      //     return CupertinoPageRoute(
      //       builder: (_) => UserProfileScreen(userId: args.userId),
      //     );
      //   }
      //   return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  // Обработка неизвестных маршрутов
  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(
      builder: (context) => CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Ошибка'),
        ),
        child: const Center(
          child: Text('Страница не найдена!'),
        ),
      ),
    );
  }
}

// Пример класса для передачи аргументов
// class UserProfileArguments {
//   final String userId;
//
//   UserProfileArguments(this.userId);
// }