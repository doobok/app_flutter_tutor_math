import 'package:flutter/cupertino.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Welcome'),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            // Переход на основной интерфейс
            Navigator.pushNamed(context, '/main');
          },
          color: CupertinoColors.systemBlue,
          child: const Text('Start'),
        ),
      ),
    );
  }
}