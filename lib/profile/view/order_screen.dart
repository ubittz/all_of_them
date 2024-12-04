import 'package:all_of_them/common/component/divider_container.dart';
import 'package:all_of_them/common/const/text_styles.dart';
import 'package:all_of_them/common/layout/default_app_bar.dart';
import 'package:all_of_them/common/layout/default_layout.dart';
import 'package:all_of_them/profile/component/order_card.dart';
import 'package:all_of_them/profile/provider/order_provider.dart';
import 'package:all_of_them/profile/view/order_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OrderScreen extends ConsumerWidget {
  static String get routeName => 'order';

  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(orderProvider);
    orders.sort((a, b) => b.createdDt.compareTo(a.createdDt));

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '매칭 내역'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Text(
              "총 ${orders.length}건",
              style: MyTextStyle.subtitle18R,
            ),
          ),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final order = orders[index];
                return GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      OrderDetailScreen.routeName,
                      pathParameters: {'id': order.id},
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 20.0,
                    ),
                    child: OrderCard.fromModel(model: order),
                  ),
                );
              },
              separatorBuilder: (_, index) {
                return const DividerContainer();
              },
              itemCount: orders.length,
            ),
          ),
        ],
      ),
    );
  }
}
