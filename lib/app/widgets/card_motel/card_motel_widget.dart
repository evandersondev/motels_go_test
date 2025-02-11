import 'package:flutter/material.dart';

import '../../models/motel_model.dart';
import 'card_motel_header.dart';
import 'card_motel_image.dart';
import 'card_motel_value.dart';

class CardMotelWidget extends StatelessWidget {
  final MotelModel motel;

  CardMotelWidget({
    super.key,
    required this.motel,
  });

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardMotelHeader(
          name: motel.name,
          logo: motel.logo,
          average: motel.average,
          distance: motel.distance,
          district: motel.district,
          reviewsAmount: motel.reviewsAmount,
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 1.2,
          child: PageView.builder(
            controller: _pageController,
            itemCount: motel.suites.length,
            scrollDirection: Axis.horizontal,
            padEnds: true,
            itemBuilder: (context, index) {
              final suite = motel.suites[index];

              return Container(
                margin: EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  spacing: 4,
                  children: [
                    CardMotelImage(
                      name: suite.name,
                      image: suite.photosUrl[0],
                      roomAmount: suite.roomAmount,
                      showAvailableRooms: suite.showAvailableRooms,
                    ),
                    // CardMotelItems(
                    //   categoryItems: suite.categoryItems,
                    // ),
                    ...suite.periods.map((period) {
                      return CardMotelValue(
                        timeFormatted: period.timeFormatted,
                        totalValue: period.totalValue,
                        value: period.value,
                        discount: period.discount,
                      );
                    }),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
