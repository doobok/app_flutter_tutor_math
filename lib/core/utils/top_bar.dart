import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../providers/top_bar_provider.dart';
import 'top_bar_menu.dart';

class TopBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  final VoidCallback onUserIconPressed;

  const TopBar({super.key, required this.onUserIconPressed});

  @override
  Widget build(BuildContext context) {
    final topBarProvider = Provider.of<TopBarProvider>(context);

    return CupertinoNavigationBar(
      leading: CupertinoButton(
        padding: EdgeInsets.zero,
        child: const Icon(
          CupertinoIcons.bars,
          size: 28.0,
        ),
        onPressed: () {
          showTopBarMenu(context);
        },
      ),
      middle: Text(
        topBarProvider.title,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        child: const Icon(
          CupertinoIcons.person_crop_circle,
          size: 28.0,
        ),
        onPressed: onUserIconPressed, // Используем переданный колбэк
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0); // Высота верхнего меню

  @override
  bool shouldFullyObstruct(BuildContext context) => true; // Полное перекрытие
}