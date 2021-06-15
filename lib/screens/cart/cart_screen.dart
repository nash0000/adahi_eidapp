import 'package:adahi_eidapp/shared/app_helper_widgets.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: Text('Cart '),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.teal,
      ),
      ////////start body/////
      body: CartMeat(),

      //// bottomNavigationBar////////////
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Text('Total Price : '),
                  subtitle: Text("\$ 230"),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    'Check out',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.teal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
