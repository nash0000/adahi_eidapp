import 'package:adahi_eidapp/screens/cart/cart_screen.dart';
import 'package:adahi_eidapp/shared/app_helper_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatefulWidget {
  // final orderDetailMeatType;
  // final orderDetailMeatServices;
  // final orderDetailMeatPrice;
  // final orderDetailMeatDescription;
  // final orderDetailButcherShopName;
  // final orderDetailButcherArea;
  // final orderDetailImg;
  // OrderDetail(
  //     {this.orderDetailMeatType,
  //     this.orderDetailMeatServices,
  //     this.orderDetailMeatPrice,
  //     this.orderDetailMeatDescription,
  //     this.orderDetailButcherShopName,
  //     this.orderDetailButcherArea,
  //     this.orderDetailImg});

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  String serv = 'small Pieces';
  String dropArea = 'Jubiha';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          title: Text('Order Detail'),
          backgroundColor: Colors.teal,
        ),
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
                  icon: const Icon(Icons.arrow_downward),
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
                    setState(() {
                      serv = newValue;
                    });
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
                    setState(() {
                      dropArea = newValue;
                    });
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
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      elevation: 0.2,
                      onPressed: () {
                        //CartScreen();
                        navigateTo(context, CartScreen());
                      },
                      color: Colors.red,
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
          ],
        ));
  }
}
