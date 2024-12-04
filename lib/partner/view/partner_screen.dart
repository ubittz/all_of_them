import 'package:all_of_them/common/component/category_inkwell.dart';
import 'package:all_of_them/common/component/container_title.dart';
import 'package:all_of_them/common/const/text_styles.dart';
import 'package:all_of_them/partner/component/partner_horizontal_item_list.dart';
import 'package:all_of_them/partner/model/partner_category_type.dart';
import 'package:all_of_them/partner/provider/partner_category_provider.dart';
import 'package:all_of_them/partner/provider/partner_provider.dart';
import 'package:all_of_them/partner/view/partner_category_screen.dart';
import 'package:all_of_them/partner/view/partner_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../user/model/user_model.dart';
import '../../user/provider/user_provider.dart';

class PartnerScreen extends ConsumerWidget {
  static String get routeName => "partner";

  const PartnerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserModel user = ref.watch(userProvider) as UserModel;
    final partners = ref.watch(partnerProvider);

    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '파트너 찾기',
        titleStyle: MyTextStyle.headline24Black,
        centerTitle: false,
        leadingWidth: 180,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
              child: Text(
                '공연과 행사를 함께할\n예술 파트너를 찾아보세요!',
                style: MyTextStyle.appName32B,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ContainerTitle(title: '카테고리'),
                  const SizedBox(height: 8.0),
                  Wrap(
                    runSpacing: 8.0,
                    spacing: 8.0,
                    children: PartnerCategoryType.values
                        .map((type) => CategoryInkwell(
                            title: type.label,
                            onTap: () {
                              ref
                                  .read(
                                      selectedPartnerCategoryProvider.notifier)
                                  .state = type;
                              context.goNamed(PartnerCategoryScreen.routeName);
                            }))
                        .toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: ContainerTitle(title: '지금 가장 HOT한 예술 파트너'),
            ),
            PartnerHorizontalItemList(partners: partners.sublist(0, 5)),
            const SizedBox(height: 40.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: ContainerTitle(title: '추천 예술 파트너'),
            ),
            PartnerHorizontalItemList(partners: partners.sublist(5, 10)),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
