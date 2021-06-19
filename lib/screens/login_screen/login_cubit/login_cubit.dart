import 'package:adahi_eidapp/database/remote_db/authentication.dart';
import 'package:adahi_eidapp/models/user_model.dart';
import 'package:adahi_eidapp/screens/login_screen/login_cubit/login_states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  String currentMode = 'user';
  String adminMode = 'admin';
  String userMode = 'user';

  changeToAdminMode() {
    currentMode = adminMode;
    emit(LoginAdminState());
  }

  changeToUserMode() {
    currentMode = userMode;
    emit(LoginUserState());
  }

  signInAsAdmin(mode) {
    emit(LoginSuccessState(mode));
  }

  authenticationAndSaveUserInfo({@required UserModel userModel, mode}) {
    emit(LoginLoadingState());

    AuthenticationService.signIn(userModel: userModel).then((userCredential) {
      emit(LoginSuccessState(mode));
    }).catchError(
      (error) => emit(LoginErrorState(error.toString())),
    );
  }
}
