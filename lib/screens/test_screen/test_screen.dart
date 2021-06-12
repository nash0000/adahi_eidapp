import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final allChecked = CheckBoxModel(title: 'ALL Checked');
  final checkBoxList = [
    CheckBoxModel(title: 'CheckBox 1'),
    CheckBoxModel(title: 'CheckBox 2'),
    CheckBoxModel(title: 'CheckBox 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('checked single and multiple'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            ListTile(
              onTap: () => onAllClicked(allChecked),
              leading: Checkbox(
                value: allChecked.value,
                onChanged: (value) => onAllClicked(allChecked),
              ),
              title: Text(
                allChecked.title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              height: 1.0,
              thickness: 1,
            ),
            ...checkBoxList
                .map(
                  (item) => ListTile(
                    onTap: () => onItemClicked(item),
                    leading: Checkbox(
                      value: item.value,
                      onChanged: (value) => onItemClicked(item),
                    ),
                    title: Text(
                      item.title,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    ));
  }

  onAllClicked(CheckBoxModel ckbItem) {
    final newValue = !ckbItem.value;

    setState(() {
      ckbItem.value = newValue;
      checkBoxList.forEach((element) {
        element.value = newValue;
      });
    });
  }

  onItemClicked(CheckBoxModel ckbItem) {
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = !ckbItem.value;
      if (!newValue) {
        allChecked.value = false;
      } else {
        final allListChecked = checkBoxList.every((element) => element.value);
        allChecked.value = allListChecked;
      }
    });
  }
}

class CheckBoxModel {
  String title;
  bool value;

  CheckBoxModel({@required this.title, this.value = false});
}
