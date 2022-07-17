import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  const LabelText({
    Key? key,
    required this.context,
    required this.label,
  }) : super(key: key);

  final BuildContext context;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
    );
  }
}

class HeadinglText extends StatelessWidget {
  const HeadinglText({Key? key, required this.context, required this.title})
      : super(key: key);

  final BuildContext context;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,
        style:  Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.black,fontWeight: FontWeight.normal));
  }
}
