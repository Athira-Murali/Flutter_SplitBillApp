import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:personal_wallet/mixins/snackbar_mixin.dart';
import 'package:personal_wallet/repository/firebase_function.dart';

class LoginController extends GetxController with SnackbarMixin {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  onLoginFunction() {
    if (emailTextController.text.isNotEmpty &&
        passwordTextController.text.isNotEmpty) {
      _isLoading(true);

      logIn(emailTextController.text, passwordTextController.text).then((user) {
        if (user != null) {
          debugPrint("login Sucessfull");
          _isLoading(false);
          Get.toNamed('/bottomnav');
        } else {
          debugPrint("Login failed");
          _isLoading(false);
        }
      });
    } else {
      showErrorSnackbar(
          title: "Please fill form correctly", message: e.toString());
      // debugPrint("Please fill form correctly");
    }
  }
}
