import 'package:all_of_them/common/const/text_styles.dart';
import 'package:flutter/material.dart';

class ContainerTitle extends StatelessWidget {
  final String title;

  const ContainerTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: MyTextStyle.title20B,
    );
  }
}
