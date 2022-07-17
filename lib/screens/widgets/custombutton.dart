import 'package:flutter/material.dart';
import 'package:personal_wallet/utils/theme_constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.context,
      required this.onPressed,
      required this.title})
      : super(key: key);

  final BuildContext context;
  final GestureTapCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          height: size.height / 14,
          width: size.width / 1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: primaryButtonColor,
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style:const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
