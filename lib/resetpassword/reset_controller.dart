import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetController extends GetxController{
    final emailTextController = TextEditingController();

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  
  

}