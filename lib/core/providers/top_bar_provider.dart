import 'package:flutter/cupertino.dart';

class TopBarProvider with ChangeNotifier {
  bool _isMenuOpen = false;
  String _title = 'Главная';

  bool get isMenuOpen => _isMenuOpen;

  String get title => _title;

  void toggleMenu() {
    _isMenuOpen = !_isMenuOpen;
    notifyListeners();
  }

  void updateTitle(String newTitle) {
    _title = newTitle;
    notifyListeners();
  }
}