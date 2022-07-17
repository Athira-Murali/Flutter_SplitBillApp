
import 'package:flutter/material.dart';


class CircularButton extends StatelessWidget {
  const CircularButton({Key? key, required this.buttonIcon, required this.buttonAction,}) : super(key: key);

  final IconData buttonIcon;
  final VoidCallback buttonAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
        child: IconButton(
          icon: Icon(buttonIcon, size: 25,color: Colors.black,),
          onPressed: buttonAction, )
      
    );
    
  }
}