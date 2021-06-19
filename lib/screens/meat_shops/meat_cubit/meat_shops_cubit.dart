import 'package:adahi_eidapp/database/remote_db/cloud_firesore.dart';
import 'package:adahi_eidapp/models/butcher_model.dart';
import 'package:adahi_eidapp/screens/meat_shops/meat_cubit/meat_shops-states.dart';
import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeatShopsCubit extends Cubit<MeatShopsStates> {
  MeatShopsCubit() : super(MeatShopsInitialState());
  List<ButcherModel> butchers = [];

  static MeatShopsCubit get(context) => BlocProvider.of(context);

  loadAllMeatShopsForUser() {
    print('=============================================');
    print('loadAllMeatShopsForUser Triggered');
    print('=============================================');

    emit(MeatShopsLoadingState());
    CloudService.getButchers()
        .then((value) {
          for (var doc in value.docs) {
            var data = doc.data();
            print('=============================================');
            print('value ${value.docs.length}');
            print('value ${doc.id}');
            print('value ${data[kButcherEmail]}');
            print('value ${data[kButcherPhone]}');
            print('value ${data[kButcherArea]}');
            print('value ${data[kButcherShopAddress]}');
            print('value ${data[kButcherShopName]}');
            print('value ${data[kButcherPassword]}');
            print('value ${data[kButcherImg]}');
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
        .then((value) => emit(MeatShopsSuccessState()))
        .catchError(
          (error) => emit(MeatShopsErrorState(error.toString())),
        )
        .catchError(
          (error) => emit(MeatShopsErrorState(error.toString())),
        );

    loadOneButcher(searchButcher: kButcherArea);
    emit(MeatShopsSuccessState());
  }

  loadOneButcher({String searchButcher}) {
    CloudService.getButcher();
  }
}
