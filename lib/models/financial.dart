class Financial {
  final int id;
  final DateTime date;
  double amount;
  String receiver;
  String description;

  Financial({
    required this.id,
    required this.date,
    this.amount = 0,
    this.receiver = '',
    this.description = '',
  });

  Map<String, Object> toMap() {
    return {
      'date': date.millisecondsSinceEpoch,
      'amount': amount,
      'receiver': receiver,
      'description': description,
    };
  }

  static Financial fromMap(Map<String, Object?> map) {
    return Financial(
      id: map['id'] as int,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      amount: map['amount'] as double,
      receiver: map['receiver'] as String,
      description: map['description'] as String,
    );
  }
}
