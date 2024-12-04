enum OrderStatus {
  approval("매칭승인"),
  complete("매칭완료");

  const OrderStatus(this.label);

  final String label;
}

class OrderModel {
  String id;
  String title;
  String itemType;
  OrderStatus orderStatus;
  String mainImageUrl;
  DateTime createdDt;

  OrderModel({
    required this.id,
    required this.title,
    required this.itemType,
    required this.orderStatus,
    required this.mainImageUrl,
    required this.createdDt,
  });

  OrderModel copyWith({
    String? id,
    String? title,
    String? itemType,
    OrderStatus? orderStatus,
    String? mainImageUrl,
    DateTime? createdDt,
  }) {
    return OrderModel(
      id: id ?? this.id,
      title: title ?? this.title,
      itemType: itemType ?? this.itemType,
      orderStatus: orderStatus ?? this.orderStatus,
      mainImageUrl: mainImageUrl ?? this.mainImageUrl,
      createdDt: createdDt ?? this.createdDt,
    );
  }
}
