import 'package:flutter/material.dart';

import 'line_dashed_painter.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Theme.of(context).colorScheme.primary,
      padding: EdgeInsets.only(top: 4, bottom: 34),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'minha localização',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              RotatedBox(
                quarterTurns: 45,
                child: Icon(
                  Icons.chevron_right_rounded,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 130,
            child: CustomPaint(
              painter: LineDashedPainter(
                color: Colors.grey.shade300,
              ),
              size: Size(130, 1),
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }
}
