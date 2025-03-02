import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../core/providers/bottom_bar_provider.dart';
import '../../../core/providers/top_bar_provider.dart';
import '../../../core/utils/top_bar.dart';
import '../../balance/presentation/balance_screen.dart';
import '../../favorites/presentation/favorites_screen.dart';
import '../../lessons/presentation/lessons_screen.dart';
import '../../schedule/presentation/schedule_screen.dart';
import '../../user/presentation/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final bottomBarProvider = Provider.of<BottomBarProvider>(context);
    final topBarProvider = Provider.of<TopBarProvider>(context);

    return CupertinoPageScaffold(
      navigationBar: TopBar(), // Верхнее меню (использует TopBarProvider)
      child: Column(
        children: [
          Expanded(
            child: _buildScreen(bottomBarProvider.currentIndex), // Динамический экран
          ),
          CupertinoTabBar(
            currentIndex: bottomBarProvider.currentIndex,
            onTap: (index) {
              bottomBarProvider.setCurrentIndex(index); // Изменяем индекс нижнего меню
              topBarProvider.updateTitle(_getAppBarTitle(index)); // Обновляем заголовок
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.calendar),
                label: 'Расписание',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.book),
                label: 'Занятия',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart),
                label: 'Сохраненное',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.money_dollar),
                label: 'Баланс',
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Метод для получения заголовка в зависимости от текущего индекса
  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'Расписание';
      case 1:
        return 'Занятия';
      case 2:
        return 'Сохраненное';
      case 3:
        return 'Баланс';
      default:
        return 'Главная';
    }
  }

  // Метод для отображения текущего экрана
  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return const ScheduleScreen();
      case 1:
        return const LessonsScreen();
      case 2:
        return const FavoritesScreen();
      case 3:
        return const BalanceScreen();
      case 4:
        return const UserProfileScreen();
      default:
        return const Center(child: Text('Экран не найден'));
    }
  }
}