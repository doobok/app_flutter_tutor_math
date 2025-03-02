import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String avatarUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatarUrl,
  });
}

Future<User> fetchUserData() async {
  await Future.delayed(const Duration(seconds: 2));
  return User(
    id: '1',
    name: 'Иван Иванов',
    email: 'ivan@example.com',
    phone: '+7 (999) 123-45-67',
    avatarUrl: 'https://icons.veryicon.com/png/o/miscellaneous/user-avatar/user-avatar-male-5.png',
  );
}

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool _isLoading = true;
  User? _user;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final user = await fetchUserData();
      if (mounted) {
        setState(() {
          _user = user;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Ошибка загрузки данных. Попробуйте еще раз.';
          _isLoading = false;
        });
      }
    }
  }

  void _handleLogout(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Выход из аккаунта'),
        content: const Text('Вы уверены, что хотите выйти?'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Отмена'),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoDialogAction(
            child: const Text('Выйти'),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _isLoading
          ? const Center(child: CupertinoActivityIndicator())
          : _errorMessage != null
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _errorMessage!,
              style: const TextStyle(color: CupertinoColors.systemRed),
            ),
            const SizedBox(height: 16),
            CupertinoButton(
              child: const Text('Повторить'),
              onPressed: _loadUserData,
            ),
          ],
        ),
      )
          : Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(_user!.avatarUrl),
                ),
                const SizedBox(height: 16),
                Text(
                  _user!.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _user!.email,
                  style: TextStyle(
                    fontSize: 16,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _user!.phone,
                  style: TextStyle(
                    fontSize: 16,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView(
              children: [
                CupertinoButton(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(CupertinoIcons.settings),
                      SizedBox(width: 16),
                      Text('Настройки'),
                    ],
                  ),
                ),
                CupertinoButton(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  onPressed: () => _handleLogout(context),
                  child: const Row(
                    children: [
                      Icon(CupertinoIcons.arrow_right_circle),
                      SizedBox(width: 16),
                      Text('Выйти из аккаунта'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}