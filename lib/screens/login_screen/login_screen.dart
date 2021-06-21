import 'package:adahi_eidapp/models/user_model.dart';
import 'package:adahi_eidapp/screens/add_butchers_shops/add_butchers_shops.dart';
import 'package:adahi_eidapp/screens/admin_meat_shops/admin_meat_shops.dart';
import 'package:adahi_eidapp/screens/home_screens/home_screens.dart';
import 'package:adahi_eidapp/screens/login_screen/login_cubit/login_cubit.dart';
import 'package:adahi_eidapp/screens/login_screen/login_cubit/login_states.dart';

//import 'package:adahi_eidapp/screens/start-page_screen/mainpage.dart';
import 'package:adahi_eidapp/screens/start-page_screen/start_page_screen.dart';
//import 'package:adahi_eidapp/screens/start-page_screen/start-page_screen.dart';
import 'package:adahi_eidapp/screens/welcome_screen/welcome_screen.dart';
import 'package:adahi_eidapp/shared/app_colors.dart';
import 'package:adahi_eidapp/shared/app_enum.dart';
import 'package:adahi_eidapp/shared/app_helper_methods.dart';
import 'package:adahi_eidapp/shared/app_helper_widgets.dart';
import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final String email;
  final String password;

  LoginScreen({this.email, this.password});
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginLoadingState) {
              showProgressDialog(
                context: context,
                text: 'please wait ...',
              );
            }

            if (state is LoginSuccessState) {
              Navigator.pop(context);
              if (state.mode == LoginCubit.get(context).userMode) {
                navigateAndFinish(
                  context,
                  StartPage(),
                );
              } else if (state.mode == LoginCubit.get(context).adminMode) {
                navigateAndFinish(
                  context,
                  AdminMeatShops(),
                );
              }
            }

            if (state is LoginErrorState) {
              showToast(massage: 'Authentication', color: ToastColors.ERROR);
            }
          },
          builder: (context, state) => Scaffold(
            // backgroundColor: Theme.of(context).accentColor,
            appBar: AppBar(
              title: Text('login'),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Adahi ',
                            style:
                                Theme.of(context).textTheme.headline3.copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Hero(
                            tag: 'inOutHeroTag',
                            child: CircleAvatar(
                              child: ClipOval(child: Image.asset(kSheepPhoto)),
                              radius: 50,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            activeColor: Colors.teal,
                            value: LoginCubit.get(context).userMode,
                            groupValue: LoginCubit.get(context).currentMode,
                            onChanged: (value) {
                              LoginCubit.get(context).changeToUserMode();
                            },
                          ),
                          Text(
                            kIamUser,
                            style: TextStyle(color: kTextDarkColor
                                // defaultMode == userMode
                                //     ? Colors.black
                                //     : kWhiteColor
                                ),
                          ),
                          Radio(
                            activeColor: Colors.teal,
                            value: LoginCubit.get(context).adminMode,
                            groupValue: LoginCubit.get(context).currentMode,
                            onChanged: (value) {
                              LoginCubit.get(context).changeToAdminMode();
                            },
                          ),
                          Text(
                            kIamAdmin,
                            style: TextStyle(color: kTextDarkColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            CustomTextFormField(
                                title: 'email',
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                prefixIcon: Icons.email),
                            SizedBox(
                              height: 20.0,
                            ),
                            CustomTextFormField(
                                title: 'password',
                                keyboardType: TextInputType.visiblePassword,
                                controller: passwordController,
                                prefixIcon: Icons.lock,
                                obscureText: true),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: CustomFancyButton(
                          buttonTitle: 'login'.toUpperCase(),
                          onPressed: () =>
                              _checkValidationAndSignIn(context: context),
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  void _checkValidationAndSignIn({@required BuildContext context}) {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      showToast(
        massage: 'Please enter your data',
        color: ToastColors.ERROR,
      );
    } else {
      if (!emailController.text.trim().contains('@')) {
        showToast(
          massage: 'Please enter a valid email',
          color: ToastColors.ERROR,
        );
      } else if (passwordController.text.trim().length < 6) {
        showToast(
          massage: 'your password must be at least 6 char',
          color: ToastColors.ERROR,
        );
      } else {
        _checkAdminOrUserAndLogin(
          context: context,
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          defaultMode: LoginCubit.get(context).currentMode,
          adminMode: LoginCubit.get(context).adminMode,
          userMode: LoginCubit.get(context).userMode,
        );
      }
    }
  }

  _checkAdminOrUserAndLogin(
      {context, email, password, defaultMode, userMode, adminMode}) {
    const String adminPassword = 'nash12';
    if (defaultMode == userMode) {
      LoginCubit.get(context).authenticationAndSaveUserInfo(
          userModel: UserModel(userEmail: email, userPassword: password),
          mode: userMode);
    } else if (defaultMode == adminMode) {
      if (password == adminPassword) {
        LoginCubit.get(context).signInAsAdmin(adminMode);
      } else {
        showToast(massage: 'Wrong Password', color: ToastColors.ERROR);
      }
    }
  }
}
