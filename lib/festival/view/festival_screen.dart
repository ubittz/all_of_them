import 'package:all_of_them/common/component/category_inkwell.dart';
import 'package:all_of_them/common/component/container_title.dart';
import 'package:all_of_them/common/const/text_styles.dart';
import 'package:all_of_them/festival/component/festival_card.dart';
import 'package:all_of_them/festival/component/festival_horizontal_page_view.dart';
import 'package:all_of_them/festival/model/festival_category_type.dart';
import 'package:all_of_them/festival/provider/festival_category_provider.dart';
import 'package:all_of_them/festival/provider/festival_provider.dart';
import 'package:all_of_them/festival/view/festival_category_screen.dart';
import 'package:all_of_them/festival/view/festival_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';

class FestivalScreen extends ConsumerWidget {
  static String get routeName => "festival";

  const FestivalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final festivals = ref.watch(festivalProvider);
    final firstFestivals = festivals.sublist(0, 5);
    final secondFestivals = festivals.sublist(5, 10);

    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '행사 찾기',
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
                '당신의 재능을 펼칠\n예술 행사를 찾아보세요!',
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
                    children: FestivalCategoryType.values
                        .map((type) => CategoryInkwell(
                            title: type.label,
                            onTap: () {
                              ref
                                  .read(selectedFestivalCategoryProvider.notifier)
                                  .state = type;
                              context.goNamed(FestivalCategoryScreen.routeName);
                            }))
                        .toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: ContainerTitle(title: '추천 행사'),
            ),
            FestivalHorizontalPageView(
              height: 336.0,
              itemCount: firstFestivals.length,
              itemBuilder: (BuildContext context, int index) {
                final festival = firstFestivals[index];

                return InkWell(
                  onTap: () {
                    context.goNamed(
                      FestivalDetailScreen.routeName,
                      pathParameters: {"id": festival.id},
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 8.0),
                    child: FestivalCard(festival: festival),
                  ),
                );
              },
            ),
            const SizedBox(height: 40.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: ContainerTitle(title: '신규로 등록된 행사'),
            ),
            FestivalHorizontalPageView(
              height: 336.0,
              itemCount: secondFestivals.length,
              itemBuilder: (BuildContext context, int index) {
                final festival = secondFestivals[index];

                return InkWell(
                  onTap: () {
                    context.goNamed(
                      FestivalDetailScreen.routeName,
                      pathParameters: {"id": festival.id},
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 8.0),
                    child: FestivalCard(festival: festival),
                  ),
                );
              },
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
