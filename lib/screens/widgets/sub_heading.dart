import 'package:flutter/material.dart';

class SubHeadingText extends StatelessWidget {
  const SubHeadingText({
    Key? key,
    required this.context,
    required this.title,
  }) : super(key: key);

  final BuildContext context;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          Theme.of(context).textTheme.headline6?.copyWith(color: Colors.black),
    );
  }
}
