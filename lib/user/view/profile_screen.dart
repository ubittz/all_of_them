import 'package:all_of_them/common/component/divider_container.dart';
import 'package:all_of_them/profile/view/consulting_screen.dart';
import 'package:all_of_them/profile/view/create_item_screen.dart';
import 'package:all_of_them/profile/view/order_screen.dart';
import 'package:all_of_them/user/view/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/component/show/show_cupertino_alert.dart';
import '../../common/const/colors.dart';
import '../../common/const/image_path.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../model/user_model.dart';
import '../provider/user_provider.dart';
import 'login_screen.dart';

class ProfileScreen extends ConsumerWidget {
  static String get routeName => "profile";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '마이페이지',
        titleStyle: MyTextStyle.headline24Black,
        centerTitle: false,
        leadingWidth: 180,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (user is UserModel)
              _renderProfileTitle(user: user),
            DividerContainer(bottomHeight: 8.0,),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              child: Text(
                '모두포 내역',
                style: MyTextStyle.subtitle18B,
              ),
            ),
            _renderTitleAndArrowButton(
              title: '매칭 내역',
              onTap: () {
                context.pushNamed(OrderScreen.routeName);
              },
            ),
            _renderTitleAndArrowButton(
              title: '모두포 등록',
              onTap: () {
                context.pushNamed(CreateItemScreen.routeName);
              },
            ),
            _renderTitleAndArrowButton(
              title: '기타 상담',
              onTap: () {
                context.pushNamed(ConsultingScreen.routeName);
              },
            ),
            const SizedBox(height: 32.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              child: Text(
                '계정 정보',
                style: MyTextStyle.subtitle18B,
              ),
            ),
            _renderTitleAndArrowButton(
              title: '내 정보 수정',
              onTap: () {
                context.pushNamed(EditProfileScreen.routeName);
              },
            ),
            _renderTitleAndArrowButton(
              title: '로그아웃',
              onTap: () {
                showCustomCupertinoAlert(
                  context: context,
                  titleWidget: const Text('로그아웃 하시겠습니까?'),
                  completeText: '확인',
                  completeFunction: () {
                    context.goNamed(LoginScreen.routeName);
                  },
                  cancelText: '취소',
                  cancelFunction: () {
                    context.pop();
                  },
                );
              },
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }

  Widget _renderProfileTitle({
    required UserModel user,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(ImagePath.user, height: 72.0, width: 72.0),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: MyTextStyle.title20B,
              ),
              Text(
                user.username,
                style: MyTextStyle.body16R.copyWith(
                  color: MyColor.darkGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _renderTitleAndArrowButton({
    required String title,
    required VoidCallback onTap,
    bool isEmptyArrow = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 14.0,
        ),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: MyTextStyle.body16M,
              ),
              const SizedBox(width: 1.0),
              if (!isEmptyArrow) PhosphorIcon(PhosphorIcons.caretRight()),
            ],
          ),
        ),
      ),
    );
  }
}
