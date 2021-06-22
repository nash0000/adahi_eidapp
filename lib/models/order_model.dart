class OrderModel {
  String orderID;
  String orderMeatType;
  double orderTotalPrice;
  String orderAddress;
  String orderAvailableForDeliveryID;
  String orderWeight;

  OrderModel({
    this.orderID,
    this.orderMeatType,
    this.orderTotalPrice,
    this.orderAddress,
    this.orderAvailableForDeliveryID,
    this.orderWeight,
  });
}
