import 'package:all_of_them/common/utils/data_utils.dart';
import 'package:all_of_them/festival/provider/festival_provider.dart';
import 'package:all_of_them/partner/provider/partner_provider.dart';
import 'package:all_of_them/place/provider/place_provider.dart';
import 'package:all_of_them/profile/model/order_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderDetailProvider = Provider.family<OrderModel, String>(
  (ref, id) {
    final order =
        ref.watch(orderProvider).firstWhere((element) => element.id == id);
    return order;
  },
);

final orderProvider = StateNotifierProvider<OrderProvider, List<OrderModel>>(
  (ref) => OrderProvider(ref: ref),
);

class OrderProvider extends StateNotifier<List<OrderModel>> {
  Ref ref;

  OrderProvider({
    required this.ref,
  }) : super([]) {
    state = getItems();
  }

  void addOrder({
    required OrderModel order,
  }) {
    state = [
      ...state,
      order,
    ];
  }

  void updateOrderStatus({
    required String id,
    required OrderStatus orderStatus,
  }) {
    state = state.map((e) {
      if (e.id == id) {
        return e.copyWith(orderStatus: orderStatus);
      } else {
        return e;
      }
    }).toList();
  }

  List<OrderModel> getItems() {
    final now = DateTime.now();

    final partners = ref.read(partnerProvider);
    final places = ref.read(placeProvider);
    final festivals = ref.read(festivalProvider);

    final ids = [
      ...partners.map((e) => e.id),
      ...places.map((e) => e.id),
      ...festivals.map((e) => e.id),
    ];

    final titlesAndImagesAndItemTypes = [
      ...partners.map((e) => [e.name, e.mainImageUrl, 'partner']),
      ...places.map((e) => [e.name, e.mainImageUrl, 'place']),
      ...festivals.map((e) => [e.name, e.mainImageUrl, 'festival']),
    ];
    final items = DataUtils.getRandomShuffledList<List<String>>(
        titlesAndImagesAndItemTypes);

    return List.generate(10, (index) {
      final randomMonth = DataUtils.getRandomInt(dividerNumber: now.month);
      final randomDay = DataUtils.getRandomInt(dividerNumber: 28);
      final randomHour = DataUtils.getRandomInt(dividerNumber: 8) + 12;
      final item = items[index];

      return OrderModel(
        id: ids[index],
        title: item[0],
        itemType: item[2],
        orderStatus: randomMonth == now.month - 1
            ? OrderStatus.approval
            : OrderStatus.complete,
        mainImageUrl: item[1],
        createdDt: DateTime(2024, randomMonth, randomDay, randomHour, 0),
      );
    });
  }
}
