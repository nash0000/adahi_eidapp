import 'package:adahi_eidapp/database/remote_db/cloud_firesore.dart';
import 'package:adahi_eidapp/models/order_model.dart';
import 'package:adahi_eidapp/screens/order_screen/order_cubit/order_states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<OrderStates> {
  OrderCubit() : super(OrderInitialState());

  static OrderCubit get(context) => BlocProvider.of(context);

  double totalPrice = 0.0;

  calculatePrice({meatPrice, meatWeight}) {
    totalPrice = double.parse(meatPrice) * double.parse(meatWeight);
    emit(OrderCalculatePriceState());
  }

  saveOrder({@required OrderModel orderModel}) {
    emit(OrderLoadingState());

    CloudService.saveOrder(
            orderModel: OrderModel(
      orderMeatType: orderModel.orderMeatType,
      orderWeight: orderModel.orderWeight,
      orderAddress: orderModel.orderAddress,
      orderTotalPrice: totalPrice,
    )).then((value) => emit(OrderSuccessState())).catchError(
          (error) => emit(OrderErrorState(error.toString())),
        );
  }
}
