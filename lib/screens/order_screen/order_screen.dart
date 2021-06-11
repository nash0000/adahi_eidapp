import 'package:adahi_eidapp/database/remote_db/cloud_firesore.dart';
import 'package:adahi_eidapp/models/meat_model.dart';
import 'package:adahi_eidapp/shared/app_colors.dart';
import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int selectedValue = 0;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.blue,
              ),
              title: Text('shop name'),
              subtitle: Text('description'),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                decoration: BoxDecoration(color: Colors.grey[200]),
                width: 200.0,
                // height: 10.0,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    SizedBox(),
                    DropdownButton(
                      items: [],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              // Text(' : Service  '),
              Container(
                decoration: BoxDecoration(color: Colors.grey[200]),
                width: 200.0,
                // height: 10.0,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    SizedBox(),
                    DropdownButton(
                      items: [],
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 1.0,
              ),
            ]),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '  Service :  ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Row(
                children: [
                  Text(' small pieces '),
                  Checkbox(
                      value: isChecked,
                      onChanged: (checked) {
                        checked = isChecked;
                      }),
                ],
              ),
              SizedBox(
                width: 10.0,
              ),
              Row(
                children: [
                  Text(' big pieces '),
                  Checkbox(
                      value: isChecked,
                      onChanged: (checked) {
                        checked = isChecked;
                      }),
                ],
              ),
            ]),
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Row(
                children: [
                  Text(' finely chopped'),
                  Checkbox(
                      value: isChecked,
                      onChanged: (checked) {
                        checked = isChecked;
                      }),
                ],
              ),
              SizedBox(
                width: 10.0,
              ),
              Row(
                children: [
                  Text(' coarsely chopped '),
                  Checkbox(
                      value: isChecked,
                      onChanged: (checked) {
                        checked = isChecked;
                      }),
                ],
              ),
            ]),
            Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            // Transform.scale(
            //   scale: 1.5,
            //   child:
            RadioListTile<int>(
              value: 1,
              groupValue: selectedValue,
              title: Text(
                'Delivery ? ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onChanged: (value) => setState(() => selectedValue),
            ),
            // ),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}

//%%%%%%%%%%%%%

// class OrderScreen extends StatefulWidget {
//   static String id = 'OrderScreen';
//
//   @override
//   _OrderScreenState createState() => _OrderScreenState();
// }
//
// class _OrderScreenState extends State<OrderScreen> {
//   final _cloudService = CloudService();
//
//   @override
//   Widget build(BuildContext context) {
//     bool isChecked = false;
//     return Scaffold(
//       backgroundColor: kSecondaryColor,
//       body: Column(),
//     );
//   }
// }
