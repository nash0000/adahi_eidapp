import 'package:adahi_eidapp/screens/cart/cart_screen.dart';
import 'package:adahi_eidapp/screens/meat_detail_screen/meat_detail_cubit/meat_detail_cubit.dart';
import 'package:adahi_eidapp/screens/meat_detail_screen/meat_detail_cubit/meat_details_states.dart';
import 'package:adahi_eidapp/screens/user_meat_shops/user_meat_shops.dart';
import 'package:adahi_eidapp/shared/app_helper_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class MeatDetail extends StatefulWidget {
//   @override
//   _MeatDetailState createState() => _MeatDetailState();
// }
//
// class _MeatDetailState extends State<MeatDetail> {

class MeatDetail extends StatelessWidget {
  String serv = 'small Pieces';
  String dropArea = 'Jubiha';
  String groupValue = ' Delivery';
  String meats;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MeatDetailCubit(),
      child: BlocConsumer<MeatDetailCubit, MeatDetailStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            elevation: 0.1,
            title: Text('Meat Detail'),
            backgroundColor: Colors.teal,
          ),
          // MeatDetailCubit.get(context).loadOneMeatForUser()
          //  List <MeatModel> meats = MeatDetailCubit.get(context). ,
          body: ListView(
            children: [
              Container(
                height: 200,
                child: GridTile(
                  child: Container(
                    color: Colors.grey,
                    child: Image.network(
                      '',
                      fit: BoxFit.fill,
                    ),
                  ),
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        'Meat Type  ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'meat kg ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                //  decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'meat price ',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //================the first buttons =====================
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      elevation: 0.2,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('kg'),
                                content: Text('how many gram you want!'),
                                actions: [
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(context);
                                    },
                                    child: Text('close'),
                                  ),
                                ],
                              );
                            });
                      },
                      color: Colors.white,
                      textColor: Colors.grey,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'kg',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                          ),
                          Expanded(
                            child: Icon(Icons.arrow_drop_down),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //================the Qty buttons =====================
                  Expanded(
                    child: MaterialButton(
                      elevation: 0.2,
                      onPressed: () {},
                      color: Colors.white,
                      textColor: Colors.grey,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Qty',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                          ),
                          Expanded(
                            child: Icon(Icons.arrow_drop_down),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //================the serv buttons =====================
                  Expanded(
                    child: MaterialButton(
                      elevation: 0.2,
                      onPressed: () {},
                      color: Colors.white,
                      textColor: Colors.grey,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'serv',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                          ),
                          Expanded(
                            child: Icon(Icons.arrow_drop_down),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                  DropdownButton<String>(
                    onTap: () {},
                    value: serv,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(
                      color: Colors.teal[900],
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.teal,
                    ),
                    onChanged: (String newValue) {
                      // setState(() {
                      serv = newValue;
                      //  });
                    },
                    items: <String>[
                      'small Pieces',
                      'big Pieces',
                      'Finely chopped',
                      'coarsely chopped'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  DropdownButton<String>(
                    onTap: () {},
                    value: dropArea,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(
                      color: Colors.teal[900],
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.teal,
                    ),
                    onChanged: (String newValue) {
                      //  setState(() {
                      dropArea = newValue;
                      //  });
                    },
                    items: <String>[
                      'Jubiha',
                      'Dahyat Alrasheed',
                      'Swifiya',
                      'Shafa Badran',
                      'Wadi Sir',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  // DropdownButton<String>(
                  //    value: dropdownVt,
                  //    icon: const Icon(Icons.arrow_downward),
                  //    iconSize: 24,
                  //    elevation: 16,
                  //    style: TextStyle(
                  //      color: Colors.teal[900],
                  //    ),
                  //    underline: Container(
                  //      height: 2,
                  //      color: Colors.teal,
                  //    ),
                  //    onChanged: (String newValue) {
                  //      setState(() {
                  //        dropdownVt = newValue;
                  //      });
                  //    },
                  //    items: <String>['One', 'Two', 'Free', 'Four']
                  //        .map<DropdownMenuItem<String>>((String value) {
                  //      return DropdownMenuItem<String>(
                  //        value: value,
                  //        child: Text(value),
                  //      );
                  //    }).toList(),
                  //  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),

              Divider(),

              Padding(
                padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                child: Container(
                  color: Colors.grey.withOpacity(0.1),
                  child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            'Delivery ',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                //  decoration: TextDecoration.lineThrough,
                                color: Colors.black),
                          ),
                          trailing: Radio(
                            value: 'Delivery ',
                            groupValue: groupValue,
                            onChanged: (e) => valueChanged(e),
                            activeColor: Colors.teal,
                            hoverColor: Colors.red,
                            focusColor: Colors.amber,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "No Delivery ",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.black38),
                          ),
                          trailing: Radio(
                            value: "No Delivery ",
                            groupValue: groupValue,
                            hoverColor: Colors.red,
                            onChanged: (e) => valueChanged(e),
                            activeColor: Colors.teal,
                            focusColor: Colors.amber,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    elevation: 0.2,
                    onPressed: () {
                      //CartScreen();
                      navigateTo(context, UserMeatShops());
                      // navigateTo(context, UserMeatShops());
                    },
                    color: Colors.teal.shade700,
                    textColor: Colors.white,
                    child: Text(
                      'Back ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: MaterialButton(
                    elevation: 0.2,
                    onPressed: () {
                      //CartScreen();
                      navigateTo(context, CartScreen());
                    },
                    color: Colors.red.shade900,
                    textColor: Colors.white,
                    child: Text(
                      'Submit ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void valueChanged(e) {
    //setState(() {
    if (e == 'Delivery') {
      groupValue = e;
    } else //(e == 'No Delivery')
    {
      groupValue = e;
    }
    //});
  }
}
