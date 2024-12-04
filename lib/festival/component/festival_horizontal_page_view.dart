import 'package:flutter/material.dart';

class FestivalHorizontalPageView extends StatelessWidget {
  final PageController? controller;
  final double height;
  final int itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;

  const FestivalHorizontalPageView({
    super.key,
    this.controller,
    required this.height,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: PageView.builder(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
