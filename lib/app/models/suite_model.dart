import 'category_items.dart';
import 'periods_model.dart';

class SuiteModel {
  final String name;
  final int roomAmount;
  final bool showAvailableRooms;
  final List<String> photosUrl;
  final List<String> items;
  final List<CategoryItems> categoryItems;
  final List<PeriodsModel> periods;

  SuiteModel({
    required this.name,
    required this.roomAmount,
    required this.showAvailableRooms,
    required this.photosUrl,
    required this.items,
    required this.categoryItems,
    required this.periods,
  });

  factory SuiteModel.fromMap(Map<String, dynamic> map) {
    return SuiteModel(
      name: map['nome'] ?? '',
      roomAmount: map['qtd']?.toInt() ?? 0,
      showAvailableRooms: map['exibirQtdDisponiveis'] ?? false,
      photosUrl: List<String>.from(map['fotos']),
      items: List<String>.from(map['itens'].map((x) => x['nome'])),
      categoryItems: List<CategoryItems>.from(
          map['categoriaItens']?.map((x) => CategoryItems.fromMap(x))),
      periods: List<PeriodsModel>.from(
          map['periodos']?.map((x) => PeriodsModel.fromMap(x))),
    );
  }

  factory SuiteModel.empty() {
    return SuiteModel(
      name: '',
      roomAmount: 0,
      showAvailableRooms: false,
      photosUrl: ['https://placehold.co/10.jpg'],
      items: [],
      categoryItems: [],
      periods: [],
    );
  }
}
