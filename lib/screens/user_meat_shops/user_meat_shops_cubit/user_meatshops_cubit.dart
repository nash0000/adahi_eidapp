import 'package:adahi_eidapp/database/remote_db/cloud_firesore.dart';
import 'package:adahi_eidapp/models/butcher_model.dart';
import 'package:adahi_eidapp/screens/user_meat_shops/user_meat_shops_cubit/user_meatshops_state.dart';
import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/app_strings.dart';

class UserMeatShopsCubit extends Cubit<UserMeatShopsStates> {
  UserMeatShopsCubit() : super(UserMeatShopsInitialState());
  List<ButcherModel> butchers = [];

  static UserMeatShopsCubit get(context) => BlocProvider.of(context);

  loadAllMeatShopsForUser() {
    emit(UserMeatShopsLoadingState());
    CloudService.getButchersDetails()
        .then((value) {
          for (var doc in value.docs) {
            var data = doc.data();
            butchers.add(ButcherModel(
              butcherID: doc.id,
              butcherPhone: data[kButcherPhone],
              butcherArea: data[kButcherArea],
              butcherShopName: data[kButcherShopName],
              butcherMeatType: data[kButcherMeatType],
              butcherMeatPrice: data[kButcherMeatPrice],
            ));
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
