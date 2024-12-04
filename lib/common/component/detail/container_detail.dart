import 'package:all_of_them/common/component/container_title.dart';
import 'package:all_of_them/common/const/colors.dart';
import 'package:all_of_them/common/const/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContainerDetail extends ConsumerWidget {
  final String description;
  final String imageUrl;

  const ContainerDetail({
    super.key,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ContainerTitle(title: '소개'),
              const SizedBox(height: 8.0),
              Text(
                description,
                style: MyTextStyle.body16R.copyWith(
                  color: MyColor.darkGrey,
                ),
              ),
            ],
          ),
        ),
        Image.asset(
          imageUrl,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
