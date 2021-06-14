import 'package:adahi_eidapp/screens/order_screen/order_screen.dart';
import 'package:adahi_eidapp/shared/app_helper_methods.dart';
import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MeatShops extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MeatShops();
}

class _MeatShops extends State<MeatShops> {
  List butchers = [];
  bool isLoading = true;
  CollectionReference butcherRef =
      FirebaseFirestore.instance.collection(kButcherCollectionName);

  Future<List<QueryDocumentSnapshot>> getData() async {
    var responsebody = await butcherRef.get();
    return responsebody.docs;
  }

  @override
  void initState() {
    getData().then((value) {
      butchers.addAll(value);
      isLoading = false;
      print('==========================${butchers.first['area']}');
      print('==========================${butchers.length}');

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Meat Shops '),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15.0,
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: 20.0),
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  navigateTo(context, OrderScreen());
                  //navigateTo(context, RegisterScreen());
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            child: Image.network(
                              "${butchers[index]['img']}",
                              fit: BoxFit.fill,
                            ),
                            radius: 25.0,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: isLoading == true
                                          ? Text("loading")
                                          : Text(
                                              "${butchers[index]['butcherShopName'] ?? 'nash'}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                    ),
                                    RatingBar.builder(
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 10.0,
                                      ignoreGestures: true,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 0.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "${butchers[index][kButcherPhone]}",
                                  // 'become a web design that looks grate on all devices ',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 10.0,
              ),
              itemCount: butchers.length,
            ),
          ),
        ],
      ),
    );
  }
}
