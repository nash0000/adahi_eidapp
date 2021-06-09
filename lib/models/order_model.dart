class OrderModel {
  String orderID;
  String orderTime;
  String userEmail;
  double orderTotalPrice;
  String orderAddress;
  String availableMeatID;

  OrderModel({
    this.orderID,
    this.orderTime,
    this.userEmail,
    this.orderTotalPrice,
    this.orderAddress,
    this.availableMeatID,
  });
}
