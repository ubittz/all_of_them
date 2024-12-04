import 'package:flutter/material.dart';

class HorizontalPageView extends StatefulWidget {
  final double height;
  final int itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;

  const HorizontalPageView({
    super.key,
    required this.height,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  State<HorizontalPageView> createState() => _HorizontalPageViewState();
}

class _HorizontalPageViewState extends State<HorizontalPageView> {
  late PageController controller;

  @override
  void initState() {
    super.initState();

    controller = PageController(viewportFraction: 0.9);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: PageView.builder(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.itemCount,
        itemBuilder: widget.itemBuilder,
      ),
    );
  }
}
