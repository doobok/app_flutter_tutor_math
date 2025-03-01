import 'package:flutter/cupertino.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Здесь можно добавить логику загрузки данных (например, из API)
    final List<String> lessons = [
      'Урок 1: Алгебра',
      'Урок 2: Геометрия',
      'Урок 3: Тригонометрия',
    ];

    return ListView.builder(
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(lessons[index]),
        );
      },
    );
  }
}