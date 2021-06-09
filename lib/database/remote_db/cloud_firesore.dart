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

  addMeat(MeatModel meat) {
    _fireStoreInstance.collection(kMeatCollectionName).add({
      kMeatID: meat.meatID,
      kMeatType: meat.meatType,
      kMeatPrice: meat.meatPrice,
      kMeatService: meat.meatService,
      kMeatDescription: meat.meatDescription,
    });
  }

  Stream<QuerySnapshot> loadMeats() {
    return _fireStoreInstance.collection(kMeatCollectionName).snapshots();
  }
}
