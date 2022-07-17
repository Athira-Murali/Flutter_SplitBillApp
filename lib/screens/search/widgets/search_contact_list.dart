import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_wallet/screens/group_chate/group_chate_homescreen.dart';
import 'package:personal_wallet/screens/search/search_view_controller.dart';


class SearchContactList extends StatelessWidget {
  const SearchContactList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<SearchViewController>(
        init:SearchViewController(),
        builder: (controller) {
          return Obx((() => Scaffold(
                //backgroundColor: Colors.black,
                body: controller.isLoading
                    ? Center(
                        child: SizedBox(
                          height: size.height / 20,
                          width: size.height / 20,
                          child: const CircularProgressIndicator(),
                        ),
                      )
                    : Column(
                        children: [
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
                                controller: controller.searchTextController,
                                decoration: const InputDecoration(
                                    focusedBorder: (UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black))),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    )),
                                
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height / 50,
                          ),
                          ElevatedButton(
                            onPressed: controller.onSearch,
                            child: const Text("Search"),
                          ),
                          SizedBox(
                            height: size.height / 30,
                          ),
                          controller.userMap != null
                              ? ListTile(
                                  onTap: () {
                                    String roomId = controller.chatRoomId(
                                        controller
                                            .auth.currentUser!.displayName!,
                                        controller.userMap!['name']);

                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //     builder: (_) => ChatRoom(
                                    //       chatRoomId: roomId,
                                    //       userMap: controller.userMap!,
                                    //     ),
                                    //   ),
                                    // );
                                  },
                                  leading: const Icon(Icons.account_box,
                                      color: Colors.black),
                                  title: Text(
                                    controller.userMap!['name'],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  subtitle: Text(controller.userMap!['email']),
                                  trailing: const Icon(Icons.chat,
                                      color: Colors.black),
                                )
                              : Container(),
                        ],
                      ),
                floatingActionButton: FloatingActionButton(
                    child: const Icon(Icons.group),
                    onPressed: () {
                      Get.to(
                        GroupChatHomeScreen());
                    }),
              )));
        });
  }
}
