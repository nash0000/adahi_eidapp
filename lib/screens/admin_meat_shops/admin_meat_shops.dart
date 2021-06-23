import 'package:adahi_eidapp/models/butcher_model.dart';
import 'package:adahi_eidapp/screens/add_butchers_shops/add_butchers_shops.dart';
import 'package:adahi_eidapp/screens/admin_meat_shops/meat_cubit/admin_meat_shops-states.dart';
import 'package:adahi_eidapp/screens/admin_meat_shops/meat_cubit/admin_meat_shops_cubit.dart';
import 'package:adahi_eidapp/screens/update_butchers_shops/update_butchers_shops.dart';
import 'package:adahi_eidapp/screens/welcome_screen/welcome_screen.dart';
import 'package:adahi_eidapp/shared/app_enum.dart';
import 'package:adahi_eidapp/shared/app_helper_methods.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminMeatShops extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => AdminMeatShopsCubit()..loadAllMeatShopsForUser(),
        child: BlocConsumer<AdminMeatShopsCubit, AdminMeatShopsStates>(
          listener: (context, state) {
            if (state is AdminMeatShopsLoadingState) {
              showProgressDialog(
                context: context,
                text: 'please wait ...',
              );
            }

            if (state is AdminMeatShopsSuccessState) {
              Navigator.pop(context);
              navigateTo(context, WelcomeScreen());
              showToast(
                massage: 'created',
                color: ToastColors.SUCCESS,
              );
            }

            if (state is AdminMeatShopsErrorState) {
              Navigator.pop(context);
              showProgressDialog(
                context: context,
                text: 'in use',
                error: true,
              );
            }
          },
          builder: (context, state) {
            List<ButcherModel> butchers =
                AdminMeatShopsCubit.get(context).butchers;
            return Scaffold(
              appBar: AppBar(
                title: Text('Admin Meat Shops'),
                actions: [
                  IconButton(
                      icon: Icon(Icons.add),
                      iconSize: 20.0,
                      onPressed: () {
                        navigateTo(context, AddButchersShops());
                      }),
                  SizedBox(
                    width: 20.0,
                  )
                ],
                backgroundColor: Colors.teal,
              ),
              body: ConditionalBuilder(
                condition: state is! AdminMeatShopsLoadingState,
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
                                      backgroundColor: Colors.teal,
                                      child: Text(
                                        '${butchers[index].butcherMeatPrice}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 32),
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
                                            butchers[index].butcherPhone,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade900),
                                          ),
                                          Text(
                                            '${butchers[index].butcherArea}',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
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
                                    Column(
                                      children: [
                                        IconButton(
                                            icon: Icon(Icons.edit_outlined),
                                            color: Colors.teal,
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
                                            icon: Icon(
                                                Icons.delete_forever_rounded),
                                            color: Colors.red.shade900,
                                            onPressed: () {
                                              AdminMeatShopsCubit.get(context)
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
