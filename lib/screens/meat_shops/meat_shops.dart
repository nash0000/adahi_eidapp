import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MeatShops extends StatelessWidget {
  const MeatShops({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meat Shops'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(kButcherCollectionName)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Text('Loading...');
              default:
                return ListView(
                  children: snapshot.data.docs.map((DocumentSnapshot document) {
                    if (document['img'] ==
                        null) //here was my error, I was calling a field that did not exist in the document
                    {
                      Container(
                        child: Icon(
                          Icons.image,
                          size: 20.0,
                          color: Colors.grey,
                        ),
                      );
                    }

                    return ListTile(
                      leading: Image.network(document['img']),
                      //title: Text(document['butcherShopName']),
                      subtitle: Text(''),
                    );
                  }).toList(),
                );

              // return ListView.builder(
              //   itemCount: streamSnapshot.data.docs.length,
              //   //snapshot.data.docs.Length,
              //   itemBuilder: (context, index) {
              //     Text(streamSnapshot.data.docs[index]['butcherShopName']);
              //     //  DocumentSnapshot butcher = snapshot.data.docs[index];
              //     // return ListTile(
              //     //   leading: Image.network(streamSnapshot.data.docs[index]['img']),
              //     //   title: Text(streamSnapshot.data.docs[index][kButcherShopName]),
              //     //   subtitle: Text(streamSnapshot.data.docs[index][kButcherPhone]),
              //     // );
              //   },
              // );
            }
          }),
    );
  }
}

// title: Text(document['butcherShopName']),
// subtitle: Text(document['butcherPhone']),
