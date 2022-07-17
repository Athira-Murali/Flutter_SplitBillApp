import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:personal_wallet/repository/firebase_function.dart';

import 'package:personal_wallet/screens/home/home_controller.dart';
import 'package:personal_wallet/screens/home/widgets/cardbill.dart';
import 'package:personal_wallet/screens/home/widgets/dotted_box.dart';

import 'package:personal_wallet/screens/widgets/label_text.dart';
import 'package:personal_wallet/screens/widgets/sub_heading.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: controller.personName(),
              builder: (_, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error = ${snapshot.error}');
                }
                if (snapshot.hasData) {
                  var output = snapshot.data!.data();
                  var value = output!['name'];
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        LabelText(
                                            context: context,
                                            label: 'Hey $value!'),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Icon(
                                          Icons.tag_faces_rounded,
                                          color: Colors.amber,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                    Text(
                                      "Bill Spliter",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          ?.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      child: Image.asset("assets/images/2.png"),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.logout),
                                        onPressed: () => logOut(context))
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CardSection(
                            context: context,
                            bill: "\$350,70",
                            onTap: () {
                              Get.toNamed('/splitnow');
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SubHeadingText(
                                    context: context, title: 'Nearby Friends'),
                                Text(
                                  'see all',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const DottedBox(),
                          
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SubHeadingText(
                                    context: context,
                                    title: 'Recent Split Bills'),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          CardSection(
                            context: context,
                            bill: "\$211,70",
                            onTap: () {
                              Get.toNamed('/fetchname');
                            },
                          )
                        ],
                      ),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });
        });
  }
}
