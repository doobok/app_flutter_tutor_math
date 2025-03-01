import 'package:flutter/cupertino.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<String> scheduleItems = [];
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
        'Математика - 10:00',
        'Физика - 12:00',
        'Химия - 14:00',
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
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(scheduleItems[index]),
        );
      },
    );
  }
}