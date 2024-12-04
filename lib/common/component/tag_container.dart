import 'package:all_of_them/common/const/colors.dart';
import 'package:all_of_them/common/const/text_styles.dart';
import 'package:flutter/material.dart';

class TagContainer extends StatelessWidget {
  final String title;

  const TagContainer({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: MyColor.primary,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        title,
        style: MyTextStyle.caption12R.copyWith(
          color: MyColor.primary,
        ),
      ),
    );
  }
}
