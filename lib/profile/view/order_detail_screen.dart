import 'package:all_of_them/common/component/default_button.dart';
import 'package:all_of_them/common/const/text_styles.dart';
import 'package:all_of_them/common/layout/default_app_bar.dart';
import 'package:all_of_them/common/layout/default_layout.dart';
import 'package:all_of_them/common/utils/data_utils.dart';
import 'package:all_of_them/profile/model/order_model.dart';
import 'package:all_of_them/profile/provider/order_provider.dart';
import 'package:all_of_them/profile/view/chat_screen.dart';
import 'package:all_of_them/profile/view/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OrderDetailScreen extends ConsumerWidget {
  static String get routeName => 'order_detail';

  final String id;

  const OrderDetailScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(orderDetailProvider(id));

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '매칭 상세'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: PrimaryButton(
          onPressed: () {
            order.orderStatus == OrderStatus.approval
                ? context.goNamed(
                    PaymentScreen.routeName,
                    pathParameters: {"id": order.id},
                  )
                : context.goNamed(
                    ChatScreen.routeName,
                    pathParameters: {"id": order.id},
                  );
          },
          child: order.orderStatus == OrderStatus.approval
              ? const Text('결제하기')
              : const Text('채팅하기'),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('매칭 정보', style: MyTextStyle.subtitle18B),
              const SizedBox(height: 12.0),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      order.mainImageUrl,
                      width: 120.0,
                      height: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      children: [
                        _renderTitleAndDescription(
                          title: '매칭 No.',
                          description: id.substring(0, 6).toUpperCase(),
                        ),
                        _renderTitleAndDescription(
                          title: '매칭 상태',
                          description: order.orderStatus.label,
                        ),
                        _renderTitleAndDescription(
                          title: '매칭일',
                          description: DataUtils.convertDateTimeToDateString(
                            datetime: order.createdDt,
                          ),
                        ),
                        _renderTitleAndDescription(
                          title: '모두포명',
                          description: order.title,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40.0),
              if (order.orderStatus == OrderStatus.complete)
                Text('결제 정보', style: MyTextStyle.subtitle18B),
              if (order.orderStatus == OrderStatus.complete)
                const SizedBox(height: 12.0),
              if (order.orderStatus == OrderStatus.complete)
                Column(
                  children: [
                    _renderTitleAndDescription(
                      title: '결제수단',
                      description: '신용카드',
                    ),
                    _renderTitleAndDescription(
                      title: '계좌/카드정보',
                      description: '국민카드',
                    ),
                    _renderTitleAndDescription(
                      title: '할부정보',
                      description: '일시불',
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderTitleAndDescription({
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 100.0,
            child: Text(
              title,
              style: MyTextStyle.body16M,
            ),
          ),
          Expanded(
            child: Text(
              description,
              style: MyTextStyle.body16M,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
