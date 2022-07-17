import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:personal_wallet/screens/search/search_view_controller.dart';
import 'package:personal_wallet/screens/widgets/label_text.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchViewController>(
        init: SearchViewController(),
        builder: (controller) {
          return Scaffold(
            //backgroundColor: Colors.amber,
            body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: controller.personName(),
              builder: (_, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error = ${snapshot.error}');
                }
                if (snapshot.hasData) {
                  var output = snapshot.data!.data();
                  var value = output!['name']; // example@gmail.com
                  return Column(
                    children: [
                      // Text(
                      //   "What's up, $value!",
                      //   style: const TextStyle(
                      //       fontSize: 14, fontWeight: FontWeight.bold),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: ListTile(
                            onTap: () {
                              //Get.to(AddMembersInGroup);
                              Get.toNamed('/new_group');
                              //Get.to(GroupChateHomeScreen);
                            },
                            leading: const Icon(Icons.group_add),
                            title: Text(
                              'New group',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                            ),
                            subtitle: LabelText(
                              context: context,
                              label: 'Start group chate or split an expense',
                            )),
                      )
                    ],
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          );
        });
  }
}
