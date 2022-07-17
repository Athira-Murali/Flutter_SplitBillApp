import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class GroupController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  List groupList = [];

  // add member view
  final TextEditingController search = TextEditingController();
  List<Map<String, dynamic>> membersList = [];
  Map<String, dynamic>? userMap;

  @override
  void onInit() {
    super.onInit();
    getAvailableGroups();
    getCurrentUserDetails();
  }

  void getAvailableGroups() async {
    String uid = _auth.currentUser!.uid;

    await _firestore
        .collection('users')
        .doc(uid)
        .collection('groups')
        .get()
        .then((value) {
      groupList = value.docs;
      _isLoading(false);
    });
  }

  // add member Functions

  void getCurrentUserDetails() async {
    await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((map) {
      membersList.add({
        "name": map['name'],
        "email": map['email'],
        "uid": map['uid'],
        "isAdmin": true,
      });
      update();
      // setState(() {
      //   membersList.add({
      //     "name": map['name'],
      //     "email": map['email'],
      //     "uid": map['uid'],
      //     "isAdmin": true,
      //   });
      // });
    });
  }

  void onSearch() async {
    _isLoading(true);

    await _firestore
        .collection('users')
        .where("name", isEqualTo: search.text)
        .get()
        .then((value) {
      userMap = value.docs[0].data();
      _isLoading(false);

      debugPrint("search result");
      print(userMap);
    });
  }

  void onResultTap() {
    bool isAlreadyExist = false;

    for (int i = 0; i < membersList.length; i++) {
      if (membersList[i]['uid'] == userMap!['uid']) {
        isAlreadyExist = true;
      }
    }

    if (!isAlreadyExist) {
      update();
      membersList.add({
        "name": userMap!['name'],
        "email": userMap!['email'],
        "uid": userMap!['uid'],
        "isAdmin": false,
        
      });
      
      userMap = null;
    }
  }

  void onRemoveMembers(int index) {
    if (membersList[index]['uid'] != _auth.currentUser!.uid) {
      update();
      membersList.removeAt(index);
      
      // setState(() {
      //   membersList.removeAt(index);
      // });
    }
  }
}
