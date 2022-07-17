import 'package:flutter/material.dart';


import 'package:personal_wallet/screens/widgets/avatar.dart';

import 'package:personal_wallet/screens/widgets/label_text.dart';

import 'package:personal_wallet/utils/assets.dart';
import 'package:personal_wallet/utils/theme_constant.dart';

class CardSection extends StatelessWidget {
  const CardSection(
      {Key? key,
      required this.bill,
      required this.context,
      required this.onTap})
      : super(key: key);
  final String bill;
  final Function onTap;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelText(context: context, label: "Total Bill"),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  bill,
                  style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: Colors.black),
                )
                // SubHeadingText(context: context, title: "\$350,70"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelText(context: context, label: "Split with"),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Edit",
                      style: 
                            Theme.of(context).textTheme.headline6?.copyWith(
                                  color: Colors.blue,
                                ),
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Avatar(displayImage: image1),
                Avatar(displayImage: image2),
                Avatar(displayImage: image4),
                Avatar(displayImage: image6),
                Avatar(displayImage: image3),
                Avatar(displayImage: image7)
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(90)),
              child: ElevatedButton(
                onPressed: () {
                  debugPrint("Split button");

                  onTap();
                },
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(primaryButtonColor),
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return primaryButtonColor;
                      }
                      return primaryButtonColor;
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: primaryButtonColor),
                    ))),
                child: const Text(
                  "Split Now",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
