import 'package:biouapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:biouapp/components/rounded_button.dart';
import 'package:biouapp/components/rounded_input.dart';
import 'package:biouapp/components/rounded_pass_input.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
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
      opacity: isLogin ? 1.0 : 0.0,
      duration: animationDuration * 4,
      child: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150),
              Text(
                'Selamat Datang Kembali',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: kPrimaryColor),
              ),
              SizedBox(height: 5),
              Image.asset(
                'assets/images/log.png',
                 width : 250,
                 height : 200, 
              ),
              SizedBox(height: 10),
              RoundedInput(icon: Icons.mail, hint: 'Email User',
              ),
              SizedBox(height: 15),
              RoundedPassInput(hint: 'Password'),
              SizedBox(height: 30),
              RoundedButton(title: 'LOGIN')
            ],
          ),
        ),
      ),
    );
  }
}
