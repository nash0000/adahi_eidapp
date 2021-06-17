import 'package:adahi_eidapp/database/remote_db/cloud_firesore.dart';
import 'package:adahi_eidapp/models/meat_model.dart';
import 'package:adahi_eidapp/models/user_model.dart';
import 'package:adahi_eidapp/screens/meat_detail_screen/meat_detail_cubit/meat_details_states.dart';
import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeatDetailCubit extends Cubit<MeatDetailStates> {
  MeatDetailCubit() : super(MeatDetailInitialState());

  static MeatDetailCubit get(context) => BlocProvider.of(context);

  loadAllMeatForUser() {
    emit(MeatDetailLoadingState());
    CloudService.getMeats()
        .then((value) {
          for (var doc in value.docs) {
            var data = doc.data();
            var meats;
            meats.add(MeatModel(
                meatID: doc.id,
                meatType: data[kMeatType],
                meatPrice: data[kMeatPrice],
                meatDescription: data[kMeatDescription],
                meatServices: data[kMeatService],
                meatWeight: data[kMeatWeight],
                meatProfit: data[kMeatProfit]));
          }
        })
        .then((value) => emit(MeatDetailSuccessState()))
        .catchError(
          (error) => emit(MeatDetailErrorState(error.toString())),
        )
        .catchError(
          (error) => emit(MeatDetailErrorState(error.toString())),
        );
  }
}
