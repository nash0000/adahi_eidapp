import 'package:adahi_eidapp/screens/meat_shops/meat_cubit/meat_shops-states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeatShopsCubit extends Cubit<MeatShopsStates> {
  MeatShopsCubit() : super(MeatShopsInitialState());

  static MeatShopsCubit get(context) => BlocProvider.of(context);
}
