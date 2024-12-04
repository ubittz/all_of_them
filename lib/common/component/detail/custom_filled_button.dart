import 'package:all_of_them/common/const/colors.dart';
import 'package:all_of_them/common/const/text_styles.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomFilledButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: MyColor.primary,
          borderRadius: BorderRadius.circular(50.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: MyTextStyle.description14M.copyWith(
            color: MyColor.white,
          ),
        ),
      ),
    );
  }
}
