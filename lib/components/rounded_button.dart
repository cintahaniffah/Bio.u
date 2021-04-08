import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    @required this.title, TextStyle style,
  }) : super(key : key);

final String title;

  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
        return InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: size.width *0.8,
          decoration : BoxDecoration(
          borderRadius : BorderRadius.circular(25),
          color :kPrimaryColor,
        ), 

        padding: EdgeInsets.symmetric(vertical:10),
        alignment : Alignment.center,
        child: Text(
          title,
          style: TextStyle(
          color: Colors.white,
          fontSize: 14
         ),
        ),
      ),
   );
 }
}