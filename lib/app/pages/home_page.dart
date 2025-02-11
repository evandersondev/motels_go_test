import 'package:flutter/material.dart';
import 'package:injectfy/injectfy.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../controllers/motel_controller.dart';
import '../states/motel_state.dart';
import '../widgets/card_motel/card_motel_widget.dart';
import '../widgets/carousel_promotion.dart';
import '../widgets/filters_carousel.dart';
import '../widgets/location_button.dart';
import '../widgets/maps_floating_button.dart';
import '../widgets/my_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final _controller = Injectfy.get<MotelController>();

  bool showPromotionCarousel = false;

  @override
  void initState() {
    super.initState();

    _controller.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MapsFloatingButton(),
      appBar: MyAppBar(),
      body: Stack(
        children: [
          LocationButton(),
          Positioned(
            top: 34,
            left: 0,
            bottom: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Container(
                color: Colors.grey.shade100,
                child: RefreshIndicator(
                  onRefresh: _controller.load,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        if (showPromotionCarousel) CarouselPromotion(),
                        StickyHeader(
                          controller: _scrollController,
                          header: FiltersCarousel(),
                          content: ValueListenableBuilder(
                            valueListenable: _controller,
                            builder: (context, state, child) {
                              if (state is FailureMotelState) {
                                return Center(
                                  child: Text(state.message),
                                );
                              }

                              if (state is SuccessMotelState) {
                                Future.delayed(Duration.zero, () {
                                  setState(() {
                                    showPromotionCarousel = true;
                                  });
                                });
                              }

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 32.0),
                                child: Skeletonizer(
                                  enabled: state is LoadingMotelState,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _controller.motels.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return CardMotelWidget(
                                        motel: _controller.motels[0],
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
