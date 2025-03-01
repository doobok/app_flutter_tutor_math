import 'package:flutter/cupertino.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.calendar),
            label: 'Розклад',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            label: 'Заняття',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            label: 'Улюблене',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.money_dollar),
            label: 'Баланс',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) => const CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text('Розклад'),
                ),
                child: Center(
                  child: Text('Розклад'),
                ),
              ),
            );
          case 1:
            return CupertinoTabView(
              builder: (context) => const CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text('Заняття'),
                ),
                child: Center(
                  child: Text('Заняття'),
                ),
              ),
            );
          case 2:
            return CupertinoTabView(
              builder: (context) => const CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text('Улюблене'),
                ),
                child: Center(
                  child: Text('Улюблене'),
                ),
              ),
            );
          case 3:
            return CupertinoTabView(
              builder: (context) => const CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text('Баланс'),
                ),
                child: Center(
                  child: Text('Баланс'),
                ),
              ),
            );
          default:
            return CupertinoTabView(
              builder: (context) => CupertinoPageScaffold(
                child: Center(
                  child: Text('Error'),
                ),
              ),
            );
        }
      },
    );
  }
}