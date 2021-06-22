class OrderModel {
  String orderID;
  String orderMeatType;
  String userEmail;
  double orderTotalPrice;
  String orderAddress;
  String availableMeatID;

  OrderModel({
    this.orderID,
    this.orderMeatType,
    this.userEmail,
    this.orderTotalPrice,
    this.orderAddress,
    this.availableMeatID,
  });
}
