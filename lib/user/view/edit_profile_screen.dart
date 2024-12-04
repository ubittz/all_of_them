import 'package:all_of_them/common/component/custom_text_form_field.dart';
import 'package:all_of_them/common/component/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/component/show/show_custom_toast.dart';
import '../../common/const/colors.dart';
import '../../common/const/image_path.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../model/user_model.dart';
import '../provider/user_provider.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  static String get routeName => "edit_profile";

  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  List<String> selectedDropdownItems = [];

  @override
  void dispose() {
    _usernameController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);

    if (user is UserModel) {
      _usernameController.text = user.username;
      _nameController.text = user.name;
      _phoneController.text = user.phone;
      _emailController.text = user.email;
    }

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '내 정보 수정'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: PrimaryButton(
          onPressed: () {
            ref.read(userProvider.notifier).updateInfo(
                  name: _nameController.text,
                  phone: _phoneController.text,
                  email: _emailController.text,
                );

            showCustomToast(context, msg: '저장이 완료되었습니다.');
            context.pop();
          },
          child: const Text('수정하기'),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 40.0,
          ),
          child: Container(
            color: MyColor.empty,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    const Spacer(),
                    Stack(
                      alignment: Alignment.center,
                      fit: StackFit.loose,
                      children: [
                        Image.asset(
                          ImagePath.user,
                          width: 100.0,
                          height: 100.0,
                        ),
                        Positioned(
                          right: -0.0,
                          bottom: -0.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: MyColor.text,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: PhosphorIcon(
                                PhosphorIcons.camera(),
                                size: 20.0,
                                color: MyColor.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 40.0),
                CustomTextFormField(
                  controller: _usernameController,
                  onChanged: (String? value) {},
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return null;
                  },
                  enabled: false,
                ),
                const SizedBox(height: 8.0),
                Text(
                  ' 아이디는 변경이 불가능합니다.',
                  style: MyTextStyle.caption12R.copyWith(
                    color: MyColor.darkGrey,
                  ),
                ),
                const SizedBox(height: 24.0),
                CustomTextFormField(
                  hintText: '비밀번호를 입력해 주세요.',
                  onChanged: (String? value) {},
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return null;
                  },
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 8.0),
                CustomTextFormField(
                  hintText: '비밀번호를 한 번 더 입력해 주세요.',
                  onChanged: (String? value) {},
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return null;
                  },
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 24.0),
                CustomTextFormField(
                  hintText: '이름을 입력해 주세요.',
                  controller: _nameController,
                  onChanged: (String? value) {},
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return null;
                  },
                ),
                const SizedBox(height: 8.0),
                CustomTextFormField(
                  hintText: '이메일을 입력해 주세요.',
                  controller: _phoneController,
                  onChanged: (String? value) {},
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return null;
                  },
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 8.0),
                CustomTextFormField(
                  hintText: '휴대전화 번호를 입력해 주세요.',
                  controller: _emailController,
                  onChanged: (String? value) {},
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return null;
                  },
                  textInputType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
