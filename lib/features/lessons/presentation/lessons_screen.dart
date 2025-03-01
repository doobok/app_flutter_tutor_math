import 'package:flutter/cupertino.dart';
import 'widgets/lesson_item.dart';

class LessonsScreen extends StatefulWidget {
  const LessonsScreen({super.key});

  @override
  _LessonsScreenState createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  List<Map<String, dynamic>> lessons = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadLessons();
  }

  Future<void> _loadLessons() async {
    // Симуляция загрузки данных из API
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      lessons = [
        {
          'id': '1',
          'title': 'Урок 1: Алгебра',
          'description': 'Основы алгебры и уравнения',
          'tutor_name': 'Иван Иванов',
          'date_time': '2023-10-15 10:00',
          'vote': 0,
        },
        {
          'id': '2',
          'title': 'Урок 2: Геометрия',
          'description': 'Геометрические фигуры и теоремы',
          'tutor_name': 'Петр Петров',
          'date_time': '2023-10-16 12:00',
          'vote': 0,
        },
        {
          'id': '3',
          'title': 'Урок 3: Тригонометрия',
          'description': 'Тригонометрические функции',
          'tutor_name': 'Анна Сидорова',
          'date_time': '2023-10-17 14:00',
          'vote': 0,
        },
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
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        final lesson = lessons[index];
        return LessonItem(
          id: lesson['id'],
          title: lesson['title'],
          description: lesson['description'],
          tutorName: lesson['tutor_name'],
          dateTime: lesson['date_time'],
          vote: lesson['vote'],
        );
      },
    );
  }
}