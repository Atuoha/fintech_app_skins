class Transaction {
  final int id;
  final String title;
  final String imgAsset;
  final int amount;
  final DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.imgAsset,
    required this.amount,
    required this.date,
  });
}