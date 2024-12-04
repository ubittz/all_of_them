import 'package:flutter/material.dart';

class PlaceHorizontalPageView extends StatefulWidget {
  final PageController? controller;
  final double height;
  final int itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;

  const PlaceHorizontalPageView({
    super.key,
    this.controller,
    required this.height,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  State<PlaceHorizontalPageView> createState() =>
      _PlaceHorizontalPageViewState();
}

class _PlaceHorizontalPageViewState extends State<PlaceHorizontalPageView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: PageView.builder(
        controller: widget.controller,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.itemCount,
        itemBuilder: widget.itemBuilder,
      ),
    );
  }
}
