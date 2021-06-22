import 'package:adahi_eidapp/models/butcher_model.dart';
import 'package:adahi_eidapp/screens/user_meat_shops/user_meat_shops_cubit/user_meatshops_cubit.dart';
import 'package:adahi_eidapp/screens/user_meat_shops/user_meat_shops_cubit/user_meatshops_state.dart';
import 'package:adahi_eidapp/shared/app_helper_methods.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../order_screen/order_screen.dart';

class UserMeatShops extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => UserMeatShopsCubit()..loadAllMeatShopsForUser(),
        child: BlocConsumer<UserMeatShopsCubit, UserMeatShopsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            List<ButcherModel> butchers =
                UserMeatShopsCubit.get(context).butchers;
            return Scaffold(
              appBar: AppBar(
                title: Text('User Meat Shops'),
                backgroundColor: Colors.teal,
              ),
              body: ConditionalBuilder(
                condition: state is! UserMeatShopsLoadingState,
                builder: (context) => Column(
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
                              OrderScreen(
                                meatPrice: butchers[index].butcherMeatPrice,
                                avalibleMeatType:
                                    butchers[index].butcherMeatType,
                                phoneNumber: butchers[index].butcherPhone,
                              ),
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
                                      child: Text(
                                        '${butchers[index].butcherMeatPrice} JD',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
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
                                                  '${butchers[index].butcherShopName}',
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
                                            '${butchers[index].butcherMeatType}',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        itemCount: butchers.length,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
                fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          },
        ),
      );
}
