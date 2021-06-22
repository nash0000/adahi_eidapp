abstract class OrderStates {}

class OrderInitialState extends OrderStates {}

class OrderLoadingState extends OrderStates {}

class OrderSuccessState extends OrderStates {}

class OrderErrorState extends OrderStates {
  final error;
  OrderErrorState(this.error);
}

class OrderCalculatePriceState extends OrderStates {}
