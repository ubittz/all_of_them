import 'package:all_of_them/common/component/tag_container.dart';
import 'package:all_of_them/partner/model/partner_model.dart';
import 'package:flutter/material.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';

class PartnerVerticalItemListCard extends StatelessWidget {
  final String id;
  final String name;
  final String job;
  final String shortDescription;
  final String description;
  final String mainImageUrl;
  final String detailImageUrl;
  final List<String> tags;

  const PartnerVerticalItemListCard({
    super.key,
    required this.id,
    required this.name,
    required this.job,
    required this.shortDescription,
    required this.description,
    required this.mainImageUrl,
    required this.detailImageUrl,
    required this.tags,
  });

  factory PartnerVerticalItemListCard.fromModel({
    required PartnerModel model,
  }) {
    return PartnerVerticalItemListCard(
      id: model.id,
      name: model.name,
      job: model.job,
      shortDescription: model.shortDescription,
      description: model.description,
      mainImageUrl: model.mainImageUrl,
      detailImageUrl: model.detailImageUrl,
      tags: model.tags,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(mainImageUrl, width: 120.0, height: 120.0),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    job,
                    style: MyTextStyle.subtitle18B,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(width: 6.0),
                  Text(
                    name,
                    style: MyTextStyle.body16R,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Text(
                shortDescription,
                style: MyTextStyle.body16R.copyWith(
                  color: MyColor.darkGrey,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  TagContainer(title: tags[0]),
                  TagContainer(title: tags[1]),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
