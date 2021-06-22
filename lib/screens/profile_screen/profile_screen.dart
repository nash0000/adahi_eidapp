import 'package:adahi_eidapp/shared/app_styles.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.0,
          ),
          CircleAvatar(
            radius: 45.0,
            backgroundImage: AssetImage('assets/images/fo.jpeg'),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nashmeyah Alenezi',
                style: black18Bold(),
              ),
              IconButton(
                icon: Icon(
                  Icons.edit_outlined,
                  size: 18.0,
                  color: Colors.teal,
                ),
                onPressed: () {},
              ),
            ],
          ),
          // Text(
          //  '',
          //  style: black16(),
          // ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              children: [
                buildProfileItem(
                  function: () {},
                  title: 'My Shop',
                  shape: Text(
                    '5',
                    style: black20Bold(),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                buildProfileItem(
                  function: () {},
                  title: 'Favourite Shop',
                  shape: Icon(
                    Icons.favorite_border,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              children: [
                buildProfileItem(
                  function: () {},
                  title: 'My Cart',
                  shape: Icon(
                    Icons.shopping_cart_outlined,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                buildProfileItem(
                  function: () {},
                  title: 'My Reviews',
                  shape: Icon(
                    Icons.star_half,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              children: [
                buildProfileItem(
                  function: () {},
                  title: 'Invite a friend',
                  shape: Icon(
                    Icons.share,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                buildProfileItem(
                  function: () {},
                  title: 'Help & Support',
                  shape: Icon(
                    Icons.help_outline,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}

Widget buildProfileItem({
  @required title,
  @required Widget shape,
  @required function,
}) =>
    Expanded(
      child: GestureDetector(
        onTap: function,
        child: Container(
          height: 140.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              15.0,
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 9,
                blurRadius: 15,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30.0,
                child: shape,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                title.toString(),
                style: black16Bold(),
              ),
            ],
          ),
        ),
      ),
    );
