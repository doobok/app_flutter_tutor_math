import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'app/constants/app_constants.dart';
import 'app/constants/app_theme.dart';
import 'app/routes.dart';
import 'core/providers/bottom_bar_provider.dart';
import 'core/providers/top_bar_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // Регистрируем провайдеры
        ChangeNotifierProvider(create: (_) => TopBarProvider()), // Для верхнего меню
        ChangeNotifierProvider(create: (_) => BottomBarProvider()), // Для нижнего меню
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false, // Убираем баннер "Debug"
      title: AppConstants.appName, // Название приложения
      theme: AppTheme.getTheme(context), // Тема приложения
      initialRoute: AppRoutes.login, // Начальный маршрут
      onGenerateRoute: RouteGenerator.generateRoute, // Генератор маршрутов
    );
  }
}