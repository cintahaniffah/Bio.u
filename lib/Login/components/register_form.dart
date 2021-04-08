import 'package:biouapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:biouapp/components/rounded_button.dart';
import 'package:biouapp/components/rounded_input.dart';
import 'package:biouapp/components/rounded_pass_input.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key key,
    @required this.isLogin,
    @required this.animationDuration,
    @required this.size,
    @required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;


  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 0.0 : 1.0,
      duration: animationDuration * 5,
      child: 
      Visibility(
       visible: !isLogin,
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 130),
                  Text(
                    'hai! Selamat Datang',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: kPrimaryColor),
                  ),
                  SizedBox(height: 30),
                  Image.asset(
                    'assets/images/reg.png',
                    width : 250,
                    height : 200,  
                  ),
                  SizedBox(height: 30),
                  RoundedInput(icon: Icons.mail, hint: 'Email'),
                  SizedBox(height: 15),
                  RoundedInput(icon: Icons.face_rounded, hint:'Nama'),
                  SizedBox(height: 15),
                  RoundedPassInput(hint: 'Password'),
                  SizedBox(height: 30),
                  RoundedButton(title: 'SIGN UP')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
