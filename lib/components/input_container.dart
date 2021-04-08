import 'package:flutter/material.dart';

import '../constants.dart';

class InputContainer extends StatelessWidget {
  const InputContainer({
    Key key,
    @required this.child, 
  }) : super(key : key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var size;
      var kPrimaryColor2 = kPrimaryColor;
      return  Container(
       margin  : EdgeInsets.symmetric(vertical : 10),
       padding : EdgeInsets.symmetric(horizontal :20, vertical :5),
       width : size.width * 0.8,
       decoration :BoxDecoration(
       borderRadius: BorderRadius.circular(30),
       color : kPrimaryColor2.withAlpha(50)
      ),
   );
  }
}