import 'package:adahi_eidapp/models/user_model.dart';
import 'package:adahi_eidapp/screens/login_screen/login_screen.dart';
import 'package:adahi_eidapp/screens/sign_up_screen/sign_up_cubit/sign_up_cubit.dart';
import 'package:adahi_eidapp/screens/sign_up_screen/sign_up_cubit/sign_up_states.dart';
import 'package:adahi_eidapp/shared/app_colors.dart';
import 'package:adahi_eidapp/shared/app_enum.dart';
import 'package:adahi_eidapp/shared/app_helper_methods.dart';
import 'package:adahi_eidapp/shared/app_helper_widgets.dart';
import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => SignUpCubit(),
        child: BlocConsumer<SignUpCubit, SignUpStates>(
          listener: (context, state) {
            if (state is SignUpLoadingState) {
              showProgressDialog(
                context: context,
                text: 'please wait ...',
              );
            }

            if (state is SignUpSuccessState) {
              Navigator.pop(context);
              navigateAndFinish(
                context,
                LoginScreen(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                ),
              );
              showToast(
                massage: 'created',
                color: ToastColors.SUCCESS,
              );
            }

            if (state is SignUpErrorState) {
              Navigator.pop(context);
              showProgressDialog(
                context: context,
                text: 'in use',
                error: true,
              );
            }
          },
          builder: (context, state) => Scaffold(
            backgroundColor: kSecondaryColor,
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
                              '',
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
                                radius: 90,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              CustomTextFormField(
                                  title: 'Name',
                                  keyboardType: TextInputType.text,
                                  controller: nameController,
                                  prefixIcon: Icons.person),
                              SizedBox(
                                height: 20.0,
                              ),
                              CustomTextFormField(
                                  title: 'Email',
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  prefixIcon: Icons.email),
                              SizedBox(
                                height: 20.0,
                              ),
                              CustomTextFormField(
                                title: 'Password',
                                keyboardType: TextInputType.visiblePassword,
                                controller: passwordController,
                                prefixIcon: Icons.lock,
                                obscureText: true,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              CustomTextFormField(
                                title: 'Phone',
                                keyboardType: TextInputType.number,
                                controller: phoneController,
                                prefixIcon: Icons.phone_android,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              CustomTextFormField(
                                title: 'address',
                                keyboardType: TextInputType.text,
                                controller: addressController,
                                prefixIcon: Icons.location_city,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: CustomFancyButton(
                            buttonTitle: 'Sign Up'.toUpperCase(),
                            onPressed: () =>
                                _checkValidationAndSignUP(context: context),
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        TextButton(
                          onPressed: () {
                            navigateTo(
                                context,
                                LoginScreen(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  'I have an account',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
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

  void _checkValidationAndSignUP({@required BuildContext context}) {
    if (nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty) {
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
        SignUpCubit.get(context).authenticationAndSaveUserInfo(
            userModel: UserModel(
          userName: nameController.text.trim(),
          userEmail: emailController.text.trim(),
          userPassword: passwordController.text.trim(),
          userAddress: addressController.text.trim(),
          userPhone: phoneController.text.trim(),
        ));
      }
    }
  }
}
