import 'package:adahi_eidapp/screens/profile_screen/cubit/profile%20_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  getProfileUser(String shop) {
    emit(ProfileLoadingState());
  }
}
