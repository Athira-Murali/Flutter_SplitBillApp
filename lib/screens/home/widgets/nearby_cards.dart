import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:personal_wallet/screens/widgets/avatar.dart';
import 'package:personal_wallet/screens/widgets/label_text.dart';

class NearByFriendsCard extends StatelessWidget {
  const NearByFriendsCard(
      {Key? key,
      required this.labelText,
      required this.avatar,
      required this.createStoryStatus})
      : super(key: key);

  final String labelText;
  final String avatar;
  final bool createStoryStatus;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        createStoryStatus
            ? SizedBox(
                height: 50,
                width: 50,
                child: DottedBorder(
                    strokeWidth: 3,
                    borderType: BorderType.Circle,
                    color: Colors.amber,
                    dashPattern: const [4, 1],
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.add))),
              )
            : Avatar(displayImage: avatar),
        const SizedBox(
          height: 20,
        ),
        LabelText(
          context: context,
          label: labelText,
        )
      ],
    );
  }
}
