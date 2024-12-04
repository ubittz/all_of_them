import 'package:all_of_them/common/utils/data_utils.dart';
import 'package:all_of_them/profile/view/chat_screen.dart';
import 'package:all_of_them/profile/view/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../model/order_model.dart';

class OrderCard extends StatelessWidget {
  final String id;
  final String title;
  final String itemType;
  final OrderStatus orderStatus;
  final String mainImageUrl;
  final DateTime createdDt;

  const OrderCard({
    super.key,
    required this.id,
    required this.title,
    required this.itemType,
    required this.orderStatus,
    required this.mainImageUrl,
    required this.createdDt,
  });

  factory OrderCard.fromModel({required OrderModel model}) {
    return OrderCard(
      id: model.id,
      title: model.title,
      itemType: model.itemType,
      orderStatus: model.orderStatus,
      mainImageUrl: model.mainImageUrl,
      createdDt: model.createdDt,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width - 24;

    return Container(
      color: MyColor.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'No.${id.substring(0, 6).toUpperCase()}',
                style: MyTextStyle.body16B,
              ),
              Container(
                decoration: BoxDecoration(
                  color: MyColor.primary,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                  child: Text(
                    orderStatus.label,
                    style: MyTextStyle.description14M.copyWith(
                      color: MyColor.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  mainImageUrl,
                  width: 120.0,
                  height: 120.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: MyTextStyle.subtitle18B,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      "매칭일 ${DataUtils.convertDateTimeToDateString(datetime: createdDt)}",
                      style: MyTextStyle.description14R,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 16.0),
                    _renderButtons(
                      context: context,
                      id: id,
                      orderStatus: orderStatus,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _renderButtons({
    required BuildContext context,
    required String id,
    required OrderStatus orderStatus,
  }) {
    return Row(
      children: [
        orderStatus == OrderStatus.approval
            ? Expanded(
                child: InkWell(
                  onTap: () {
                    context.goNamed(
                      PaymentScreen.routeName,
                      pathParameters: {"id": id},
                    );
                    context.pushNamed(PaymentScreen.routeName);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: MyColor.primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PhosphorIcon(
                            PhosphorIcons.creditCard(),
                            size: 16.0,
                          ),
                          const SizedBox(width: 2.0),
                          Text(
                            '결제',
                            style: MyTextStyle.description14R,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Expanded(
                child: InkWell(
                  onTap: () {
                    context.goNamed(
                      ChatScreen.routeName,
                      pathParameters: {"id": id},
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: MyColor.primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PhosphorIcon(
                            PhosphorIcons.chatCircle(),
                            size: 16.0,
                          ),
                          const SizedBox(width: 2.0),
                          Text(
                            '채팅',
                            style: MyTextStyle.description14R,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
        const SizedBox(width: 8.0),
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: MyColor.primary,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '상세보기',
                  style: MyTextStyle.description14R,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
