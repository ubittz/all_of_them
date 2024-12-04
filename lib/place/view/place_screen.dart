import 'package:all_of_them/common/component/category_inkwell.dart';
import 'package:all_of_them/common/component/container_title.dart';
import 'package:all_of_them/common/const/text_styles.dart';
import 'package:all_of_them/place/component/place_card.dart';
import 'package:all_of_them/place/component/place_horizontal_page_view.dart';
import 'package:all_of_them/place/model/place_category_type.dart';
import 'package:all_of_them/place/provider/place_category_provider.dart';
import 'package:all_of_them/place/provider/place_provider.dart';
import 'package:all_of_them/place/view/place_category_screen.dart';
import 'package:all_of_them/place/view/place_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';

class PlaceScreen extends ConsumerWidget {
  static String get routeName => "place";

  const PlaceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final places = ref.watch(placeProvider);
    final firstPlaces = places.sublist(0, 5);
    final secondPlaces = places.sublist(5, 10);

    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '공간 찾기',
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
                '공연과 작업을 진행할\n공간을 찾아보세요!',
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
                    children: PlaceCategoryType.values
                        .map((type) => CategoryInkwell(
                            title: type.label,
                            onTap: () {
                              ref
                                  .read(selectedPlaceCategoryProvider.notifier)
                                  .state = type;
                              context.goNamed(PlaceCategoryScreen.routeName);
                            }))
                        .toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: ContainerTitle(title: '추천 공간'),
            ),
            PlaceHorizontalPageView(
              height: 336.0,
              itemCount: firstPlaces.length,
              itemBuilder: (BuildContext context, int index) {
                final place = firstPlaces[index];

                return InkWell(
                  onTap: () {
                    context.goNamed(
                      PlaceDetailScreen.routeName,
                      pathParameters: {"id": place.id},
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 8.0),
                    child: PlaceCard(place: place),
                  ),
                );
              },
            ),
            const SizedBox(height: 40.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: ContainerTitle(title: '신규로 등록된 공간'),
            ),
            PlaceHorizontalPageView(
              height: 336.0,
              itemCount: secondPlaces.length,
              itemBuilder: (BuildContext context, int index) {
                final place = secondPlaces[index];

                return InkWell(
                  onTap: () {
                    context.goNamed(
                      PlaceDetailScreen.routeName,
                      pathParameters: {"id": place.id},
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 8.0),
                    child: PlaceCard(place: place),
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
