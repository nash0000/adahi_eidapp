import 'package:adahi_eidapp/screens/add_butchers_shops/add_butchers_shops.dart';
import 'package:adahi_eidapp/screens/add_meat/add_meat_screen.dart';
import 'package:adahi_eidapp/screens/admin_meat_shops/admin_meat_shops.dart';
import 'package:adahi_eidapp/screens/cart/cart_screen.dart';
import 'package:adahi_eidapp/screens/home_screens/home_cubit/home_cubit.dart';

import 'package:adahi_eidapp/screens/sign_up_screen/sign_up_cubit/sign_up_cubit.dart';
import 'package:adahi_eidapp/screens/welcome_screen/welcome_screen.dart';

import 'package:adahi_eidapp/shared/app_colors.dart';
import 'package:adahi_eidapp/shared/app_helper_methods.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initApp();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Adahi',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: kDefaultColor,
        ),
        home: WelcomeScreen(),
        //WelcomeScreen(),
        // CartScreen(),
        //AddMeat(),
        //WelcomeScreen(),
        //AdminMeatShops(),
        // home: AddButchersShops(),
        //,
        //SearchScreen(),
        //AddButchersShops(),
        //
        //WelcomeScreen(),
        //OrderDetail(),
        //WelcomeScreen(),
        //TestScreen(),
        //StartPage(),
        //TestScreen(),
        //WelcomeScreen(),
        //MeatShops(),
        //
      ),
    );
  }
}
