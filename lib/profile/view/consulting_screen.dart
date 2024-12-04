import 'package:all_of_them/common/component/custom_drop_down_single.dart';
import 'package:all_of_them/common/component/custom_text_form_field.dart';
import 'package:all_of_them/common/component/default_button.dart';
import 'package:all_of_them/common/const/colors.dart';
import 'package:all_of_them/common/const/text_styles.dart';
import 'package:all_of_them/common/layout/default_app_bar.dart';
import 'package:all_of_them/common/layout/default_layout.dart';
import 'package:all_of_them/common/view/completion_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ConsultingScreen extends ConsumerStatefulWidget {
  static String get routeName => 'consulting';

  const ConsultingScreen({super.key});

  @override
  ConsumerState<ConsultingScreen> createState() => _ConsultingScreenState();
}

class _ConsultingScreenState extends ConsumerState<ConsultingScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: "기타 상담"),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: PrimaryButton(
          onPressed: () {
            context.goNamed(
              CompletionScreen.routeName,
              pathParameters: {"title": '상담 요청이\n완료되었습니다!'},
            );
          },
          child: const Text('상담요청'),
        ),
      ),
      child: Container(
        color: MyColor.empty,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: MyColor.lightGrey,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '안녕하세요!\n예술 컨텐츠 종합 매칭 플랫폼 모두포 입니다.\n상담을 위해 몇가지 사항에 대해 작성을 해주시면 도움이 될 것 같습니다.',
                    style: MyTextStyle.body16R,
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              CustomSingleDropDown(
                dropdownList: const ['기업', '개인'],
                hintText: '상담자 구분',
                dropdownHeight: 100.0,
                onChanged: (String value) {},
              ),
              const SizedBox(height: 20.0),
              CustomSingleDropDown(
                dropdownList: const ['서울', '경기', '강원', '충청', '전라', '경상', '제주'],
                hintText: '지역',
                dropdownHeight: 300.0,
                onChanged: (String value) {},
              ),
              const SizedBox(height: 20.0),
              CustomTextFormField(
                controller: controller,
                hintText: "무엇을 상담받고 싶으신가요?",
                onChanged: (String value) {},
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
                onEditingComplete: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
