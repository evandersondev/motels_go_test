import 'package:flutter/material.dart';

class CardMotelImage extends StatelessWidget {
  final String image;
  final String name;
  final int roomAmount;
  final bool showAvailableRooms;

  const CardMotelImage({
    super.key,
    required this.image,
    required this.name,
    required this.roomAmount,
    required this.showAvailableRooms,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 32,
      padding: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: 220,
            padding: EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 21,
            ),
          ),
          if (showAvailableRooms)
            Row(
              spacing: 4,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.info,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  'só mais $roomAmount pelo app',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
