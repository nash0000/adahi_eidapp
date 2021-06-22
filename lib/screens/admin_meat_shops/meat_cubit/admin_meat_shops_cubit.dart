import 'package:adahi_eidapp/database/remote_db/cloud_firesore.dart';
import 'package:adahi_eidapp/models/butcher_model.dart';
import 'package:adahi_eidapp/screens/admin_meat_shops/meat_cubit/admin_meat_shops-states.dart';
import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/app_strings.dart';

class AdminMeatShopsCubit extends Cubit<AdminMeatShopsStates> {
  AdminMeatShopsCubit() : super(AdminMeatShopsInitialState());
  List<ButcherModel> butchers = [];

  static AdminMeatShopsCubit get(context) => BlocProvider.of(context);

  loadAllMeatShopsForUser() {
    emit(AdminMeatShopsLoadingState());
    CloudService.getButchersDetails()
        .then((value) {
          for (var doc in value.docs) {
            var data = doc.data();
            butchers.add(ButcherModel(
              butcherID: doc.id,
              butcherShopName: data[kButcherShopName],
              butcherPhone: data[kButcherPhone],
              butcherArea: data[kButcherArea],
              butcherMeatType: data[kButcherMeatType],
              butcherMeatPrice: data[kButcherMeatPrice],
            ));
          }
        })
        .then((value) => emit(AdminMeatShopsSuccessState()))
        .catchError(
          (error) => emit(AdminMeatShopsErrorState(error.toString())),
        )
        .catchError(
          (error) => emit(AdminMeatShopsErrorState(error.toString())),
        );
  }

  deleteMeatShop({@required butcherShopID, @required index}) {
    emit(AdminMeatShopsLoadingState());

    CloudService.deleteButcherInfo(butcherShopID: butcherShopID).then((value) {
      butchers.removeAt(index);
      emit(AdminMeatShopsSuccessState());
    }).catchError((e) {
      emit(AdminMeatShopsErrorState(e.toString()));
    });
  }
}
