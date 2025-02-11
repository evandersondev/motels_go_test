import 'package:flutter/material.dart';

import '../../models/category_items.dart';

class CardMotelItems extends StatelessWidget {
  final List<CategoryItems> categoryItems;

  const CardMotelItems({
    super.key,
    required this.categoryItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: MediaQuery.sizeOf(context).width - 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(
        // horizontal: 32,
        vertical: 12,
      ),
      child: Row(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...categoryItems.getRange(0, 4).map(
                (it) => Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Image.network(it.iconUrl),
                ),
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ver\ntodos',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade500,
                ),
              ),
              RotatedBox(
                quarterTurns: 45,
                child: Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.grey.shade500,
                  size: 16,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
