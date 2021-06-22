import 'package:adahi_eidapp/database/remote_db/cloud_firesore.dart';
import 'package:adahi_eidapp/models/butcher_model.dart';
import 'package:adahi_eidapp/screens/admin_meat_shops/meat_cubit/admin_meat_shops-states.dart';
import 'package:adahi_eidapp/screens/user_meat_shops/user_meat_shops_cubit/user_meatshops_state.dart';

import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserMeatShopsCubit extends Cubit<UserMeatShopsStates> {
  UserMeatShopsCubit() : super(UserMeatShopsInitialState());
  List<ButcherModel> butchers = [];

  static UserMeatShopsCubit get(context) => BlocProvider.of(context);

  loadAllMeatShopsForUser() {
    emit(UserMeatShopsLoadingState());
    CloudService.getButchers()
        .then((value) {
          for (var doc in value.docs) {
            var data = doc.data();
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
        })
        .then((value) => emit(UserMeatShopsSuccessState()))
        .catchError(
          (error) => emit(UserMeatShopsErrorState(error.toString())),
        )
        .catchError(
          (error) => emit(UserMeatShopsErrorState(error.toString())),
        );
  }

  // deleteMeatShop({@required butcherShopID, @required index}) {
  //   emit(UserMeatShopsLoadingState());
  //
  //   CloudService.deleteButcherInfo(butcherShopID: butcherShopID).then((value) {
  //     butchers.removeAt(index);
  //     emit(UserMeatShopsSuccessState());
  //   }).catchError((e) {
  //     emit(UserMeatShopsErrorState(e.toString()));
  //   });
  // }
}
