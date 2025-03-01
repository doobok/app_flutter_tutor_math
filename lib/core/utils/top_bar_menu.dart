import 'package:flutter/cupertino.dart';

void showTopBarMenu(BuildContext context) {
  showCupertinoModalPopup(
    context: context,
    builder: (context) => CupertinoActionSheet(
      title: const Text('Меню'),
      message: const Text('Выберите действие'),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            // Действие для пункта меню
          },
          child: const Text('Информация'),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            // Действие для пункта меню
          },
          child: const Text('О приложении'),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Закрыть'),
      ),
    ),
  );
}