import 'package:flutter/cupertino.dart';
import 'widgets/transaction_item.dart';

// Класс для хранения данных о балансе
class BalanceData {
  final double currentBalance;
  final List<Transaction> transactions;

  BalanceData({required this.currentBalance, required this.transactions});
}

// Класс для хранения данных о транзакции
class Transaction {
  final String id;
  final String description;
  final double amount;
  final DateTime date;

  Transaction({
    required this.id,
    required this.description,
    required this.amount,
    required this.date,
  });
}

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  _BalanceScreenState createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  bool isLoading = true;
  late BalanceData balanceData;

  @override
  void initState() {
    super.initState();
    _loadBalanceData();
  }

  Future<void> _loadBalanceData() async {
    // Симуляция загрузки данных из API
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      balanceData = BalanceData(
        currentBalance: 1500.0,
        transactions: [
          Transaction(
            id: '1',
            description: 'Пополнение счета',
            amount: 1000.0,
            date: DateTime(2023, 10, 10),
          ),
          Transaction(
            id: '2',
            description: 'Оплата занятий',
            amount: -500.0,
            date: DateTime(2023, 10, 12),
          ),
          Transaction(
            id: '3',
            description: 'Пополнение счета',
            amount: 1000.0,
            date: DateTime(2023, 10, 15),
          ),
        ],
      );
      isLoading = false;
    });
  }

  void _handleGooglePay() {
    // Эмуляция оплаты через Google Pay
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Google Pay'),
        content: const Text('Оплата прошла успешно!'),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }

    return CupertinoPageScaffold(
      child: Column(
        children: [
          // Текущий баланс
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: CupertinoColors.systemGrey.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Текущий баланс:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${balanceData.currentBalance.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.systemGreen,
                  ),
                ),
              ],
            ),
          ),
          // Кнопка пополнения через Google Pay
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: CupertinoButton.filled(
              onPressed: _handleGooglePay,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    CupertinoIcons.creditcard_fill,
                    size: 24,
                    color: CupertinoColors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Пополнить через Google Pay',
                    style: TextStyle(
                      fontSize: 16,
                      color: CupertinoColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // История транзакций
          Expanded(
            child: ListView.builder(
              itemCount: balanceData.transactions.length,
              itemBuilder: (context, index) {
                final transaction = balanceData.transactions[index];
                return TransactionItem(
                  description: transaction.description,
                  amount: transaction.amount,
                  date: transaction.date,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}