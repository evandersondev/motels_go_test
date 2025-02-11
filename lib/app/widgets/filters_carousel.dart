import 'package:flutter/material.dart';

const filtersList = [
  'com desconto',
  'disponívies',
  'hidro',
  'piscina',
  'sauna',
  'ofurô',
  'decoração erótica',
  'decoração temática',
  'cadeira erótica',
  'pista de dança',
  'garagem privativa',
  'frigobar',
  'internet wi-fi',
  'suíte para festas',
  'suíte com acessibilidade',
];

class FiltersCarousel extends StatelessWidget {
  const FiltersCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          spacing: 10,
          children: [
            Container(
              height: 32,
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                spacing: 4,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.clear_all_outlined,
                    size: 18,
                  ),
                  Text(
                    'filtros',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            ...filtersList.map((it) {
              return Container(
                height: 32,
                padding: EdgeInsets.symmetric(horizontal: 8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade200,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  it,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
