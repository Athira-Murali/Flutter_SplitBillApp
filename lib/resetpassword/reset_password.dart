import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:personal_wallet/resetpassword/reset_controller.dart';
import 'package:personal_wallet/screens/widgets/reusable_textfield.dart';
import 'package:personal_wallet/screens/widgets/top_container.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetController>(
        init: ResetController(),
        builder: (controller) {
          return Obx(((() => LoadingOverlay(
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
                                    "Enter Email Id",
                                    Icons.person_outline,
                                    false,
                                    controller.emailTextController),
                                const SizedBox(
                                  height: 20,
                                ),
                                //    firebaseUIButton(context, "Reset Password", () {
                                //   FirebaseAuth.instance
                                //       .sendPasswordResetEmail(email: _emailTextController.text)
                                //       .then((value) => Navigator.of(context).pop());
                                // })
                                // signInSignUpButton(context, true, () {
                                //   FirebaseAuth.instance
                                //       .sendPasswordResetEmail(
                                //         email: _emailTextController.text,
                                //       )
                                //       .then((value) {})
                                //       .onError((error, stackTrace) {
                                //     debugPrint("Error ${error.toString()}");
                                //   });
                                // }),
                              ],
                            ),
                          ),
                        ],
                      )),
                    ),
                  ))))));
        });
  }


}
