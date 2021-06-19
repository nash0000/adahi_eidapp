import 'package:adahi_eidapp/models/butcher_model.dart';
import 'package:adahi_eidapp/models/meat_model.dart';
import 'package:adahi_eidapp/models/user_model.dart';
import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class CloudService {
  static FirebaseFirestore _fireStoreInstance;

  CloudService() {
    _fireStoreInstance = FirebaseFirestore.instance;
  }

  static Future<void> saveUserInfo({@required UserModel userModel}) async =>
      await _fireStoreInstance
          .collection(kUserCollectionName)
          .doc(userModel.userID)
          .set({
        kUserID: userModel.userID,
        kUserName: userModel.userName,
        kUserEmail: userModel.userEmail,
        kUserPassword: userModel.userPassword,
        kUserAddress: userModel.userAddress,
        kUserPhone: userModel.userPhone,
      });

  static Future<void> addMeat({@required MeatModel meatModel}) async {
    await _fireStoreInstance
        .collection(kMeatCollectionName)
        .doc(meatModel.meatID)
        .set({
      kMeatID: meatModel.meatID,
      kMeatType: meatModel.meatType,
      kMeatPrice: meatModel.meatPrice,
      kMeatDescription: meatModel.meatDescription,
      kMeatService: meatModel.meatServices,
      kMeatWeight: meatModel.meatWeight,
      kMeatProfit: meatModel.meatProfit,
    });
  }

  static Future<QuerySnapshot> getMeats() async {
    return await _fireStoreInstance.collection(kMeatCollectionName).get();
  }

  static Future<QuerySnapshot> getButcher() async {
    return await _fireStoreInstance.collection(kButcherCollectionName).get();
  }

  static Future<DocumentReference> createCollectionAndAddButcher(
      {ButcherModel butcher}) async {
    return await _fireStoreInstance.collection(kButcherCollectionName).add({
      kButcherID: butcher.butcherID,
      kButcherEmail: butcher.butcherEmail,
      kButcherPassword: butcher.butcherPassword,
      kButcherPhone: butcher.butcherPhone,
      kButcherArea: butcher.butcherArea,
      kButcherShopAddress: butcher.butcherAddress,
      kButcherImg: butcher.img,
    });
  }

  static Future<QuerySnapshot> getButchers() async {
    print('=============================================');
    print('getButchers Triggered');
    print('=============================================');
    return await _fireStoreInstance.collection(kButcherCollectionName).get();
  }

  static Future<void> saveButcherInfo(
      {@required ButcherModel butcherModel}) async {
    DocumentReference ref =
        _fireStoreInstance.collection(kButcherCollectionName).doc();

    await _fireStoreInstance
        .collection(kButcherCollectionName)
        .doc(ref.id)
        .set({
      kButcherID: ref.id,
      kButcherShopName: butcherModel.butcherShopName,
      kButcherEmail: butcherModel.butcherEmail,
      kButcherPassword: butcherModel.butcherPassword,
      kButcherShopAddress: butcherModel.butcherAddress,
      kButcherPhone: butcherModel.butcherPhone,
      kButcherArea: butcherModel.butcherArea,
      kButcherImg: butcherModel.img,
    });
  }

  static Future<void> updateButcherInfo({productData, documentId}) async {
    return await _fireStoreInstance
        .collection(kButcherCollectionName)
        .doc(documentId)
        .update(productData);
  }

  static Future<void> deleteButcherInfo({butcherShopID}) async {
    return await _fireStoreInstance
        .collection(kButcherCollectionName)
        .doc(butcherShopID)
        .delete();
  }
}
