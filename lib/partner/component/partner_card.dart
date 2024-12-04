import 'package:all_of_them/common/component/tag_container.dart';
import 'package:all_of_them/common/const/colors.dart';
import 'package:all_of_them/partner/model/partner_model.dart';
import 'package:flutter/material.dart';

import '../../common/const/text_styles.dart';

class PartnerCard extends StatelessWidget {
  final PartnerModel partner;

  const PartnerCard({
    super.key,
    required this.partner,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 8.0,
            color: MyColor.barrier,
          ),
        ],
        borderRadius: BorderRadius.circular(16.0),
        color: MyColor.empty,
      ),
      width: 204.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              partner.mainImageUrl,
              fit: BoxFit.cover,
              height: 204,
            ),
            Container(
              height: 116.0,
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
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      partner.name,
                      style: MyTextStyle.subtitle18B,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      partner.job,
                      style: MyTextStyle.body16R.copyWith(
                        color: MyColor.darkGrey,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        TagContainer(title: partner.tags[0]),
                        const SizedBox(width: 4.0),
                        TagContainer(title: partner.tags[1]),
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
