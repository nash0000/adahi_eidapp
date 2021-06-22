import 'package:adahi_eidapp/models/butcher_model.dart';
import 'package:adahi_eidapp/screens/add_meat/add_meat_screen.dart';
import 'package:adahi_eidapp/screens/admin_meat_shops/admin_meat_shops.dart';
import 'package:adahi_eidapp/shared/app_enum.dart';
import 'package:adahi_eidapp/shared/app_helper_methods.dart';
import 'package:adahi_eidapp/shared/app_helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_butchersshops_cubit/add_butchers_shops_cubit.dart';
import 'add_butchersshops_cubit/add_butchers_shops_states.dart';

class AddButchersShops extends StatelessWidget {
  final butcherIDController = TextEditingController();
  final butcherShopNameController = TextEditingController();
  final butcherPhoneController = TextEditingController();
  final butcherImgController = TextEditingController();
  final butcherShopAddressController = TextEditingController();
  final butcherShopAreaController = TextEditingController();
  final butcherEmailController = TextEditingController();
  final butcherPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => AddButchersShopCubit(),
        child: BlocConsumer<AddButchersShopCubit, AddButchersShopStates>(
          listener: (context, state) {
            if (state is AddButchersShopLoadingState) {
              showProgressDialog(
                context: context,
                text: 'please wait ...',
              );
            }

            if (state is AddButchersShopSuccessState) {
              Navigator.pop(context);
              navigateTo(context, AddMeat());
              showToast(
                massage: 'created',
                color: ToastColors.SUCCESS,
              );
            }

            if (state is AddButchersShopErrorState) {
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
                                title: 'Email',
                                controller: butcherEmailController,
                                prefixIcon: Icons.email),
                            SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFormField(
                              title: 'Password',
                              controller: butcherPasswordController,
                              keyboardType: TextInputType.visiblePassword,
                              prefixIcon: Icons.lock,
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFormField(
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
                        navigateAndFinish(context, AdminMeatShops());
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
                        // String butcherID = butcherIDController.text;
                        String butcherShopName = butcherShopNameController.text;
                        String butcherEmail = butcherEmailController.text;
                        String butcherPassword = butcherPasswordController.text;
                        String butcherArea = butcherShopAreaController.text;
                        String butcherAddress =
                            butcherShopAddressController.text;
                        String butcherPhone = butcherPhoneController.text;
                        AddButchersShopCubit.get(context).saveButcherInfo(
                            butcherModel: ButcherModel(
                          //  butcherID: butcherIDController.text.trim(),
                          butcherEmail: butcherEmailController.text.trim(),
                          butcherPassword:
                              butcherPasswordController.text.trim(),
                          butcherShopName:
                              butcherShopNameController.text.trim(),
                          butcherPhone: butcherPhoneController.text.trim(),
                          butcherArea: butcherShopAreaController.text.trim(),
                          butcherAddress:
                              butcherShopAddressController.text.trim(),
                        ));
                        if ( //butcherIDController.text.trim().isEmpty ||
                            butcherShopNameController.text.trim().isEmpty ||
                                butcherEmailController.text.trim().isEmpty ||
                                butcherPasswordController.text.trim().isEmpty ||
                                butcherShopAreaController.text.trim().isEmpty ||
                                butcherShopAddressController.text
                                    .trim()
                                    .isEmpty ||
                                butcherPhoneController.text.trim().isEmpty) {
                          showToast(
                            massage: 'Please enter your data',
                            color: ToastColors.ERROR,
                          );
                        } else {
                          if (!butcherEmailController.text
                              .trim()
                              .contains('@')) {
                            showToast(
                              massage: 'Please enter a valid email',
                              color: ToastColors.ERROR,
                            );
                          } else if (butcherPasswordController.text
                                  .trim()
                                  .length <
                              6) {
                            showToast(
                              massage: 'your password must be at least 6 char',
                              color: ToastColors.ERROR,
                            );
                          } else {}
                          print('========');
                        }
                      },
                      color: Colors.red.shade900,
                      textColor: Colors.white,
                      child: Text(
                        'Save ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),

/////////===============

            //   height: 35,
          ),
        ),
      );

  /////
}
