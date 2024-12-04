import 'package:all_of_them/common/component/custom_text_form_field.dart';
import 'package:all_of_them/common/const/colors.dart';
import 'package:all_of_them/common/const/image_path.dart';
import 'package:all_of_them/common/const/text_styles.dart';
import 'package:all_of_them/common/layout/default_app_bar.dart';
import 'package:all_of_them/common/layout/default_layout.dart';
import 'package:all_of_them/profile/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChatScreen extends ConsumerStatefulWidget {
  static String get routeName => 'chat';

  final String id;

  const ChatScreen({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}
class _ChatScreenState extends ConsumerState<ChatScreen> {
  List<Map<String, String>> chatMessages = []; // 채팅 메시지 리스트
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final order = ref.watch(orderDetailProvider(widget.id));

    return DefaultLayout(
      appbar: DefaultAppBar(title: order.title),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(width: 1.0, color: MyColor.middleGrey),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '문의 채팅이 시작 되었습니다.',
                  style: MyTextStyle.body16R,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: chatMessages.length,
                itemBuilder: (context, index) {
                  final message = chatMessages[index];
                  return message['type'] == 'answer'
                      ? _renderAnswer(title: message['message']!)
                      : _renderQuestion(
                          title: message['message']!,
                          mainImageUrl: order.mainImageUrl,
                        );
                },
              ),
            ),
            CustomTextFormField(
              controller: controller,
              hintText: "채팅 입력",
              onEditingComplete: () {
                setState(() {
                  if (controller.text.isNotEmpty) {
                    final userMessage = controller.text;

                    chatMessages.add({
                      'type': 'answer',
                      'message': userMessage,
                    });

                    // 두 번째 이후 대답은 사용자의 입력을 따라함
                    if (chatMessages
                        .where((msg) => msg['type'] == 'question')
                        .isNotEmpty) {
                      chatMessages.add({
                        'type': 'question',
                        'message': userMessage, // 사용자의 말을 따라함
                      });
                    } else {
                      chatMessages.add({
                        'type': 'question',
                        'message': '안녕하세요!\n${order.title}입니다!',
                      });
                    }

                    controller.clear(); 
                  }
                });
              },
              onChanged: (String value) {},
              onSaved: (String? newValue) {},
              validator: (String? value) {
                return null;
              },
              suffixIcon: PhosphorIcon(
                PhosphorIcons.magnifyingGlass(),
                color: MyColor.darkGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderQuestion({
    required String title,
    required String mainImageUrl,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: MyColor.middleGrey),
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.asset(
                mainImageUrl,
                height: 48.0,
                width: 48.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12.0),
          Container(
            decoration: const BoxDecoration(
              color: MyColor.lightGrey,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 12.0, vertical: 8.0),
              child: Text(
                title,
                style: MyTextStyle.body16R,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderAnswer({required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: MyColor.lightGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Text(
                title,
                style: MyTextStyle.body16R,
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: MyColor.middleGrey),
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.asset(
                ImagePath.user,
                height: 48.0,
                width: 48.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}