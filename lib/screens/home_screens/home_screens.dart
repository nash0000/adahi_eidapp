import 'package:adahi_eidapp/screens/home_screens/home_cubit/home_cubit.dart';
import 'package:adahi_eidapp/screens/home_screens/home_cubit/home_states.dart';
import 'package:adahi_eidapp/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var currentIndex = HomeCubit.get(context).currentIndex;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              HomeCubit.get(context).titles[currentIndex],
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.notifications_none,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: HomeCubit.get(context).widget[currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  25.0,
                ),
                topRight: Radius.circular(
                  25.0,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 10,
                  blurRadius: 15,
                ),
              ],
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_dining),
                  label: 'Butcher',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                  ),
                  label: 'search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_box_sharp),
                  label: 'profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_applications),
                  label: 'setting',
                ),
              ],
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                HomeCubit.get(context).changeIndex(index);
              },
              selectedItemColor: kDefaultColor,
              currentIndex: currentIndex,
            ),
          ),
        );
      },
    );
  }
}
