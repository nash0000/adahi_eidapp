import 'package:adahi_eidapp/models/cart_model.dart';
import 'package:adahi_eidapp/screens/cart/cart_cubit/cart_cubit.dart';
import 'package:adahi_eidapp/screens/cart/cart_cubit/cart_state.dart';
import 'package:adahi_eidapp/screens/meat_detail_screen/meat_detail_screen.dart';
import 'package:adahi_eidapp/shared/app_helper_methods.dart';
import 'package:adahi_eidapp/shared/app_helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => CartCubit()..loadAllCartsForUser(),
        child: BlocConsumer<CartCubit, CartStates>(
            listener: (context, state) {},
            builder: (context, state) {
              List<CartModel> carts = CartCubit.get(context).carts;

              return Scaffold(
                appBar: AppBar(
                  title: Text('Cart'),
                  backgroundColor: Colors.teal,
                ),
                body: Column(
                  children: [
                    SizedBox(
                      height: 15.0,
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.only(top: 10.0),
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            navigateTo(
                              context,
                              MeatDetail(),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  15.0,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.amberAccent,
                                      child: Image.network(
                                        '${carts[index].cartImg}',
                                      ),
                                      radius: 35.0,
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  '${carts[index].cartName}',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            carts[index].cartQuantity,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ),

                                          // TextButton(
                                          //   child: ,
                                          //   '${butchers[index].butcherPhone}',
                                          //   maxLines: 2,
                                          //   overflow: TextOverflow.ellipsis,
                                          //   style: TextStyle(
                                          //       fontWeight: FontWeight.bold,
                                          //       color: Colors.grey),
                                          // ),
                                        ],
                                      ),
                                    ),
                                    // Column(
                                    //   children: [
                                    //     IconButton(
                                    //         icon: Icon(Icons.edit),
                                    //         onPressed: () {
                                    //           // navigateTo(
                                    //           //     context,
                                    //           //     UpdateButchersShops(
                                    //           //       butcherSHopID:
                                    //           //           butchers[index]
                                    //           //               .butcherID,
                                    //           //     ));
                                    //         }),
                                    //     SizedBox(
                                    //       height: 20.0,
                                    //     ),
                                    //     IconButton(
                                    //       icon: Icon(Icons.delete),
                                    //       // onPressed: () {
                                    //       //   AdminMeatShopsCubit.get(context)
                                    //       //       .deleteMeatShop(
                                    //       //           index: index,
                                    //       //           butcherShopID:
                                    //       //               butchers[index]
                                    //       //                   .butcherID);
                                    //       // }
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        itemCount: carts.length,
                        //butchers.length,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      );
}
