import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants.dart';
import 'components/cancel_button.dart';
import 'components/login_form.dart';
import 'components/register_form.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  bool isLogin = true;
  Animation<double> containerSize;
  AnimationController animationController;
  Duration animationDuration = Duration(milliseconds: 270);

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);

    animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);

    containerSize = Tween<double>(
            begin: size.height * 0.1, end: defaultRegisterSize)
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.linear));

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            children: [
              //dekorasi
              Positioned(
                top: -50,
                left: -60,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: kPrimaryColor),
                ),
              ),

              Positioned(
                top: 50,
                right: -40,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: kPrimaryColor),
                ),
              ),

              // Cancel Button
              CancelButton(
                isLogin: isLogin,
                animationDuration: animationDuration,
                size: size,
                animationController: animationController,
                tapEvent: isLogin
                    ? () {}
                    : () {
                        animationController.reverse();
                        setState(() {
                          isLogin = !isLogin;
                        });
                      },
              ),

              //login form
              LoginForm(
                  isLogin: isLogin,
                  animationDuration: animationDuration,
                  size: size,
                  defaultLoginSize: defaultLoginSize),

              // Register Container
              Positioned(
                bottom: 0,
                child: AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    if (viewInset == 0 && isLogin) {
                      return buildRegisterContainer();
                    } else if (!isLogin) {
                      return buildRegisterContainer();
                    }
                    // Returning empety container
                    return Container();
                  },
                ),
              ),

              // Register Form
              RegisterForm(
                  isLogin: isLogin ?? false,
                  animationDuration: animationDuration,
                  size: size ?? MediaQuery.of(context).size,
                  defaultLoginSize: size.height - (size.height * 0.2))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRegisterContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
          color: Colors.blueGrey.shade50),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: !isLogin
            ? () {}
            : () {
                animationController.forward();

                setState(() {
                  isLogin = !isLogin;
                });
              },
        child: isLogin
            ? Text(
                "Belum Punya Akun? Sign Up",
                style: TextStyle(color: kPrimaryColor, fontSize: 12),
              )
            : Container(),
      ),
    );
  }
}
