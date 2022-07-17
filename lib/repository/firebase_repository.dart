import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class FirebaseRepository extends GetxController {
  static FirebaseRepository get to => Get.find();
  final storage = const FlutterSecureStorage();

  writeToFlutterSecureStorage({required String key, String? value}) async {
    final readingdata = await storage.read(key: key);
    return readingdata;
  }

  deleteFromFlutterSecureStorage({required String key}) async {
    await storage.delete(key: "uid");
  }
}
