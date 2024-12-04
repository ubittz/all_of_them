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
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CreateItemScreen extends ConsumerStatefulWidget {
  static String get routeName => 'create_item';

  const CreateItemScreen({super.key});

  @override
  ConsumerState<CreateItemScreen> createState() => _CreateItemScreenState();
}

class _CreateItemScreenState extends ConsumerState<CreateItemScreen> {
  String dropdownValue = '';
  bool isPartner = false;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: "모두포 등록신청"),
      bottomNavigationBar: (dropdownValue.isNotEmpty)
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
              child: PrimaryButton(
                onPressed: () {
                  context.goNamed(
                    CompletionScreen.routeName,
                    pathParameters: {"title": '모두포 등록 신청이\n완료되었습니다.'},
                  );
                },
                child: const Text('등록하기'),
              ),
            )
          : null,
      child: SingleChildScrollView(
        child: Container(
          color: MyColor.empty,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomSingleDropDown(
                  dropdownList: const ['예술', '공간', '행사'],
                  hintText: '등록 구분',
                  dropdownHeight: 144.0,
                  onChanged: (String value) {
                    setState(() {
                      setState(() {
                        dropdownValue = value;
                        isPartner = value == '예술';
                      });
                    });
                  },
                ),
                const SizedBox(height: 40.0),
                if (dropdownValue.isNotEmpty)
                  Text(
                    '정보 입력',
                    style: MyTextStyle.subtitle18B,
                  ),
                const SizedBox(height: 8.0),
                if (dropdownValue.isNotEmpty)
                  CustomTextFormField(
                    hintText: isPartner ? "개인 프로필" : '사업자명',
                    onChanged: (String value) {},
                    onSaved: (String? newValue) {},
                    validator: (String? value) {
                      return null;
                    },
                  onEditingComplete: () {},
                ),
                const SizedBox(height: 8.0),
                if (dropdownValue.isNotEmpty)
                  CustomTextFormField(
                    hintText: isPartner ? "경력사항" : "사업주명",
                    onChanged: (String value) {},
                    onSaved: (String? newValue) {},
                    validator: (String? value) {
                      return null;
                    },
                    onEditingComplete: () {},
                  ),
                const SizedBox(height: 8.0),
                if (dropdownValue.isNotEmpty)
                  CustomTextFormField(
                    hintText: "기준금액(최소금액)",
                    onChanged: (String value) {},
                    onSaved: (String? newValue) {},
                    validator: (String? value) {
                      return null;
                    },
                    suffixText: '원',
                    onEditingComplete: () {},
                    textInputType: TextInputType.number,
                  ),
                const SizedBox(height: 40.0),
                if (dropdownValue.isNotEmpty)
                  Text(
                    '파일 업로드',
                    style: MyTextStyle.subtitle18B,
                  ),
                const SizedBox(height: 8.0),
                if (dropdownValue.isNotEmpty)
                  Wrap(
                    spacing: 8.0,
                    children: [
                      _renderCameraButton(title: '파일 업로드'),
                      if (!isPartner) _renderCameraButton(title: '파일 업로드'),
                      if (!isPartner) _renderCameraButton(title: '파일 업로드'),
                    ],
                  ),
                const SizedBox(height: 40.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderCameraButton({
    required String title,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: MyTextStyle.description14R,
        ),
        const SizedBox(height: 4.0),
        Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: MyColor.lightGrey,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Center(
            child: PhosphorIcon(
              PhosphorIcons.camera(),
              size: 32.0,
            ),
          ),
        ),
      ],
    );
  }
}
