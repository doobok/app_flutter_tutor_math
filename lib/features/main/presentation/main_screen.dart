import 'package:flutter/cupertino.dart';
import '../../../core/utils/top_bar.dart';
import '../../../core/utils/bottom_bar.dart';
import '../../../core/utils/screen_container.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const TopBar(),
      child: Column(
        children: [
          Expanded(
            child: ScreenContainer(currentIndex: _currentIndex),
          ),
          BottomBar(
            currentIndex: _currentIndex,
            onTabSelected: _onTabSelected,
          ),
        ],
      ),
    );
  }
}