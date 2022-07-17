import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'package:personal_wallet/register/register_controller.dart';
import 'package:personal_wallet/screens/widgets/custombutton.dart';
import 'package:personal_wallet/screens/widgets/reusable_textfield.dart';
import 'package:personal_wallet/screens/widgets/top_container.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (controller) {
          return Obx((() => LoadingOverlay(
              isLoading: controller.isLoading,
              child: GestureDetector(
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  child: Scaffold(
                    extendBodyBehindAppBar: true,
                    body: SafeArea(
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          const TopContainer(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
                            child: Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 20,
                                ),
                                reusableTextField(
                                    "Enter UserName",
                                    Icons.person_outline,
                                    false,
                                    controller.userNameTextController),
                                const SizedBox(
                                  height: 20,
                                ),
                                reusableTextField(
                                    "Enter Email Id",
                                    Icons.person_outline,
                                    false,
                                    controller.emailTextController),
                                const SizedBox(
                                  height: 20,
                                ),
                                reusableTextField(
                                    "Enter Password",
                                    Icons.lock_outlined,
                                    true,
                                    controller.passwordTextController),
                                const SizedBox(
                                  height: 20,
                                ),
                                // customButton(size),
                                CustomButton(
                                    context: context,
                                    onPressed: () =>
                                        controller.onRegisterFunction(),
                                    title: "Create Account"),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/');
                                  },
                                  child: const Text(
                                    " Login",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                    ),
                  )))));
        });
  }
  // Widget customButton(Size size) {
  //   return GestureDetector(
  //     onTap: () {
  //       if ( userNameTextController.text.isNotEmpty &&
  //           emailTextController.text.isNotEmpty &&
  //           passwordTextController.text.isNotEmpty) {
  //         setState(() {
  //           isLoading = true;
  //         });

  //         createAccount(userNameTextController.text, emailTextController.text,
  //                 passwordTextController.text)
  //             .then((user) {
  //           if (user != null) {
  //             setState(() {
  //               isLoading = false;
  //             });
  //             Get.offAllNamed('/home');
  //             debugPrint("Account Created Sucessfull");
  //           } else {
  //             print("Login Failed");
  //             setState(() {
  //               isLoading = false;
  //             });
  //           }
  //         });
  //       } else {
  //         debugPrint("Please enter Fields");
  //       }
  //     },
  //     child: Container(
  //         height: size.height / 14,
  //         width: size.width / 1.2,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(5),
  //           color: primaryButtonColor,
  //         ),
  //         alignment: Alignment.center,
  //         child: const Text(
  //           "Create Account",
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 18,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         )),
  //   );
  // }
}
