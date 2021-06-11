import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MeatShops extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MeatShops();
}

class _MeatShops extends State<MeatShops> {
  getData() async {
    FirebaseFirestore.instance
        .collection(kButcherCollectionName)
        .get()
        .then((value) => {
              value.docs.forEach((element) {
                // print(element.data()['area'].toString());
                print(element.data()['butcherPhone']);
                print("=================================");
              })
            });
  }

  @override
  void initState() {
    getData();
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
              itemBuilder: (context, index) => buildButcherItem(context),
              separatorBuilder: (context, index) => SizedBox(
                height: 10.0,
              ),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

// appBar:
// AppBar(
//   title: Text('Meat Shops'),
//   // ),
//  // body: StreamBuilder(
//       stream: FirebaseFirestore.instance
//           .collection(kButcherCollectionName)
//           .snapshots(),
//       builder:
//           (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) return Text('Error: ${snapshot.error}');
//         switch (snapshot.connectionState) {
//           case ConnectionState.waiting:
//             return Text('Loading...');
//           default:
//             return ListView(
//               children: snapshot.data.docs.map((DocumentSnapshot document) {
//                 if (document['img'] == null)
//                 //here was my error, I was calling a field that did not exist in the document
//                 {
//                   Container(
//                     child: Icon(
//                       Icons.image,
//                       size: 100.0,
//                       color: Colors.yellow,
//                     ),
//                   );
//                 }
//                 return Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: ListTile(
//                     leading: Image.network(
//                       document['img'],
//                       fit: BoxFit.cover,
//                       scale: 1.0,
//                       height: 400.0,
//                       width: 200.0,
//                     ),
//                     // title: Text(document['']),
//                   ),
//                 );
//               }).toList(),
//             );

///////3333

Widget buildButcherItem(context) => GestureDetector(
      // onTap: () {
      //   navigateTo(context, ProductDetail());
      //   //navigateTo(context, RegisterScreen());
      // },

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
                  // child: Image(
                  //     //Image.network(document[kButcherImg]),
                  //     ),
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
                            child: Text(
                              'Web Design',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                            itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
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
                        'become a web design that looks grate on all devices ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

// title: Text(document['butcherShopName']),
// subtitle: Text(document['butcherPhone']),

//
//
//%%%%%%%%%%%
// ListView.builder(
//                   itemCount: snapshot.data.docs.length,
//                   //snapshot.data.docs.Length,
//                   itemBuilder: (context, index) {
//                     // Text(snapshot.data.docs[index]['butcherShopName']);
//                     DocumentSnapshot butcher = snapshot.data.docs[index];
//                     return ListTile(
//                       leading: Image.network(butcher['img']),
//                       title: Text(butcher[index]['butcherShopName']),
//                       subtitle: Text(butcher[index]['butcherPhone']),
//                     );
//                   },
//                 );%
