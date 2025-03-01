import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tutor_math/app/constants/app_constants.dart';
import 'top_bar_menu.dart';
import 'top_bar_user.dart';

class TopBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      leading: CupertinoButton(
        padding: EdgeInsets.zero,
        child: const Icon(
          FontAwesomeIcons.bars,
          size: 28.0,
        ),
        onPressed: () => showTopBarMenu(context),
      ),
      middle: const Text(
        AppConstants.appName,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        child: const Icon(
          FontAwesomeIcons.circleUser,
          size: 28.0,
        ),
        onPressed: () => onTopBarUserPressed(context),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}