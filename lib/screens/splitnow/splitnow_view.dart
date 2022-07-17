import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:personal_wallet/screens/splitnow/widgets/dismissible_list.dart';

import 'package:personal_wallet/screens/widgets/label_text.dart';

class SplitNow extends StatelessWidget {
  const SplitNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Split Bill",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Get.toNamed('/searchlist');
              },
              child: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelText(context: context, label: "payment"),
            const SizedBox(
              height: 10,
            ),
            Text(
              "350,70",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            billedContainer(size),
            const SizedBox(
              height: 10,
            ),
            const DissmissibleList()
          ],
        ),
      ),
    );
  }

  Widget billedContainer(Size size) {
    return Container(
      height: size.height / 3,
      width: size.width / 1.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(238, 194, 141, 1),
      ),
      child: Image.asset(
        "assets/images/bill.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
