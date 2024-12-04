import 'package:all_of_them/common/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../const/data.dart';
import '../../const/text_styles.dart';
import '../container_title.dart';
import 'review_model.dart';

class ContainerReview extends StatelessWidget {
  const ContainerReview({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ReviewModel> reviews = reviewData
        .map((e) => ReviewModel(id: e[0], date: e[1], content: e[2]))
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ContainerTitle(title: '리뷰'),
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              itemBuilder: (BuildContext context, int index) {
                final review = reviews[index];

                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: MyColor.lightGrey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              review.id,
                              style: MyTextStyle.description14R.copyWith(
                                color: MyColor.text,
                              ),
                            ),
                            Text(
                              review.date,
                              style: MyTextStyle.caption12R.copyWith(
                                color: MyColor.darkGrey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: List.generate(
                            5,
                            (int index) => PhosphorIcon(
                              PhosphorIcons.star(PhosphorIconsStyle.fill),
                              size: 16.0,
                              color: MyColor.primary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          review.content,
                          style: MyTextStyle.description14R.copyWith(
                            color: MyColor.text,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 8.0);
              },
              itemCount: reviews.length,
            ),
          ),
        ],
      ),
    );
  }
}
