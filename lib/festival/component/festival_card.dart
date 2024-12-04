import 'package:all_of_them/common/component/tag_container.dart';
import 'package:all_of_them/common/const/colors.dart';
import 'package:all_of_them/festival/model/festival_model.dart';
import 'package:flutter/material.dart';

import '../../common/const/text_styles.dart';

class FestivalCard extends StatelessWidget {
  final FestivalModel festival;

  const FestivalCard({
    super.key,
    required this.festival,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 8.0,
            color: MyColor.barrier,
          ),
        ],
        color: MyColor.empty,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              festival.mainImageUrl,
              fit: BoxFit.cover,
              height: 200,
            ),
            Container(
              height: 120.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16.0),
                ),
                color: MyColor.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      festival.name,
                      style: MyTextStyle.subtitle18B,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      festival.shortDescription,
                      style: MyTextStyle.body16R.copyWith(
                        color: MyColor.darkGrey,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        TagContainer(title: festival.tags[0]),
                        const SizedBox(width: 4.0),
                        TagContainer(title: festival.tags[1]),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
