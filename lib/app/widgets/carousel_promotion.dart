import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'promotion_card_widget.dart';

class CarouselPromotion extends StatelessWidget {
  CarouselPromotion({super.key});

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      color: Colors.grey.shade200,
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: List.generate(5, (index) {
                return PromotionCardWidget();
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 5,
              effect: ScaleEffect(
                dotHeight: 5,
                dotWidth: 5,
                scale: 2,
                activeDotColor: Colors.grey,
                dotColor: Colors.grey.shade400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
