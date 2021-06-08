import 'package:adahi_eidapp/database/remote_db/authentication.dart';
import 'package:adahi_eidapp/database/remote_db/cloud_firesore.dart';
import 'package:adahi_eidapp/screens/sign_up_screen/sign_up_cubit/sign_up_states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user_model.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  authenticationAndSaveUserInfo({@required UserModel userModel}) {
    emit(SignUpLoadingState());

    AuthenticationService.signUp(userModel: userModel)
        .then((userCredential) => CloudService.saveUserInfo(
                    userModel: UserModel(
              userID: userCredential.user.uid,
              userName: userModel.userName,
              userEmail: userModel.userEmail,
              userPassword: userModel.userPassword,
              userAddress: userModel.userAddress,
              userPhone: userModel.userPhone,
            )).then((value) => emit(SignUpSuccessState())).catchError(
                  (error) => emit(SignUpErrorState(error.toString())),
                ))
        .catchError(
          (error) => emit(SignUpErrorState(error.toString())),
        );
  }
}
