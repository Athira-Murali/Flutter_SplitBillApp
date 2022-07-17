import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:personal_wallet/mixins/snackbar_mixin.dart';
import 'package:personal_wallet/repository/firebase_function.dart';

class RegisterController extends GetxController  with SnackbarMixin{
  final userNameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  @override
  void onClose() {
    userNameTextController.dispose();
    passwordTextController.dispose();
    emailTextController.dispose();

    super.onClose();
  }

  onRegisterFunction() {
    if (userNameTextController.text.isNotEmpty &&
        emailTextController.text.isNotEmpty &&
        passwordTextController.text.isNotEmpty) {
      _isLoading(true);

      createAccount(userNameTextController.text, emailTextController.text,
              passwordTextController.text)
          .then((user) {
        if (user != null) {
          _isLoading(false);
          Get.offAllNamed('/bottomnav');
          debugPrint("Account Created Sucessfull");
        } else {
          debugPrint("Login Failed");
          _isLoading(false);
        }
      });
    } else {
      // debugPrint("Please enter Fields");
       showErrorSnackbar(title: "Please enter Fields", message: e.toString());
    }
  }
}
