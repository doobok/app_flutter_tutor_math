import 'package:flutter/cupertino.dart';

class LessonItem extends StatefulWidget {
  final String id;
  final String title;
  final String description;
  final String tutorName;
  final String dateTime;
  final int vote;

  const LessonItem({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.tutorName,
    required this.dateTime,
    required this.vote,
  });

  @override
  _LessonItemState createState() => _LessonItemState();
}

class _LessonItemState extends State<LessonItem> {
  int _currentVote = 0;

  @override
  void initState() {
    super.initState();
    _currentVote = widget.vote; // Инициализируем текущую оценку
  }

  void _updateVote(int vote) {
    setState(() {
      _currentVote = vote;
    });
    // Здесь можно добавить логику отправки оценки на сервер
    print('Оценка ${widget.id}: $vote');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                CupertinoIcons.book,
                size: 24,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Преподаватель: ${widget.tutorName}',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Дата и время: ${widget.dateTime}',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Оцените занятие:',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () => _updateVote(index + 1),
                child: Icon(
                  index < _currentVote
                      ? CupertinoIcons.star_fill
                      : CupertinoIcons.star,
                  size: 24,
                  color: CupertinoColors.systemYellow,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}