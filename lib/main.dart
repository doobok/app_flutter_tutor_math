import 'package:flutter/cupertino.dart';
import 'app/constants/app_constants.dart';
import 'app/constants/app_theme.dart';
import 'app/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: AppTheme.getTheme(context),
      child: CupertinoApp(
        title: AppConstants.appName,
        theme: AppTheme.getTheme(context),
        initialRoute: '/login',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}