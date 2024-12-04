import 'package:flutter/material.dart';

import '../../const/colors.dart';

class ModalBottomSheetWidget extends StatelessWidget {
  final double height;
  final Widget child;

  const ModalBottomSheetWidget({
    super.key,
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: MyColor.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.0),
        ),
      ),
      width: double.infinity,
      height: height,
      child: Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: child,
      ),
    );
  }
}
