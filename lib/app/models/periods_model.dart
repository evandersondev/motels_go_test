class PeriodsModel {
  final String timeFormatted;
  final double value;
  final double totalValue;
  final double? discount;

  PeriodsModel({
    required this.timeFormatted,
    required this.value,
    required this.totalValue,
    this.discount,
  });

  factory PeriodsModel.fromMap(Map<String, dynamic> map) {
    return PeriodsModel(
      timeFormatted: map['tempoFormatado'] ?? '',
      value: map['valor']?.toDouble() ?? 0.0,
      totalValue: map['valorTotal']?.toDouble() ?? 0.0,
      discount: map['desconto'] != null ? map['desconto']['desconto'] : null,
    );
  }
}
