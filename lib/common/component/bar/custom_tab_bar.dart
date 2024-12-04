import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';

import '../../const/colors.dart';

class CustomTabBar extends StatefulWidget {
  final TextStyle labelStyle;
  final List<String> labelList;
  final List<Widget> viewList;
  final List<double> viewHeightList;
  final double? tabBarHeight;
  final EdgeInsetsGeometry? padding;
  final Container? background;
  final Color? indicatorColor;
  final double? indicatorWeight;
  final Color? unSelectedLabelColor;
  final ValueChanged<int>? onChange;

  const CustomTabBar({
    super.key,
    required this.labelStyle,
    required this.labelList,
    required this.viewList,
    required this.viewHeightList,
    this.tabBarHeight = 52.0,
    this.padding = const EdgeInsets.all(0.0),
    this.background,
    this.indicatorColor = MyColor.primary,
    this.indicatorWeight,
    this.unSelectedLabelColor = MyColor.text,
    this.onChange,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: widget.padding,
      height: widget.viewHeightList[_currentIndex] + widget.tabBarHeight!,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
      child: ContainedTabBarView(
        tabs: widget.labelList
            .map((element) => Container(
                  color: MyColor.white,
                  child: Text(element),
                ))
            .toList(),
        views: widget.viewList,
        tabBarProperties: TabBarProperties(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          height: widget.tabBarHeight ?? 52.0,
          background: widget.background ?? Container(color: MyColor.white),
          indicatorColor: widget.indicatorColor,
          indicatorWeight: widget.indicatorWeight ?? 1.0,
          labelStyle: widget.labelStyle,
          unselectedLabelColor: widget.unSelectedLabelColor,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        tabBarViewProperties: const TabBarViewProperties(
          physics: NeverScrollableScrollPhysics(),
        ),
        onChange: (index) async {
          setState(() {
            _currentIndex = index;
          });
          await Future.delayed(const Duration(milliseconds: 100));
          widget.onChange?.call(index);
        },
      ),
    );
  }
}
