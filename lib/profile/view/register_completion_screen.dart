import 'package:all_of_them/common/component/default_button.dart';
import 'package:all_of_them/common/const/text_styles.dart';
import 'package:all_of_them/home/view/home_screen.dart';
import 'package:all_of_them/profile/view/create_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/layout/default_layout.dart';

class RegisterCompletionScreen extends StatelessWidget {
  static String get routeName => 'register_completion';

  const RegisterCompletionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 100.0),
            Text(
              '회원 가입이 완료되었습니다!\n모두포 등록을 시작해보세요.',
              style: MyTextStyle.headline24Black,
            ),
            const Spacer(),
            PrimaryButton(
              onPressed: () {
                context.pushNamed(CreateItemScreen.routeName);
              },
              child: const Text('모두포 등록하기'),
            ),
            const SizedBox(height: 12.0),
            SecondaryButton(
              onPressed: () {
                context.goNamed(HomeScreen.routeName);
              },
              child: const Text('홈으로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
