import 'package:flutter/material.dart';

class CardMotelHeader extends StatelessWidget {
  final String logo;
  final String name;
  final double distance;
  final String district;
  final int reviewsAmount;
  final double average;

  const CardMotelHeader({
    super.key,
    required this.logo,
    required this.name,
    required this.distance,
    required this.district,
    required this.reviewsAmount,
    required this.average,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        subtitle: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$distance - $district'),
            Row(
              children: [
                Container(
                  height: 22,
                  padding: EdgeInsets.only(
                    left: 3,
                    right: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.amber,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    spacing: 2,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star,
                        size: 14,
                        color: Colors.amber,
                      ),
                      Text(
                        '$average',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '$reviewsAmount avaliações',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                RotatedBox(
                  quarterTurns: 45,
                  child: Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                  ),
                ),
              ],
            )
          ],
        ),
        isThreeLine: true,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(logo),
        ),
        trailing: Icon(Icons.favorite),
      ),
    );
  }
}
