import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/core/constant/dismension_constant.dart';
import 'package:travel_app/core/constant/text_style_contrain.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representation/screens/main_app.dart';

import '../widgets/button_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);
  static const String routerName = '/intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  // final PageController _pageController =PageController();
  // final StreamController<int> _streamController=StreamController<int>();
  //
  // @override
  // void initstate(){
  //   super.initState();
  //   _pageController.addListener(() {
  //     _streamController.add(_pageController.page!.toInt());
  //     print(_pageController.page!.toInt());
  //
  //   });
  // }
  final PageController _pageController = PageController();

  final StreamController<int> _streamController = StreamController<int>();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _streamController.add(_pageController.page!.toInt());
    });
  }

  Widget _buildItemIntroScreen(String image, String title, String description,
      AlignmentGeometry alignment) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: alignment,
          child: ImageHelper.loadFromAsset(
            image,
            height: 400,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(
          height: kMediumPadding / 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle().bold),
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                description,
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _pageController,
          children: [
            _buildItemIntroScreen(
                AssetHelper.intro1,
                "book of flight",
                "Found a flight that matches your destination and schedule? Book it instantly.",
                Alignment.centerRight),
            _buildItemIntroScreen(
                AssetHelper.intro2,
                "find a hotel room",
                "Select the day, book your room. We give you the best price.",
                Alignment.center),
            _buildItemIntroScreen(
                AssetHelper.intro3,
                "enjoy your trip",
                "Easy discovering new places and share these between your friends and travel together.",
                Alignment.centerLeft),
          ],
        ),
        Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding * 2,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotWidth: kMinPadding,
                      dotHeight: kMinPadding,
                      activeDotColor: Colors.orange,
                    ),
                  ),
                ),
                StreamBuilder<int>(
                    initialData: 0,
                    stream: _streamController.stream,
                    builder: (context, snapshot) {
                      return Expanded(
                          flex: 4,
                          child: ButtonWidget(
                            title: snapshot.data != 2 ? 'Next' : 'Get Started',
                            ontap: () {
                              if (_pageController.page != 2) {
                                _pageController.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn);
                              } else {
                                Navigator.of(context)
                                    .pushNamed(MainApp.routerName);
                              }
                            },
                          ));
                    }),
              ],
            ))
      ],
    ));
  }
}
