import 'package:adahi_eidapp/models/butcher_model.dart';
import 'package:adahi_eidapp/screens/meat_detail_screen/meat_detail_screen.dart';
import 'package:adahi_eidapp/screens/meat_shops/meat_cubit/meat_shops-states.dart';
import 'package:adahi_eidapp/screens/meat_shops/meat_cubit/meat_shops_cubit.dart';

//import 'package:adahi_eidapp/screens/order_screen/order_screen.dart';
import 'package:adahi_eidapp/shared/app_helper_methods.dart';
import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// class MeatShops extends StatefulWidget {
//   List<ButcherModel> butchers = MeatShopsCubit.get(context).loadOneButcher();
//   @override
//   State<StatefulWidget> createState() => _MeatShops();
// }
class MeatShops extends StatelessWidget {
  List<ButcherModel> butchers = [];
  List<ButcherModel> oneButcher = [];

// class _MeatShops extends State<MeatShops> {
  // List<ButcherModel> butchers = [];
  // List<MeatShopsCubit> oneButcher = [];
  bool isLoading = true;
  // List butchers = [];
  //  bool isLoading = true;
  //  CollectionReference butcherRef =
  //      FirebaseFirestore.instance.collection(kButcherCollectionName);
  //
  //  Future<List<QueryDocumentSnapshot>> getData() async {
  //    var responsebody = await butcherRef.get();
  //    return responsebody.docs;
  // }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => MeatShopsCubit()..loadAllMeatShopsForUser(),
        child: BlocConsumer<MeatShopsCubit, MeatShopsStates>(
          listener: (context, state) {},
          builder: (context, state) {
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
                      // itemCount: butchers.length,
                      padding: EdgeInsets.only(top: 10.0),
                      physics: BouncingScrollPhysics(),

                      itemBuilder: (context, index) {
                        MeatShopsCubit.get(context)
                            .loadOneButcher(searchButcher: kButcherShopName);

                        List<ButcherModel> butchers =
                            MeatShopsCubit.get(context).butchers;

                        String itemButcherShopName =
                            butchers[index].butcherShopName;
                        String itemButcherPhone = butchers[index].butcherPhone;
                        String itemButcherID = butchers[index].butcherID;
                        String itemButcherArea = butchers[index].butcherArea;
                        String itemButcherAddress =
                            butchers[index].butcherAddress;

                        String itemButcherImg = butchers[index].img;
                        print('=============================================');
                        print('itemButcherShopName $itemButcherShopName');
                        print('itemButcherPhone $itemButcherPhone');
                        print('itemButcherID $itemButcherID');
                        print('=============================================');
                        return GestureDetector(
                          onTap: () {
                            navigateTo(
                              context,
                              MeatDetail(),
                            );
                            //navigateTo(context, OrderScreen());
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
                                        '${butchers[index].img}',

                                        // itemButcherImg,
                                        //  "${[kButcherImg]}",
                                        // "${butchers[index]['itemButcherImg']}",
                                        fit: BoxFit.fill,
                                      ),
                                      radius: 35.0,
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: isLoading == true
                                                    ? Text("loading")
                                                    : Text(
                                                        // itemButcherShopName,
                                                        // 'hi hi hi ',
                                                        // itemButcherShopName,
                                                        // "${[
                                                        //   'butcherShopName'
                                                        // ]}",
                                                        '${butchers[index].butcherShopName}',
                                                        //  itemButcherShopName,
                                                        // butchers[index]
                                                        //     .butcherShopName,
                                                        //"${butchers[index]['butcherShopName'] ?? 'nash'}",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                              ),
                                              ////============== start RatingBar ============
                                              RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemSize: 15.0,
                                                ignoreGestures: true,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 0.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                              ),
                                              ////============== End RatingBar ============
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            itemButcherPhone,
                                            // '${butchers[index].butcherPhone}',
                                            // itemButcherPhone,
                                            //  "${['kButcherPhone']}",
                                            //"${butchers[index][kButcherPhone]}",
                                            //  '      itemButcherPhone',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            '${butchers[index].butcherPhone}',
                                            //itemButcherArea,
                                            // "hello",
                                            //'  itemButcherArea.toString(),
                                            // "${[
                                            //   'kButcherShopArea'
                                            // ].toString()}",
                                            //  "${butchers[index][kButcherArea]}",
                                            //  "${butchers[index][kButcherArea].toString()}",
                                            // butchers[index].butcherArea,

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

                          //   separatorBuilder: (context, index) => SizedBox(
                          // height: 20.0,
                          // ),
                        );
                      },
                      itemCount: butchers.length,
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
}
