import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget{

  final String displayImage;
 const Avatar({Key? key, required this.displayImage,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.asset(displayImage,width: 50,height: 50,),
    );
  }

}