import 'package:all_of_them/common/component/bar/custom_tab_bar.dart';
import 'package:all_of_them/common/component/default_button.dart';
import 'package:all_of_them/common/component/divider_container.dart';
import 'package:all_of_them/common/component/tag_container.dart';
import 'package:all_of_them/common/const/colors.dart';
import 'package:all_of_them/common/const/text_styles.dart';
import 'package:all_of_them/common/layout/default_app_bar.dart';
import 'package:all_of_them/common/layout/default_layout.dart';
import 'package:all_of_them/common/view/completion_screen.dart';
import 'package:all_of_them/place/provider/place_provider.dart';
import 'package:all_of_them/profile/model/order_model.dart';
import 'package:all_of_them/profile/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/component/detail/container_detail.dart';
import '../../common/component/detail/container_question.dart';
import '../../common/component/detail/container_review.dart';

class PlaceDetailScreen extends ConsumerWidget {
  static String get routeName => 'place_detail';

  final String id;

  const PlaceDetailScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final place = ref.watch(placeDetailProvider(id));

    return DefaultLayout(
      appbar: const DefaultAppBar(title: ''),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: PrimaryButton(
          onPressed: () {
            context.goNamed(
              CompletionScreen.routeName,
              pathParameters: {"title": "매칭 요청이\n정상적으로\n완료 되었습니다."},
            );
            ref.read(orderProvider.notifier).addOrder(
                  order: OrderModel(
                    id: id,
                    title: place.name,
                    itemType: ItemType.place,
                    orderStatus: OrderStatus.approval,
                    mainImageUrl: place.mainImageUrl,
                    createdDt: DateTime.now(),
                  ),
                );
          },
          child: const Text('매칭 요청'),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              place.mainImageUrl,
              fit: BoxFit.cover,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    place.name,
                    style: MyTextStyle.subtitle18B,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    place.shortDescription,
                    style: MyTextStyle.body16R.copyWith(
                      color: MyColor.darkGrey,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      TagContainer(title: place.tags[0]),
                      const SizedBox(width: 4.0),
                      TagContainer(title: place.tags[1]),
                    ],
                  )
                ],
              ),
            ),
            const DividerContainer(),
            CustomTabBar(
              labelStyle: MyTextStyle.body16M.copyWith(
                color: MyColor.primary,
              ),
              labelList: const ['상세', '리뷰', '문의'],
              viewList: [
                ContainerDetail(
                  imageUrl: place.detailImageUrl,
                  description: place.description,
                ),
                const ContainerReview(),
                const ContainerQuestion(),
              ],
              viewHeightList: const [480, 860, 1100],
            ),
          ],
        ),
      ),
    );
  }
}
