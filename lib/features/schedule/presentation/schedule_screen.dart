import 'package:flutter/cupertino.dart';
import 'widgets/schedule_item.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<Map<String, String>> scheduleItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSchedule();
  }

  // Загрузка данных (симуляция API)
  Future<void> _loadSchedule() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2)); // Симуляция задержки

    setState(() {
      scheduleItems = [
        {'title': 'Математика', 'time': '10:00 - 11:30'},
        {'title': 'Физика', 'time': '12:00 - 13:30'},
        {'title': 'Химия', 'time': '14:00 - 15:30'},
      ];
      isLoading = false;
    });
  }

  // Обновление данных (pull-to-refresh)
  Future<void> _refreshSchedule() async {
    await _loadSchedule();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: isLoading
          ? const Center(child: CupertinoActivityIndicator()) // Индикатор загрузки
          : CustomScrollView(
        slivers: [
          CupertinoSliverRefreshControl(
            onRefresh: _refreshSchedule, // Функция обновления
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final item = scheduleItems[index];
                return ScheduleItem(
                  title: item['title']!,
                  time: item['time']!,
                );
              },
              childCount: scheduleItems.length,
            ),
          ),
        ],
      ),
    );
  }
}