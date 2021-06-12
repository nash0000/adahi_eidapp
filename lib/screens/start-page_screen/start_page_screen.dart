import 'package:adahi_eidapp/shared/app_helper_widgets.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.teal,
        title: Text('Adahi '),
      ),
      drawer: Drawer(
        child: ListView(children: [
          //header of drawer
          UserAccountsDrawerHeader(
            accountName: Text('your name '),
            accountEmail: Text(' email@gmail.com '),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Home Screens'),
              leading: Icon(
                Icons.home,
                color: Colors.teal,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('My account'),
              leading: Icon(
                Icons.account_box,
                color: Colors.teal,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Favourites'),
              leading: Icon(
                Icons.favorite,
                color: Colors.teal,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('My order'),
              leading: Icon(
                Icons.save_alt,
                color: Colors.teal,
              ),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Setting'),
              leading: Icon(
                Icons.settings,
                color: Colors.teal,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('About us'),
              leading: Icon(
                Icons.help,
                color: Colors.teal,
              ),
            ),
          ),
        ]),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Categorys'),
          ),
          HorizontalList(),
        ],
      ),
    );
  }
}
