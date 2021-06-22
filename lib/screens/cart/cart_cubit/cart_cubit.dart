import 'package:adahi_eidapp/database/remote_db/cloud_firesore.dart';
import 'package:adahi_eidapp/models/cart_model.dart';
import 'package:adahi_eidapp/screens/cart/cart_cubit/cart_state.dart';
import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());

  static CartCubit get(context) => BlocProvider.of(context);
  List<CartModel> carts = [];

  loadAllCartsForUser() {
    emit(CartLoadingState());
    CloudService.getCarts()
        .then((value) {
          for (var doc in value.docs) {
            var data = doc.data();
            carts.add(CartModel(
              cartID: doc.id,
              cartName: data[kCartName],
              cartQuantity: data[kCartQuantity],
              cartImg: data[kCartImg],
            ));
          }
        })
        .then((value) => emit(CartSuccessState()))
        .catchError(
          (error) => emit(CartErrorState(error.toString())),
        )
        .catchError(
          (error) => emit(CartErrorState(error.toString())),
        );
  }
}
