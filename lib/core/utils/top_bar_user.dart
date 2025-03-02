import 'package:flutter/cupertino.dart';

import '../../features/user/presentation/user_profile_screen.dart';

void onTopBarUserPressed(BuildContext context) {
  Navigator.push(
    context,
    CupertinoPageRoute(builder: (_) => const UserProfileScreen()),
  );
}