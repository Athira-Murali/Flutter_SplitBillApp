import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_wallet/screens/group_chate/create_group/add_members.dart';
import 'package:personal_wallet/screens/group_chate/group_controller.dart';
import 'package:personal_wallet/screens/group_chate/widgets/group_chate_room.dart';

class GroupChatHomeScreen extends StatelessWidget {
  const GroupChatHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GetBuilder<GroupController>(
        init: GroupController(),
        builder: (controller) {
          return Obx((() => Scaffold(
                appBar: AppBar(
                  title: const Text("Groups"),
                ),
                body: controller.isLoading
                    ? Container(
                        height: size.height,
                        width: size.width,
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: controller.groupList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Get.to(
                                GroupChatRoom(
                                  groupName: controller.groupList[index]
                                      ['name'],
                                  groupChatId: controller.groupList[index]
                                      ['id'],
                                ),
                              );
                            },

                            leading:const Icon(Icons.group),
                            title: Text(controller.groupList[index]['name']),
                          );
                        },
                      ),
                floatingActionButton: FloatingActionButton(
                 
                  onPressed: () {
                    Get.to(const AddMembersInGroup());
                  },
                
                  tooltip: "Create Group",
                   child:const Icon(Icons.create),
                ),
              )));
        });
  }
}
