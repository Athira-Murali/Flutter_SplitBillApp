import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:personal_wallet/screens/home/widgets/nearby_cards.dart';

import 'package:personal_wallet/utils/assets.dart';

class DottedBox extends StatelessWidget {
  const DottedBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(20),
          color: Colors.grey,
          dashPattern: const [3, 1],
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NearByFriendsCard(
                    labelText: "add new",
                    avatar: image1,
                    createStoryStatus: true,
                  ),
                  NearByFriendsCard(
                    labelText: "name",
                    avatar: image1,
                    createStoryStatus: false,
                  ),
                  NearByFriendsCard(
                    labelText: "name1",
                    avatar: image2,
                    createStoryStatus: false,
                  ),
                  NearByFriendsCard(
                    labelText: "name3",
                    avatar: image2,
                    createStoryStatus: false,
                  ),
                  NearByFriendsCard(
                    labelText: "name2",
                    avatar: image3,
                    createStoryStatus: false,
                  ),
                  NearByFriendsCard(
                    labelText: "name4",
                    avatar: image4,
                    createStoryStatus: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
