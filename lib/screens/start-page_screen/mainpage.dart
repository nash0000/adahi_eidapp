//import 'package:adahi_app/screens/butcher/products_screen.dart';

//import 'package:adahi_app/shared/components/components.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:adahi_eidapp/screens/start-page_screen/navigationdrawerwidget.dart';
import 'package:adahi_eidapp/screens/start-page_screen/navigationprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  static final String title = 'choose your place!';
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.teal),
          home: MainPage(),
        ),
      );
}

////////////////////
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var selectedCitiy, selectedAreas, areaItems;
  List<String> cities = <String>[
    "Amman",
    "Zarqa",
    "Irbid",
    "Al Karak",
    "Ma'an",
    "Al Aqabah",
  ];
  var myCity;
  var myArea;
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(FirstPage.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(
                  bottom: 100.0, top: 100.0, left: 10.0, right: 10.0),
              child: Text(
                "choose  your place",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
              ),
            ),
            /////////////////////////////////
            Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25,
                ),
                border: Border.all(
                  color: Colors.teal,
                  width: 1,
                ),
              ),
              // color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          dropdownColor: Colors.teal[400],
                          value: selectedCitiy,
                          iconSize: 30,
                          icon: (null),
                          //Icon(Icons.place),
                          //
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                          hint: Text(
                            'select City',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                          onChanged: (cities) {
                            setState(() {
                              selectedCitiy = cities;
                              // cities();
                              print('$cities');
                            });
                          },

                          isExpanded: false,
                          items: cities.map((item) {
                                return new DropdownMenuItem(
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  value: item,
                                );
                              })?.toList() ??
                              [],
                        ),
                      ),
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

//<QuerySnapshot>
