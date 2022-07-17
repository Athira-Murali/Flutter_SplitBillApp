import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:personal_wallet/screens/widgets/avatar.dart';
import 'package:personal_wallet/screens/widgets/label_text.dart';
import 'package:personal_wallet/utils/assets.dart';

class DissmissibleList extends StatelessWidget {
  const DissmissibleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(20, (i) => "items${i + 1}");
    return Expanded(
      flex: 1,
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              key: Key(item),
              onDismissed: (direction) {
                if (direction == DismissDirection.startToEnd) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("")));
                } else if (direction == DismissDirection.endToStart) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("")));
                }
                // setState(() {
                //   items.removeAt(index);
                // });
                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //     content: Text('$items[index] dissmissed')));
              },
              background: const Text(''),
              secondaryBackground: Container(
                padding: const EdgeInsets.only(right: 30),
                alignment: Alignment.centerRight,
                child: Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              ),
              child: Container(
                margin: const EdgeInsets.all(10),
                child: DottedBorder(
                  strokeWidth: 1,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(20),
                  color: Colors.grey,
                  dashPattern: const [4, 1],
                  child: ListTile(
                      title:  Text(
                        "joo",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      subtitle:LabelText(context: context,label: "\$77 USA",),
                       
                      leading: CircleAvatar(
                        radius: 50,
                        child: Avatar(displayImage: image1),
                      )),
                ),
              ),
            );
          }),
    );
  }
}
