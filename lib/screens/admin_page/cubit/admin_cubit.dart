import 'package:adahi_eidapp/screens/admin_page/cubit/admin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminPageCubit extends Cubit<AdminPageStates> {
  AdminPageCubit() : super(AdminPageInitialState());

  static AdminPageCubit get(context) => BlocProvider.of(context);
}
