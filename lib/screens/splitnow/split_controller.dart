import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplitController extends GetxController {
  Map<String, dynamic>? userMap;

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final searchTextController = TextEditingController();

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  void onSearch() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    _isLoading(true);

    await _firestore
        .collection('users')
        .where("name", isEqualTo: searchTextController.text)
        //.where("email", isEqualTo: searchTextController.text)
        .get()
        .then((value) {
      userMap = value.docs[0].data();
      _isLoading(false);

      print(userMap);
    });
  }
}
