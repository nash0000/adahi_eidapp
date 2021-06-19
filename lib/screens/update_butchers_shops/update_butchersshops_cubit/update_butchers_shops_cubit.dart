import 'package:adahi_eidapp/database/remote_db/cloud_firesore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'update_butchers_shops_states.dart';

class UpdateButchersShopCubit extends Cubit<UpdateButchersShopStates> {
  UpdateButchersShopCubit() : super(UpdateButchersShopInitialState());

  static UpdateButchersShopCubit get(context) => BlocProvider.of(context);

  updateButcherInfo({@required butcherDataAsMap, @required butcherShopID}) {
    emit(UpdateButchersShopLoadingState());

    CloudService.updateButcherInfo(
            butcherShopID: butcherShopID, butcherDataAsMap: butcherDataAsMap)
        .then((value) => emit(UpdateButchersShopSuccessState()))
        .catchError(
          (error) => emit(UpdateButchersShopErrorState(error.toString())),
        );
  }
}
