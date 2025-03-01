import 'package:flutter/cupertino.dart';
import '../features/welcome/presentation/welcome_screen.dart';
import '../features/main/presentation/main_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/welcome':
        return CupertinoPageRoute(builder: (_) => const WelcomeScreen());
      case '/main':
        return CupertinoPageRoute(builder: (_) => const MainScreen());
      default:
        return CupertinoPageRoute(builder: (_) => const WelcomeScreen());
    }
  }
}