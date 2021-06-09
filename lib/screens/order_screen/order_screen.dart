import 'package:adahi_eidapp/database/remote_db/cloud_firesore.dart';
import 'package:adahi_eidapp/models/meat_model.dart';
import 'package:adahi_eidapp/shared/app_colors.dart';
import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  static String id = 'OrderScreen';

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final _cloudService = CloudService();

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Column(),
    );
  }
}

// Padding(
// padding: const EdgeInsets.all(20.0),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: <Widget>[
// ListTile(
// leading: CircleAvatar(
// child: Image.asset(kSheepPhoto),
// ),
// title: Text("Butcher Name"),
// subtitle: Text("description"),
// ),
// SizedBox(
// height: 10.0,
// ),
// Padding(
// padding: const EdgeInsets.all(20.0),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: <Widget>[
// Row(
// children: [
// DropdownButton(),
// ],
// ),
// SizedBox(
// height: 10.0,
// ),
// Row(
// children: [
// DropdownButton(),
// SizedBox(
// height: 20.0,
// ),
// ],
// ),
// SizedBox(
// height: 20.0,
// ),
// Text("Service :"),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text("data"),
// Checkbox(
// value: isChecked,
// onChanged: (checked) {
// isChecked = checked;
// },
// ),
// ],
// ),
// ],
// ),
// ),
// ],
// ),
// ),
