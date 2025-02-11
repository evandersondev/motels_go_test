class CategoryItems {
  final String name;
  final String iconUrl;

  CategoryItems({
    required this.name,
    required this.iconUrl,
  });

  factory CategoryItems.fromMap(Map<String, dynamic> map) {
    return CategoryItems(
      name: map['nome'] ?? '',
      iconUrl: map['icone'] ?? '',
    );
  }
}
