class OrderModel {
  String orderID;
  String orderMeatType;

  double orderTotalPrice;
  String orderAddress;
  String availableMeatID;
  String orderWeight;

  OrderModel({
    this.orderID,
    this.orderMeatType,
    this.orderTotalPrice,
    this.orderAddress,
    this.availableMeatID,
    this.orderWeight,
  });
}
