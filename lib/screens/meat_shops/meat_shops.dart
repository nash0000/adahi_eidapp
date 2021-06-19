import 'package:adahi_eidapp/database/remote_db/cloud_firesore.dart';
import 'package:adahi_eidapp/models/butcher_model.dart';
import 'package:adahi_eidapp/screens/add_butchers_shops/add_butchers_shops.dart';
import 'package:adahi_eidapp/screens/meat_detail_screen/meat_detail_screen.dart';
import 'package:adahi_eidapp/screens/meat_shops/meat_cubit/meat_shops-states.dart';
import 'package:adahi_eidapp/screens/meat_shops/meat_cubit/meat_shops_cubit.dart';
import 'package:adahi_eidapp/screens/update_butchers_shops/update_butchers_shops.dart';

//import 'package:adahi_eidapp/screens/order_screen/order_screen.dart';
import 'package:adahi_eidapp/shared/app_helper_methods.dart';
import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeatShops extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => MeatShopsCubit()..loadAllMeatShopsForUser(),
        child: BlocConsumer<MeatShopsCubit, MeatShopsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            List<ButcherModel> butchers = MeatShopsCubit.get(context).butchers;
            return Scaffold(
              appBar: AppBar(
                title: Text(' Meat Shops '),
                // actions: [
                //   IconButton(
                //       icon: Icon(Icons.add),
                //       onPressed: () {
                //         navigateTo(context, AddButchersShops());
                //       }),
                //   SizedBox(
                //     width: 20.0,
                //   )
                // ],
                backgroundColor: Colors.teal,
              ),
              body: ConditionalBuilder(
                condition: state is! MeatShopsLoadingState,
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
                              MeatDetail(),
                            );
                            //navigateTo(context, OrderScreen());
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
                                      // child: Image.network(
                                      //   '${butchers[index].img}',
                                      // ),
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
                                            butchers[index].butcherPhone,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            '${butchers[index].butcherPhone}',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                            icon: Icon(Icons.edit),
                                            onPressed: () {
                                              navigateTo(
                                                  context,
                                                  UpdateButchersShops(
                                                    butcherSHopID:
                                                        butchers[index]
                                                            .butcherID,
                                                  ));
                                            }),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () {
                                              MeatShopsCubit.get(context)
                                                  .deleteMeatShop(
                                                      index: index,
                                                      butcherShopID:
                                                          butchers[index]
                                                              .butcherID);
                                            }),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          //   separatorBuilder: (context, index) => SizedBox(
                          // height: 20.0,
                          // ),
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
