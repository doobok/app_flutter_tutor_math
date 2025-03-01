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

  Future<void> _loadSchedule() async {
    // Симуляция загрузки данных из API
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      scheduleItems = [
        {'title': 'Математика', 'time': '10:00 - 11:30'},
        {'title': 'Физика', 'time': '12:00 - 13:30'},
        {'title': 'Химия', 'time': '14:00 - 15:30'},
      ];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CupertinoActivityIndicator());
    }

    return ListView.builder(
      itemCount: scheduleItems.length,
      itemBuilder: (context, index) {
        final item = scheduleItems[index];
        return ScheduleItem(
          title: item['title']!,
          time: item['time']!,
        );
      },
    );
  }
}