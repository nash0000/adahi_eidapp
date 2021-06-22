import 'package:adahi_eidapp/shared/app_helper_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final accountController = TextEditingController();
  final phoneController = TextEditingController();
  final pushController = TextEditingController();
  final aboutUsController = TextEditingController();
  final logController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          buildSettingItem(
            function: () {},
            title: 'Account Settings',
          ),
          Divider(),
          buildSettingItem(
            function: () {},

            //{
            // navigateTo(context,PhoneScreen(),);
            //},
            title: 'Phone Authentication',
          ),
          Divider(),
          buildSettingItem(
            function: () {},
            title: 'Push Notifications',
          ),
          Divider(),
          buildSettingItem(
            function: () {},
            title: 'About us',
          ),
          Divider(),
          buildSettingItem(
            function: () async {
              //  await FirebaseAuth.instance.signOut();
              //navigateAndFinish(context, WelcomeScreen());
            },
            title: 'Logout',
          ),

          //

          // CustomTextFormField(
          //   controller: logController,
          //   // onChange: () async {
          //   //   // await FirebaseAuth.instance.signOut();
          //   //   // navigateAndFinish(context, WelcomeScreen());
          //   // },
          //   title: 'Logout',
          // ),
        ],
      ),
    );
  }
}

Widget buildSettingItem({@required title, @required function}) => Column(
      children: [
        SizedBox(
          height: 1.0,
        ),
        ListTile(
          tileColor: Colors.white,
          onTap: function,
          title: Text(
            title.toString(),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 14.0,
          ),
        ),
      ],
    );
