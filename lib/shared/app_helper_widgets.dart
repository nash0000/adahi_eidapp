import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:adahi_eidapp/shared/app_styles.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final double radius = 30.0;
  final Function function;
  final String text;
  final bool toUpper = true;
  final double elevation;

  const DefaultButton({this.function, this.text, this.elevation});

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF26A69A),
            width: 1,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            radius,
          ),
        ),
        child: TextButton(
          onPressed: function,
          child: Text(
            toUpper ? text.toUpperCase() : text,
            style: kGreen16(),
          ),
          //black16Bold(),
        ),
      );
}

class CaptionText extends StatelessWidget {
  final text;
  const CaptionText({this.text});

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: kGreen18Bold(),
      );
}

class CustomTextFormField extends StatelessWidget {
  final TextInputType keyboardType;
  final String title;
  final IconData prefixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final Function onChange;
  const CustomTextFormField({
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    @required this.controller,
    this.onChange,
    @required this.title,
    @required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Theme.of(context).primaryColor,
      keyboardType: keyboardType,
      obscureText: obscureText,
      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: "Enter your $title",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(
          prefixIcon,
          color: Theme.of(context).buttonColor,
        ),
        suffixIcon: Icon(
          obscureText ? Icons.remove_red_eye_outlined : null,
          color: Theme.of(context).buttonColor,
        ),
        labelText: title,
        hintStyle: Theme.of(context).textTheme.headline4.copyWith(
              fontSize: 20.0,
            ),
        labelStyle: Theme.of(context).textTheme.headline3.copyWith(
              fontSize: 20.0,
              color: Theme.of(context).primaryColor,
            ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 2),
          gapPadding: 8,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 1),
          gapPadding: 8,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 1),
          gapPadding: 8,
        ),
      ),
      style: Theme.of(context)
          .textTheme
          .headline4
          .copyWith(color: Theme.of(context).primaryColor),
    );
  }
}

class CustomFancyButton extends StatelessWidget {
  final String buttonTitle;
  final Function onPressed;
  const CustomFancyButton(
      {@required this.buttonTitle, @required this.onPressed});
  @override
  Widget build(BuildContext context) => RawMaterialButton(
        onPressed: onPressed,
        fillColor: Theme.of(context).primaryColor,
        splashColor: Theme.of(context).accentColor,
        child: Container(
          height: 50.0,
          child: Center(
            child: Text(buttonTitle,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 18,
                    )),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );
}

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_caption, this.image_location});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Text('hello'),
          ),
        ),
      ),
    );
  }
}

class CartMeat extends StatefulWidget {
  const CartMeat({Key key}) : super(key: key);

  @override
  _CartMeatState createState() => _CartMeatState();
}

class _CartMeatState extends State<CartMeat> {
  var meats_on_the_cart = [
    {
      kMeatType: 'Balady Lamb',
      kMeatService: "small Pieces",
      kMeatWeight: 1,
      kMeatPrice: '18.0'
    },
    {
      kMeatType: 'Newzealand Lamb',
      kMeatService: "big Pieces",
      kMeatWeight: 1,
      kMeatPrice: '9.5'
    },
    {
      kMeatType: 'Roman Lamb',
      kMeatService: "finely Chopped",
      kMeatWeight: 2,
      kMeatPrice: 16.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: meats_on_the_cart.length,
      itemBuilder: (context, index) {
        return SingleMeatCart(
          cartkMeatType: meats_on_the_cart[index][kMeatType],
          cartkMeatService: meats_on_the_cart[index][kMeatService],
          cartkMeatWeight: meats_on_the_cart[index][kMeatWeight],
          cartkMeatPrice: meats_on_the_cart[index][kMeatPrice],
        );
      },
    );
  }
}

class SingleMeatCart extends StatelessWidget {
  final cartkMeatType;
  final cartkMeatService;
  final cartkMeatWeight;
  final cartkMeatPrice;
  SingleMeatCart(
      {this.cartkMeatType,
      this.cartkMeatService,
      this.cartkMeatWeight,
      this.cartkMeatPrice});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(cartkMeatType,
            style: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
                fontWeight: FontWeight.bold)),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: [
                //======= this section for service =========
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Text(
                    'service : ',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    cartkMeatService,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                // =======this section for MeatWeight =========
                // Padding(
                //     padding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                //     child: Text('Weight : ')),
                // Padding(
                //   padding: EdgeInsets.all(4.0),
                //   child: Text(
                //    // cartkMeatWeight.toString(),
                //     style: TextStyle(color: Colors.red),
                //   ),
                // ),
                Expanded(
                  child: Column(
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_drop_up), onPressed: () {}),
                      Text(cartkMeatWeight.toString() + 'kg'),
                      IconButton(
                          icon: Icon(Icons.arrow_drop_down), onPressed: () {}),
                    ],
                  ),
                ),
              ],
            ),
            // =======this section for Meat price =========
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                '\$${cartkMeatPrice}',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        // trailing: Column(
        //   children: [
        //     IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: () {}),
        //     Text(cartkMeatWeight.toString()),
        //     IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: () {}),
        //   ],
        // ),
      ),
    );
  }

  void addWeight() {
    // cartkMeatWeight = cartkMeatWeight + 1;
  }
}
