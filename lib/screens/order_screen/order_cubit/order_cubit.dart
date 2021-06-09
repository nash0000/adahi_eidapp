import 'package:adahi_eidapp/database/remote_db/authentication.dart';
import 'package:adahi_eidapp/database/remote_db/cloud_firesore.dart';
import 'package:adahi_eidapp/models/butcher_model.dart';
import 'package:adahi_eidapp/models/meat_model.dart';
import 'package:adahi_eidapp/screens/order_screen/order_cubit/order_states.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<OrderStates> {
  OrderCubit() : super(OrderInitialState());

  static OrderCubit get(context) => BlocProvider.of(context);

  loadMeats({@required MeatModel meatModel}) {
    emit(OrderLoadingState());

    CloudService.addMeat(meatModel: meatModel).then((value) {}).catchError(
          (error) => emit(OrderErrorState(error.toString())),
        );
  }
}
