import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'package:personal_wallet/login/login_controller.dart';
import 'package:personal_wallet/screens/widgets/custombutton.dart';
import 'package:personal_wallet/screens/widgets/label_text.dart';

import 'package:personal_wallet/screens/widgets/reusable_textfield.dart';
import 'package:personal_wallet/screens/widgets/top_container.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Obx((
          () => LoadingOverlay(
            isLoading: controller.isLoading,
            child: GestureDetector(
             onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
              child: Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        const TopContainer(),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: HeadinglText(
                                title: "Login.",
                                context: context,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            children: [
                              reusableTextField(
                                  "Enter email id",
                                  Icons.person_outline,
                                  false,
                                  controller.emailTextController),
                              const SizedBox(
                                height: 20,
                              ),
                              reusableTextField(
                                  "Enter Password",
                                  Icons.lock_outline,
                                  true,
                                  controller.passwordTextController),
                              const SizedBox(
                                height: 5,
                              ),
                              forgetPassword(context),
                              const SizedBox(
                                height: 10,
                              ),
                              //customButton(size, context),
                              CustomButton(
                                context: context, 
                                onPressed: () => controller.onLoginFunction(), 
                                title: "Login"),
                              const SizedBox(
                                height: 20,
                              ),
                              signUpOption()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ))
            )
            );
      },
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.black26)),
        GestureDetector(
          onTap: () {
            Get.offAllNamed('/register');
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
          child: const Text(
            "Forgot Password?",
            style: TextStyle(color: Colors.black38),
            textAlign: TextAlign.right,
          ),
          onPressed: () {
            Get.toNamed('/reset');
          }),
    );
  }

  // Widget customButton(Size size,BuildContext context) {
  //   return GestureDetector(
  //     onTap: () {
  //       if (emailTextController.text.isNotEmpty &&
  //           passwordTextController.text.isNotEmpty) {
  //         setState(() {
  //           isLoading = true;
  //         });

  //         logIn(emailTextController.text, passwordTextController.text)
  //             .then((user) {
  //           if (user != null) {
  //             print("Login Sucessfull");
  //             setState(() {
  //               isLoading = false;
  //             });
  //             Get.toNamed('/home');
  //           } else {
  //             print("Login Failed");
  //             setState(() {
  //               isLoading = false;
  //             });
  //           }
  //         });
  //       } else {
  //         print("Please fill form correctly");
  //       }
  //     },
  //     child: Container(
  //         height: size.height / 14,
  //         width: size.width / 1.2,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(5),
  //           color: Colors.blue,
  //         ),
  //         alignment: Alignment.center,
  //         child: Text(
  //           "Login",
  //           style: TextStyle(
  //             color: primaryButtonColor,
  //             fontSize: 18,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         )),
  //   );
  //}

}
