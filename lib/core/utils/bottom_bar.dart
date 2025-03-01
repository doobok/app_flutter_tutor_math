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
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: CupertinoTabBar(
        currentIndex: currentIndex,
        onTap: onTabSelected,
        height: 70,
        activeColor: CupertinoTheme.of(context).primaryContrastingColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.calendar,
              size: 24,
              color: CupertinoTheme.of(context).primaryColor,
            ),
            activeIcon: Icon(
              FontAwesomeIcons.calendar,
              size: 24,
              color: CupertinoTheme.of(context).primaryContrastingColor,
            ),
            label: 'Розклад',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.book,
              size: 24,
              color: CupertinoTheme.of(context).primaryColor,
            ),
            activeIcon: Icon(
              FontAwesomeIcons.book,
              size: 24,
              color: CupertinoTheme.of(context).primaryContrastingColor,
            ),
            label: 'Заняття',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.star,
              size: 24,
              color: CupertinoTheme.of(context).primaryColor,
            ),
            activeIcon: Icon(
              FontAwesomeIcons.star,
              size: 24,
              color: CupertinoTheme.of(context).primaryContrastingColor,
            ),
            label: 'Улюблене',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.wallet,
              size: 24,
              color: CupertinoTheme.of(context).primaryColor,
            ),
            activeIcon: Icon(
              FontAwesomeIcons.wallet,
              size: 24,
              color: CupertinoTheme.of(context).primaryContrastingColor,
            ),
            label: 'Баланс',
          ),
        ],
      ),
    );
  }
}