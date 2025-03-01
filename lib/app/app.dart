import 'package:flutter/cupertino.dart';
import 'routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      initialRoute: '/welcome',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}