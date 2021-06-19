import 'package:adahi_eidapp/database/remote_db/authentication.dart';
import 'package:adahi_eidapp/database/remote_db/cloud_firesore.dart';
import 'package:adahi_eidapp/models/butcher_model.dart';
import 'package:adahi_eidapp/screens/add_butchers_shops/add_butchersshops_cubit/add_butchers_shops_states.dart';
import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddButchersShopCubit extends Cubit<AddButchersShopStates> {
  AddButchersShopCubit() : super(AddButchersShopInitialState());

  static AddButchersShopCubit get(context) => BlocProvider.of(context);

  List<ButcherModel> butchers = [];

  loadAllMeatShopsForUser() {
    CloudService.getButchers()
        .then((value) {
          for (var doc in value.docs) {
            var data = doc.data();

            print('=============================================');
            butchers.add(ButcherModel(
                butcherID: doc.id,
                butcherEmail: data[kButcherEmail],
                butcherPhone: data[kButcherPhone],
                butcherArea: data[kButcherArea],
                butcherAddress: data[kButcherShopAddress],
                butcherShopName: data[kButcherShopName],
                butcherPassword: data[kButcherPassword],
                img: data[kButcherImg]));
          }
          print('=============================================');
          print('butchers ${butchers.length}');
          print('=============================================');
        })
        .then((value) => emit(AddButchersShopSuccessState()))
        .catchError(
          (error) => emit(AddButchersShopErrorState(error.toString())),
        )
        .catchError(
          (error) => emit(AddButchersShopErrorState(error.toString())),
        );
  }

  saveButcherInfo({@required ButcherModel butcherModel}) {
    emit(AddButchersShopLoadingState());

    CloudService.saveButcherInfo(
            butcherModel: ButcherModel(
      butcherShopName: butcherModel.butcherShopName,
      butcherEmail: butcherModel.butcherEmail,
      butcherPassword: butcherModel.butcherPassword,
      butcherAddress: butcherModel.butcherAddress,
      butcherPhone: butcherModel.butcherPhone,
      butcherArea: butcherModel.butcherArea,
      img: butcherModel.img,
    )).then((value) => emit(AddButchersShopSuccessState())).catchError(
          (error) => emit(AddButchersShopErrorState(error.toString())),
        );
  }
}

////////////////
