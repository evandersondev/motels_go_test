import 'suite_model.dart';

class MotelModel {
  final String name;
  final String logo;
  final String district;
  final double distance;
  final int reviewsAmount;
  final double average;
  final List<SuiteModel> suites;

  MotelModel({
    required this.name,
    required this.logo,
    required this.district,
    required this.distance,
    required this.reviewsAmount,
    required this.average,
    required this.suites,
  });

  factory MotelModel.fromMap(Map<String, dynamic> map) {
    return MotelModel(
      name: map['fantasia'] ?? '',
      logo: map['logo'] ?? '',
      district: map['bairro'] ?? '',
      distance: map['distancia']?.toDouble() ?? 0.0,
      reviewsAmount: map['qtdAvaliacoes']?.toInt() ?? 0,
      average: map['media']?.toDouble() ?? 0.0,
      suites: List<SuiteModel>.from(
          map['suites']?.map((x) => SuiteModel.fromMap(x))),
    );
  }

  factory MotelModel.empty() {
    return MotelModel(
      name: '',
      logo: 'https://placehold.co/10.jpg',
      district: '',
      distance: 0.0,
      reviewsAmount: 0,
      average: 0.0,
      suites: [SuiteModel.empty()],
    );
  }
}
