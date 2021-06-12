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
        child: ListTile(
          title: Text('hello'),
        ),
      ),
    );
  }
}
