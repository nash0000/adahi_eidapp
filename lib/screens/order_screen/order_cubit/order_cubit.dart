import 'package:adahi_eidapp/database/remote_db/authentication.dart';
import 'package:adahi_eidapp/database/remote_db/cloud_firesore.dart';
import 'package:adahi_eidapp/models/butcher_model.dart';
import 'package:adahi_eidapp/screens/order_screen/order_cubit/order_states.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<OrderStates> {
  OrderCubit() : super(OrderInitialState());

  static OrderCubit get(context) => BlocProvider.of(context);

  // authenticationAndSaveButcherInfo({@required ButcherModel userModel}) {
  //   emit(OrderLoadingState());
  //
  //   AuthenticationService.signUp(butcherModel: butcherModel)
  //       .then((userCredential) => CloudService.saveButcherInfo(
  //       butcherModel: butcherModel(
  //         userID: userCredential.user.uid,
  //         userName: userModel.userName,
  //         userEmail: userModel.userEmail,
  //         userPassword: userModel.userPassword,
  //         userAddress: userModel.userAddress,
  //         userPhone: userModel.userPhone,
  //       )).then((value) => emit(SignUpSuccessState())).catchError(
  //         (error) => emit(SignUpErrorState(error.toString())),
  //   ))
  //       .catchError(
  //         (error) => emit(SignUpErrorState(error.toString())),
  //   );
  // }
}
