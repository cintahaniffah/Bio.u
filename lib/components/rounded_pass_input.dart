import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:biouapp/components/input_container.dart'; 
import '../constants.dart';

class RoundedPassInput extends StatelessWidget {
  const RoundedPassInput({
    Key key,
    @required this.hint
  }) : super(key : key);

  final String hint;

  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
        return InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: size.width *0.8,
          height: 65 ,
          decoration : BoxDecoration(
          borderRadius : BorderRadius.circular(30),
          color : Colors.blueGrey.shade50,
        ), 
 

        padding: EdgeInsets.symmetric(vertical: 8),
        alignment : Alignment.center,
        child: TextField(
          cursorColor: kBackgroundColor,
          decoration : InputDecoration(
          icon : Icon(Icons.lock, color:kPrimaryColor),
          hintText: hint,
          border : InputBorder.none
        ),
      ),
      ),
   );
  }
}
