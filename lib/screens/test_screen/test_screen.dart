import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

showLoading(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Please wait ..'),
          content: Container(
            height: 50.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      });
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
