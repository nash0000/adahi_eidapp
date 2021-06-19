import 'package:adahi_eidapp/models/butcher_model.dart';
import 'package:adahi_eidapp/screens/meat_shops/meat_shops.dart';
import 'package:adahi_eidapp/shared/app_enum.dart';
import 'package:adahi_eidapp/shared/app_helper_methods.dart';
import 'package:adahi_eidapp/shared/app_helper_widgets.dart';
import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'update_butchersshops_cubit/update_butchers_shops_cubit.dart';
import 'update_butchersshops_cubit/update_butchers_shops_states.dart';

class UpdateButchersShops extends StatelessWidget {
  final butcherSHopID;

  final butcherShopNameController = TextEditingController();
  final butcherPhoneController = TextEditingController();
  final butcherShopAddressController = TextEditingController();
  final butcherShopAreaController = TextEditingController();

  UpdateButchersShops({@required this.butcherSHopID});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => UpdateButchersShopCubit(),
        child: BlocConsumer<UpdateButchersShopCubit, UpdateButchersShopStates>(
          listener: (context, state) {
            if (state is UpdateButchersShopLoadingState) {
              showProgressDialog(
                context: context,
                text: 'please wait ...',
              );
            }

            if (state is UpdateButchersShopSuccessState) {
              Navigator.pop(context);
              navigateAndFinish(context, AdminMeatShops());
              showToast(
                massage: 'Updated',
                color: ToastColors.SUCCESS,
              );
            }

            if (state is UpdateButchersShopErrorState) {
              Navigator.pop(context);
              showProgressDialog(
                context: context,
                text: 'in use',
                error: true,
              );
            }
          },
          builder: (context, state) => Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Add Butchers Shop'),
              backgroundColor: Colors.teal,
              elevation: 0.1,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.0,
                            ),
                            CustomTextFormField(
                                title: 'ShopName',
                                keyboardType: TextInputType.text,
                                controller: butcherShopNameController,
                                prefixIcon: Icons.person),
                            SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFormField(
                              title: 'butcherPhone',
                              controller: butcherPhoneController,
                              keyboardType: TextInputType.number,
                              prefixIcon: Icons.phone_android,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFormField(
                              prefixIcon: Icons.local_dining,
                              title: 'ShopAddress',
                              controller: butcherShopAddressController,
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFormField(
                              title: 'butcherShopArea',
                              controller: butcherShopAreaController,
                              keyboardType: TextInputType.text,
                              prefixIcon: Icons.place_rounded,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ////////// bottomNavigationBar/////////////////
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      elevation: 0.2,
                      onPressed: () {
                        //CartScreen();
                        //  navigateTo(context, AdminPage());
                      },
                      color: Colors.teal.shade700,
                      textColor: Colors.white,
                      child: Text(
                        'Back ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: MaterialButton(
                      elevation: 0.2,
                      onPressed: () {
                        UpdateButchersShopCubit.get(context)
                            .updateButcherInfo(butcherDataAsMap: {
                          kButcherShopName:
                              butcherShopNameController.text.trim(),
                          kButcherShopAddress:
                              butcherShopAddressController.text.trim(),
                          kButcherPhone: butcherPhoneController.text.trim(),
                          kButcherArea: butcherShopAreaController.text.trim(),
                        }, butcherShopID: butcherSHopID);
                      },
                      color: Colors.red.shade900,
                      textColor: Colors.white,
                      child: Text(
                        'Update ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //   height: 35,
          ),
        ),
      );
}
