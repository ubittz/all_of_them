import 'package:all_of_them/common/component/container_title.dart';
import 'package:all_of_them/festival/component/festival_card.dart';
import 'package:all_of_them/festival/component/festival_horizontal_page_view.dart';
import 'package:all_of_them/festival/provider/festival_provider.dart';
import 'package:all_of_them/festival/view/festival_detail_screen.dart';
import 'package:all_of_them/festival/view/festival_screen.dart';
import 'package:all_of_them/notification/view/notification_screen.dart';
import 'package:all_of_them/partner/component/partner_horizontal_item_list.dart';
import 'package:all_of_them/partner/provider/partner_provider.dart';
import 'package:all_of_them/partner/view/partner_screen.dart';
import 'package:all_of_them/place/component/place_card.dart';
import 'package:all_of_them/place/component/place_horizontal_page_view.dart';
import 'package:all_of_them/place/provider/place_provider.dart';
import 'package:all_of_them/place/view/place_detail_screen.dart';
import 'package:all_of_them/place/view/place_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/const/colors.dart';
import '../../common/const/data.dart';
import '../../common/const/image_path.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../user/model/user_model.dart';
import '../../user/provider/user_provider.dart';

class HomeScreen extends ConsumerWidget {
  static String get routeName => "home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserModel user = ref.watch(userProvider) as UserModel;
    final partners = ref.watch(partnerProvider);
    final places = ref.watch(placeProvider);
    final festivals = ref.watch(festivalProvider);

    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '모두포',
        titleStyle: MyTextStyle.headline24Black,
        centerTitle: false,
        leadingWidth: 180,
        action: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                context.pushNamed(NotificationScreen.routeName);
              },
              icon: PhosphorIcon(
                PhosphorIcons.bell(),
                size: 28.0,
              ),
            ),
          ),
        ],
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(ImagePath.homeBanner),
            const SizedBox(height: 40.0),
            _renderTapButton(
              title: '예술 파트너를 찾습니다',
              onTap: () {
                context.goNamed(PartnerScreen.routeName);
              },
            ),
            _renderTapButton(
              title: '공간을 찾습니다',
              onTap: () {
                context.goNamed(PlaceScreen.routeName);
              },
            ),
            _renderTapButton(
              title: '행사를 찾습니다',
              onTap: () {
                context.goNamed(FestivalScreen.routeName);
              },
            ),
            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ContainerTitle(title: '${user.name}님이 관심 있을 예술 파트너'),
            ),
            PartnerHorizontalItemList(partners: partners),
            const SizedBox(height: 40.0),
            Image.asset(ImagePath.bandBanner),
            const SizedBox(height: 40.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: ContainerTitle(title: '모두포에서 추천하는 공간'),
            ),
            PlaceHorizontalPageView(
              height: 336.0,
              itemCount: places.length,
              itemBuilder: (BuildContext context, int index) {
                final place = places[index];

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
              child: ContainerTitle(title: '신규 등록된 행사'),
            ),
            FestivalHorizontalPageView(
              height: 336.0,
              itemCount: festivals.length,
              itemBuilder: (BuildContext context, int index) {
                final festival = festivals[index];

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
            const _Footer(),
          ],
        ),
      ),
    );
  }

  Widget _renderTapButton({
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 2.0),
        child: Container(
          width: 160.0,
          decoration: BoxDecoration(
            color: MyColor.empty,
            border: Border.all(
              color: MyColor.primary,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: MyTextStyle.title20R,
                ),
                PhosphorIcon(PhosphorIcons.caretRight())
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColor.lightGrey,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final title = footerData[index];

            return Padding(
              padding: EdgeInsets.only(top: (index == 4) ? 12.0 : 0.0),
              child: Text(
                title,
                style: (index == 0 || index == 4)
                    ? MyTextStyle.description14M.copyWith(
                        fontWeight: FontWeight.bold,
                        color: MyColor.darkGrey,
                      )
                    : MyTextStyle.description14R.copyWith(
                        color: MyColor.darkGrey,
                      ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 4.0);
          },
          itemCount: footerData.length,
        ),
      ),
    );
  }
}
