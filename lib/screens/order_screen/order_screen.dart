import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/order_model.dart';
import '../../shared/app_enum.dart';
import '../../shared/app_helper_methods.dart';
import '../../shared/app_helper_widgets.dart';
import '../user_meat_shops/user_meat_shops.dart';
import 'order_cubit/order_cubit.dart';
import 'order_cubit/order_states.dart';

class OrderScreen extends StatelessWidget {
  final orderAddressController = TextEditingController();
  final orderWeightController = TextEditingController();

  final phoneNumber;
  final meatPrice;
  final avalibleMeatType;

  OrderScreen(
      {@required this.phoneNumber,
      @required this.meatPrice,
      @required this.avalibleMeatType});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(),
      child: BlocConsumer<OrderCubit, OrderStates>(
        listener: (context, state) {
          if (state is OrderLoadingState) {
            showProgressDialog(
              context: context,
              text: 'please wait ...',
            );
          }

          if (state is OrderSuccessState) {
            Navigator.pop(context);
            navigateTo(context, UserMeatShops());
          }

          if (state is OrderErrorState) {
            showToast(massage: 'Authentication', color: ToastColors.ERROR);
          }
        },
        builder: (context, state) => Scaffold(
            appBar: AppBar(
              elevation: 0.1,
              title: Text('Meat Detail'),
              backgroundColor: Colors.teal,
            ),
            body: Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Available Meat: $avalibleMeatType',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      'Click Me: $phoneNumber to call',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormField(
                      title: 'Meat Weight',
                      keyboardType: TextInputType.number,
                      controller: orderWeightController,
                      prefixIcon: Icons.shopping_bag,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormField(
                        title: 'Your Address',
                        keyboardType: TextInputType.text,
                        controller: orderAddressController,
                        prefixIcon: Icons.email),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'One KG price: $meatPrice JD',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    MaterialButton(
                      color: Colors.teal,
                      height: 50.0,
                      onPressed: () {
                        OrderCubit.get(context).calculatePrice(
                            meatPrice: meatPrice,
                            meatWeight: orderWeightController.text.trim());
                      },
                      child: Text(
                        'Calculate Price',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Total price: ${OrderCubit.get(context).totalPrice} JD',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    MaterialButton(
                      color: Colors.teal,
                      height: 50.0,
                      onPressed: () {
                        OrderCubit.get(context).saveOrder(
                            orderModel: OrderModel(
                                orderMeatType: avalibleMeatType,
                                orderWeight: orderWeightController.text.trim(),
                                orderAddress:
                                    orderAddressController.text.trim()));
                      },
                      child: Text(
                        'Submit Order',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
