import 'package:flutter/material.dart';


class TopContainer extends StatelessWidget {
  const TopContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      decoration:const BoxDecoration(
         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(140)),
        color: Color(0xFFFFC200),
      ),
      child: Center(child: Image.asset("assets/images/logodollar.png",height: 50,)),
             
     
    );
  }
}