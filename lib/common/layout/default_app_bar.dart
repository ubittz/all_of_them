import 'package:all_of_them/common/const/text_styles.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget {
  static const defaultAppBarHeight = 60.0;
  final String title;
  final TextStyle? titleStyle;
  final Widget? titleWidget;
  final List<Widget>? action;
  final Widget? leading;
  final double? leadingWidth;
  final double? elevation;
  final bool centerTitle;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const DefaultAppBar({
    super.key,
    required this.title,
    this.titleStyle,
    this.titleWidget,
    this.leading,
    this.leadingWidth,
    this.action,
    this.elevation,
    this.centerTitle = true,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  State<DefaultAppBar> createState() => _DefaultAppBarState();

  @override
  Size get preferredSize =>
      const Size(double.infinity, DefaultAppBar.defaultAppBarHeight);
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: (widget.titleWidget == null)
          ? Text(widget.title)
          : widget.titleWidget,
      titleTextStyle: widget.titleStyle ??
          MyTextStyle.subtitle18B.copyWith(color: widget.foregroundColor),
      titleSpacing: 24.0,
      leading: widget.leading,
      leadingWidth: widget.leadingWidth ?? 72.0,
      centerTitle: widget.centerTitle,
      actions: widget.action,
      elevation: widget.elevation ?? 0.0,
      scrolledUnderElevation: 0.0,
      backgroundColor: widget.backgroundColor ?? MyColor.white,
      foregroundColor: widget.foregroundColor ?? MyColor.text,
    );
  }
}
