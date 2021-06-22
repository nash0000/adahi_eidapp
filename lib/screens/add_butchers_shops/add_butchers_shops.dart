import 'package:adahi_eidapp/shared/app_enum.dart';
import 'package:adahi_eidapp/shared/app_helper_methods.dart';
import 'package:adahi_eidapp/shared/app_helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/butcher_model.dart';
import '../admin_meat_shops/admin_meat_shops.dart';
import 'add_butchersshops_cubit/add_butchers_shops_cubit.dart';
import 'add_butchersshops_cubit/add_butchers_shops_states.dart';

class AddButchersShops extends StatelessWidget {
  final butcherShopNameController = TextEditingController();
  final butcherPhoneController = TextEditingController();
  final butcherShopAreaController = TextEditingController();
  final butcherMeatPriceController = TextEditingController();

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
              navigateTo(context, AdminMeatShops());
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
                                title: 'Shop Name',
                                keyboardType: TextInputType.text,
                                controller: butcherShopNameController,
                                prefixIcon: Icons.person),
                            SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFormField(
                              title: 'Phone',
                              controller: butcherPhoneController,
                              keyboardType: TextInputType.number,
                              prefixIcon: Icons.phone_android,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFormField(
                                title: 'Shop Area',
                                controller: butcherShopAreaController,
                                prefixIcon: Icons.location_city),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                      color: Colors.teal),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                ),
                              ),
                              child: DropdownButton<String>(
                                value:
                                    AddButchersShopCubit.get(context).meatType,
                                elevation: 16,
                                isExpanded: true,
                                style: const TextStyle(color: Colors.teal),
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 42,
                                underline: SizedBox(),
                                onChanged: (newValue) {
                                  AddButchersShopCubit.get(context)
                                      .changeMeatTypeState(
                                          newSelectedMeatType: newValue);
                                },
                                items: <String>[
                                  'Balady',
                                  'Romani',
                                  'Australy',
                                  'Nuzliandy'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFormField(
                              title: 'Price',
                              controller: butcherMeatPriceController,
                              keyboardType: TextInputType.text,
                              prefixIcon: Icons.monetization_on,
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
            floatingActionButton: FloatingActionButton(
              child: Icon(
                Icons.add,
                size: 40,
              ),
              onPressed: () {
                AddButchersShopCubit.get(context).saveButcherInfo(
                    butcherModel: ButcherModel(
                  butcherShopName: butcherShopNameController.text.trim(),
                  butcherPhone: butcherPhoneController.text.trim(),
                  butcherArea: butcherShopAreaController.text.trim(),
                  butcherMeatPrice: butcherMeatPriceController.text.trim(),
                ));
              },
            ),
          ),
        ),
      );
}
