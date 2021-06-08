class OrderModel {
  String orderID;
  String orderTime;
  String userEmail;
  double orderTotalPrice;
  String orderAddress;

  OrderModel({
    this.orderID,
    this.orderTime,
    this.userEmail,
    this.orderTotalPrice,
    this.orderAddress,
  });
}
