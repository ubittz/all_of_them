import 'package:all_of_them/common/component/custom_text_form_field.dart';
import 'package:all_of_them/common/component/toss_payment_container.dart';
import 'package:all_of_them/common/const/colors.dart';
import 'package:all_of_them/common/const/text_styles.dart';
import 'package:all_of_them/common/utils/data_utils.dart';
import 'package:all_of_them/common/view/completion_screen.dart';
import 'package:all_of_them/profile/model/order_model.dart';
import 'package:all_of_them/profile/provider/order_provider.dart';
import 'package:all_of_them/user/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/component/default_button.dart';
import '../../common/component/divider_container.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../user/model/user_model.dart';
import '../../user/provider/user_provider.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  static String get routeName => 'payment';

  final String id;

  const PaymentScreen({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  bool isLoading = false;
  int productPrice = 0;
  int totalPrice = 0;

  String cardName = ''; // 카드사 이름

  @override
  Widget build(BuildContext context) {
    final OrderModel order = ref.watch(orderDetailProvider(widget.id));
    final user = ref.watch(userProvider) as UserModel;

    return DefaultLayout(
      isLoading: isLoading,
      appbar: const DefaultAppBar(title: '주문/결제'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProductInfo(order: order),
              // if (reservation != null) ProductInfo(pool: reservation.pool),
              const DividerContainer(),
              OrderInfo(
                user: user,
                totalPrice: 300000, //reservation == null ? 0 : reservation.price,
                discountPrice: 30000, //discountPrice,
              ),
              const DividerContainer(),
              DeliveryInfo(address: user.address),
              const DividerContainer(),
              TossPaymentContainer(
                onChanged: (value) {
                  cardName = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: PrimaryButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await Future.delayed(const Duration(seconds: 2));
                    setState(() {
                      isLoading = false;
                    });

                    context.goNamed(
                      CompletionScreen.routeName,
                      pathParameters: {'title': '결제가\n정상적으로\n완료되었습니다.'},
                    );
                    ref.read(orderProvider.notifier).updateOrderStatus(
                          id: order.id,
                          orderStatus: OrderStatus.complete,
                        );
                  },
                  child: const Text('결제하기'),
                ),
              ),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}

class DeliveryInfo extends ConsumerStatefulWidget {
  final AddressModel address;

  const DeliveryInfo({
    super.key,
    required this.address,
  });

  @override
  ConsumerState<DeliveryInfo> createState() => _DeliveryInfoState();
}

class _DeliveryInfoState extends ConsumerState<DeliveryInfo> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _detailAddressController =
      TextEditingController();
  final TextEditingController _memoController = TextEditingController();

  bool isSelectedEqual = true;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _detailAddressController.dispose();
    _memoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isSelectedEqual) {
      _nameController.text = widget.address.name;
      _phoneController.text = widget.address.phone;
      _addressController.text = widget.address.address;
      _detailAddressController.text = widget.address.detailAddress;
      _memoController.text = widget.address.memo;
    } else {
      _nameController.text = '';
      _phoneController.text = '';
      _addressController.text = '';
      _detailAddressController.text = '';
      _memoController.text = '';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '배송 정보',
            style: MyTextStyle.title20B,
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '주문자 정보와 동일',
                style: MyTextStyle.description14M,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isSelectedEqual = !isSelectedEqual;
                  });
                },
                icon: PhosphorIcon(
                  isSelectedEqual
                      ? PhosphorIcons.checkSquare(PhosphorIconsStyle.fill)
                      : PhosphorIcons.square(),
                  size: 24.0,
                  color: MyColor.text,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          _renderTitleAndForm(
            title: '받으시는 분',
            controller: _nameController,
          ),
          const SizedBox(height: 4.0),
          _renderTitleAndForm(
            title: '연락처',
            controller: _phoneController,
          ),
          const SizedBox(height: 4.0),
          _renderTitleAndForm(
            title: '주소',
            controller: _addressController,
          ),
          const SizedBox(height: 4.0),
          _renderTitleAndForm(
            title: '상세주소',
            controller: _detailAddressController,
          ),
          const SizedBox(height: 4.0),
          _renderTitleAndForm(
            title: '배송메모',
            controller: _memoController,
          ),
        ],
      ),
    );
  }

  Widget _renderTitleAndForm({
    required String title,
    required TextEditingController controller,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 100.0,
          child: Text(
            title,
            style: MyTextStyle.description14R,
          ),
        ),
        Expanded(
          child: CustomTextFormField(
            controller: controller,
            onChanged: (String value) {},
            onSaved: (String? newValue) {},
            validator: (String? value) {
              return null;
            },
            style: MyTextStyle.description14R,
          ),
        ),
      ],
    );
  }
}

class OrderInfo extends StatelessWidget {
  final UserModel user;
  final int totalPrice;
  final int discountPrice;

  const OrderInfo({
    super.key,
    required this.user,
    required this.totalPrice,
    required this.discountPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '주문 정보',
            style: MyTextStyle.title20B,
          ),
          const SizedBox(height: 8.0),
          _renderTitleAndDescription(
            title: '주문자',
            description: user.name,
            isEmphasis: false,
          ),
          const SizedBox(height: 4.0),
          _renderTitleAndDescription(
            title: '주문자 연락처',
            description: user.phone,
            isEmphasis: false,
          ),
          const SizedBox(height: 4.0),
          _renderTitleAndDescription(
            title: '상품 금액',
            description:
                '${DataUtils.convertPriceToMoneyString(price: totalPrice + discountPrice)} 원',
            isEmphasis: false,
          ),
          const SizedBox(height: 4.0),
          _renderTitleAndDescription(
            title: '할인 금액',
            description:
                '${DataUtils.convertPriceToMoneyString(price: discountPrice)} 원',
            isEmphasis: false,
          ),
          const SizedBox(height: 4.0),
          _renderTitleAndDescription(
            title: '최종 결제 금액',
            description:
                '${DataUtils.convertPriceToMoneyString(price: totalPrice)} 원',
            isEmphasis: true,
          ),
        ],
      ),
    );
  }

  Widget _renderTitleAndDescription({
    required String title,
    required String description,
    required bool isEmphasis,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: isEmphasis ? MyTextStyle.body16B : MyTextStyle.body16R,
          ),
          Text(
            description,
            style: isEmphasis ? MyTextStyle.body16B : MyTextStyle.body16R,
          ),
        ],
      ),
    );
  }
}

class ProductInfo extends StatelessWidget {
  final OrderModel order;

  const ProductInfo({
    super.key,
    required this.order,
  });

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('매칭 정보', style: MyTextStyle.title20B),
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
                      description: order.id.substring(0, 6).toUpperCase(),
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
          )
        ],
      ),
    );
  }
}
