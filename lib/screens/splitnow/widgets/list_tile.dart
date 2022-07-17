import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:personal_wallet/screens/widgets/avatar.dart';


class ListCard extends StatelessWidget {
  const ListCard({Key? key, required this.name, required this.amount, required this.profilepic}) : super(key: key);

  final String name;
  final String amount;
  final String profilepic;


  @override
  Widget build(BuildContext context) {
    return DottedBorder(
       borderType: BorderType.RRect,
          radius: const Radius.circular(20),
          color: Colors.grey,
          dashPattern: const [3, 1],
      //elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
            radius: 50,
            child: Avatar(
              displayImage: profilepic,
            )),
        title: Text(name),
        subtitle: Text(
          amount
          // "\$77 USA",
        ),
      ),
    );
  }
}
