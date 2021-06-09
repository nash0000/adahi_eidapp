import 'package:adahi_eidapp/screens/home_screens/home_screens.dart';
import 'package:adahi_eidapp/screens/login_screen/login_cubit/login_cubit.dart';
import 'package:adahi_eidapp/screens/login_screen/login_cubit/login_states.dart';
import 'package:adahi_eidapp/screens/start-page_screen/mainpage.dart';
import 'package:adahi_eidapp/screens/welcome_screen/welcome_screen.dart';
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
              navigateAndFinish(
                context,
                HomeScreens(),
              );
              showToast(
                massage: 'created',
                color: ToastColors.SUCCESS,
              );
            }

            if (state is LoginErrorState) {
              Navigator.pop(context);
              navigateAndFinish(
                context,
                WelcomeScreen(),
              );
            }
          },
          builder: (context, state) => Scaffold(
            // backgroundColor: Theme.of(context).accentColor,
            appBar: AppBar(
              title: Text('login'),
            ),
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(
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
                                child:
                                    ClipOval(child: Image.asset(kSheepPhoto)),
                                radius: 50,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 35.0,
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
        navigateTo(context, FirstPage());
      }
    }
  }
}
