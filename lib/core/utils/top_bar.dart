import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../features/user/presentation/user_profile_screen.dart';
import '../providers/top_bar_provider.dart';

class TopBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  const TopBar({super.key});

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
          // Действие при нажатии на иконку меню
        },
      ),
      middle: Text(
        topBarProvider.title, // Заголовок из провайдера
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
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const UserProfileScreen(),
            ),
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0); // Высота верхнего меню

  @override
  bool shouldFullyObstruct(BuildContext context) => true; // Полное перекрытие
}