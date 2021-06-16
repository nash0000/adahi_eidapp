import 'package:adahi_eidapp/screens/meat_shops/meat_cubit/meat_shops-states.dart';
import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeatShopsCubit extends Cubit<MeatShopsStates> {
  MeatShopsCubit() : super(MeatShopsInitialState());

  static MeatShopsCubit get(context) => BlocProvider.of(context);
}
