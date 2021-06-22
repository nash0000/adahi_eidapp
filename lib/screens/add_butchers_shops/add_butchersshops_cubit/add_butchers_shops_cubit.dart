import 'package:adahi_eidapp/database/remote_db/cloud_firesore.dart';
import 'package:adahi_eidapp/models/butcher_model.dart';
import 'package:adahi_eidapp/screens/add_butchers_shops/add_butchersshops_cubit/add_butchers_shops_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddButchersShopCubit extends Cubit<AddButchersShopStates> {
  AddButchersShopCubit() : super(AddButchersShopInitialState());

  static AddButchersShopCubit get(context) => BlocProvider.of(context);

  String meatType = 'Balady';

  changeMeatTypeState({newSelectedMeatType}) {
    meatType = newSelectedMeatType;
    emit(AddButchersShopMeatTypeState());
  }

  saveButcherInfo({@required ButcherModel butcherModel}) {
    emit(AddButchersShopLoadingState());

    CloudService.saveButcherInfo(
            butcherModel: ButcherModel(
      butcherShopName: butcherModel.butcherShopName,
      butcherPhone: butcherModel.butcherPhone,
      butcherArea: butcherModel.butcherArea,
      butcherMeatType: meatType,
      butcherMeatPrice: butcherModel.butcherMeatPrice,
    )).then((value) => emit(AddButchersShopSuccessState())).catchError(
          (error) => emit(AddButchersShopErrorState(error.toString())),
        );
  }
}
