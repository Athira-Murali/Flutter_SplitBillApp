import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchViewController extends GetxController {
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final firestoreInstance = FirebaseFirestore.instance;

  Map<String, dynamic>? userMap;

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final searchTextController = TextEditingController();

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

  Future<DocumentSnapshot<Map<String, dynamic>>> personName() async {
    DocumentSnapshot<Map<String, dynamic>> docRef = await firestoreInstance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return docRef;
  }
}
