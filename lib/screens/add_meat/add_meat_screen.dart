import 'package:adahi_eidapp/shared/app_helper_methods.dart';
import 'package:adahi_eidapp/shared/app_helper_widgets.dart';
import 'package:flutter/material.dart';

class AddMeat extends StatelessWidget {
  final meatTypeController = TextEditingController();
  final weightController = TextEditingController();
  final priceController = TextEditingController();
  final meatTdController = TextEditingController();
  final profitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add Meat'),
        backgroundColor: Colors.teal,
        elevation: 0.1,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25.0,
                      ),
                      CustomTextFormField(
                        title: 'ID',
                        //  keyboardType: TextInputType.text,
                        controller: meatTdController,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomTextFormField(
                        title: 'meatType',
                        keyboardType: TextInputType.emailAddress,
                        controller: meatTypeController,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomTextFormField(
                        title: 'Weight',
                        controller: weightController,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      CustomTextFormField(
                        title: 'Price',
                        controller: priceController,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomTextFormField(
                        title: 'Profit',
                        controller: profitController,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                SizedBox(
                  height: 25.0,
                ),
              ],
            ),
          ),
        ),
      ),
      ////////// bottomNavigationBar/////////////////
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: MaterialButton(
                elevation: 0.2,
                onPressed: () {
                  //CartScreen();
                  //  navigateTo(context, MeatShops());
                },
                color: Colors.teal.shade700,
                textColor: Colors.white,
                child: Text(
                  'Remove ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
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
                  // navigateTo(context, AddMeat());
                },
                color: Colors.red.shade900,
                textColor: Colors.white,
                child: Text(
                  'Add ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
