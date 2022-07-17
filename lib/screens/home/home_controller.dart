import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  final firestoreInstance = FirebaseFirestore.instance;
   Future<DocumentSnapshot<Map<String, dynamic>>> personName() async {
    DocumentSnapshot<Map<String, dynamic>> docRef = await firestoreInstance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return docRef;
  }
}