import 'package:adahi_eidapp/screens/add_meat/add_meat_cubit/add_meat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMeatCubit extends Cubit<AddMeatStates> {
  AddMeatCubit() : super(AddMeatInitialState());

  static AddMeatCubit get(context) => BlocProvider.of(context);
}
