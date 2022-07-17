import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_wallet/screens/group_chate/create_group/create_groups.dart';

class AddMembersInGroup extends StatefulWidget {
  const AddMembersInGroup({Key? key}) : super(key: key);

  @override
  State<AddMembersInGroup> createState() => _AddMembersInGroupState();
}

class _AddMembersInGroupState extends State<AddMembersInGroup> {
  final TextEditingController _search = TextEditingController();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  List<Map<String, dynamic>> membersList = [];
  bool isLoading = false;
  Map<String, dynamic>? userMap;

  @override
  void initState() {
    super.initState();
    getCurrentUserDetails();
  }

  void getCurrentUserDetails() async {
    await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((map) {
      setState(() {
        membersList.add({
          "name": map['name'],
          "email": map['email'],
          "uid": map['uid'],
          "isAdmin": true,
        });
      });
    });
  }

  void onSearch() async {
    setState(() {
      isLoading = true;
    });

    await _firestore
        .collection('users')
        .where("email", isEqualTo: _search.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      print(userMap);
    });
  }

  void onResultTap() {
    bool isAlreadyExist = false;

    for (int i = 0; i < membersList.length; i++) {
      if (membersList[i]['uid'] == userMap!['uid']) {
        isAlreadyExist = true;
      }
    }

    if (!isAlreadyExist) {
      setState(() {
        membersList.add({
          "name": userMap!['name'],
          "email": userMap!['email'],
          "uid": userMap!['uid'],
          "isAdmin": false,
        });

        userMap = null;
      });
    }
  }

  void onRemoveMembers(int index) {
    if (membersList[index]['uid'] != _auth.currentUser!.uid) {
      setState(() {
        membersList.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Members"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: membersList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => onRemoveMembers(index),
                    leading: Icon(Icons.account_circle),
                    title: Text(membersList[index]['name']),
                    subtitle: Text(membersList[index]['email']),
                    trailing: Icon(Icons.close),
                  );
                },
              ),
            ),
            SizedBox(
              height: size.height / 20,
            ),
            Container(
              height: size.height / 14,
              width: size.width,
              alignment: Alignment.center,
              child: SizedBox(
                height: size.height / 14,
                width: size.width / 1.15,
                child: TextField(
                  controller: _search,
                  decoration:const InputDecoration(
                    hintText: "Search",
                      focusedBorder: (UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black))),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    )


                    // hintText: "Search",
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 50,
            ),
            isLoading
                ? Container(
                    height: size.height / 12,
                    width: size.height / 12,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    onPressed: onSearch,
                    child: Text("Search"),
                  ),
            userMap != null
                ? ListTile(
                    onTap: onResultTap,
                    leading: Icon(Icons.account_box),
                    title: Text(userMap!['name']),
                    subtitle: Text(userMap!['email']),
                    trailing: Icon(Icons.add),
                  )
                : SizedBox(),
          ],
        ),
      ),
      floatingActionButton: membersList.length >= 2
          ? FloatingActionButton(
              child:const Icon(Icons.forward),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CreateGroup(
                    membersList: membersList,
                  ),
                ),
              ),
            )
          : SizedBox(),
    );
  }
}




















// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:personal_wallet/screens/group_chate/create_group/create_groups.dart';
// import 'package:personal_wallet/screens/group_chate/group_controller.dart';

// class AddMembersInGroup extends StatelessWidget {
//   const AddMembersInGroup({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;

//     return GetBuilder<GroupController>(
//         init: GroupController(),
//         builder: (controller) {
//           return Obx((() => Scaffold(
//                 appBar: AppBar(
//                   title: const Text("Add Members"),
//                 ),
//                 body: SingleChildScrollView(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Flexible(
//                         child: ListView.builder(
//                           itemCount: controller.membersList.length,
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemBuilder: (context, index) {
//                             return ListTile(
//                               onTap: () => controller.onRemoveMembers(index),
//                               leading: const Icon(Icons.account_circle),
//                               title:
//                                   Text(controller.membersList[index]['name']),
//                               subtitle:
//                                   Text(controller.membersList[index]['email']),
//                               trailing: const Icon(Icons.close),
//                             );
//                           },
//                         ),
//                       ),
//                       SizedBox(
//                         height: size.height / 20,
//                       ),
//                       Container(
//                         height: size.height / 14,
//                         width: size.width,
//                         alignment: Alignment.center,
//                         child: SizedBox(
//                           height: size.height / 14,
//                           width: size.width / 1.15,
//                           child: TextField(
//                             controller: controller.search,
//                             decoration: const InputDecoration(
//                                 hintText: "Search",
//                                 focusedBorder: (UnderlineInputBorder(
//                                     borderSide:
//                                         BorderSide(color: Colors.black))),
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.black),
//                                 )),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: size.height / 50,
//                       ),
//                       controller.isLoading
//                           ? Container(
//                               height: size.height / 12,
//                               width: size.height / 12,
//                               alignment: Alignment.center,
//                               child: const CircularProgressIndicator(),
//                             )
//                           : ElevatedButton(
//                               onPressed: controller.onSearch,
//                               child: const Text("Search"),
//                             ),
//                       controller.userMap != null
//                           ? ListTile(
//                               onTap: () {
//                                 debugPrint("add user");
//                                 controller.onResultTap;
//                               },
//                               leading: const Icon(Icons.account_box),
//                               title: Text(controller.userMap!['name']),
//                               subtitle: Text(controller.userMap!['email']),
//                               trailing: const Icon(Icons.add),
//                             )
//                           : const SizedBox(),
//                     ],
//                   ),
//                 ),
//                 floatingActionButton: controller.membersList.length >= 2
//                     ? FloatingActionButton(
//                         child: const Icon(Icons.forward),
//                         onPressed: () {
//                           Get.to(
//                             CreateGroup(
//                               membersList: controller.membersList,
//                             ),
//                           );
//                         }

//                         // Navigator.of(context).push(
//                         //   MaterialPageRoute(
//                         //     builder: (_) => CreateGroup(
//                         //       membersList: controller.membersList,
//                         //     ),
//                         //   ),
//                         // ),
//                         )
//                     : const SizedBox(),
//               )));
//         });
//   }
// }
