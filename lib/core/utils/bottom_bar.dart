import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTabSelected;

  const BottomBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      currentIndex: currentIndex,
      onTap: onTabSelected,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.calendar),
          label: 'Розклад',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.book),
          label: 'Заняття',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.star),
          label: 'Улюблене',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.wallet),
          label: 'Баланс',
        ),
      ],
    );
  }
}