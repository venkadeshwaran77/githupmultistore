import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_store/widgets/yellow_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

const textColors = [
  Colors.yellowAccent,
  Colors.red,
  Colors.blueAccent,
  Colors.green,
  Colors.purple,
  Colors.teal,
];
const textStyle = TextStyle(
  fontSize: 45,
  fontWeight: FontWeight.bold,
  fontFamily: 'Acme',
);

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool processing = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/inapp/bg2.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'WELCOME',
                    textStyle: textStyle,
                    colors: textColors,
                  ),
                  ColorizeAnimatedText(
                    'PHOENIX',
                    textStyle: textStyle,
                    colors: textColors,
                  ),
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
              SizedBox(
                height: 120,
                width: 200,
                child: Image(image: AssetImage('images/inapp/im05.png')),
              ),
              SizedBox(
                height: 80,
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellowAccent,
                    fontFamily: 'Acme',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText("BUY"),
                      RotateAnimatedText('SHOP'),
                      RotateAnimatedText('PHOENIX'),
                    ],
                    repeatForever: true,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Suppliers only',
                            style: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedLogo(controller: _controller),
                            YellowButton(
                              lable: 'Log In',
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  "supplier_home",
                                );
                              },
                              width: 0.25,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: YellowButton(
                                lable: 'Sign Up',
                                onPressed: () {},
                                width: 0.25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: YellowButton(
                            lable: 'Log In',
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                "customer_home",
                              );
                            },
                            width: 0.25,
                          ),
                        ),
                        YellowButton(
                          lable: 'Sign Up',
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              "customer_signup",
                            );
                          },
                          width: 0.25,
                        ),
                        AnimatedLogo(controller: _controller),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white38.withOpacity(0.3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GoogleFacebookLogin(
                        label: 'Google',
                        onPressed: () {},
                        child: Image(
                          image: AssetImage('images/inapp/google.jpg'),
                        ),
                      ),
                      GoogleFacebookLogin(
                        label: 'Facebook',
                        onPressed: () {},
                        child: Image(
                          image: AssetImage('images/inapp/facebook.jpg'),
                        ),
                      ),
                    processing == true 
                    ? CircularProgressIndicator()
                    : GoogleFacebookLogin(
                        label: 'Guest',
                        onPressed: () async {
                          setState(() {
                            processing = true;
                          });
                          await FirebaseAuth.instance.signInAnonymously();
                          Navigator.pushReplacementNamed(
                            context,
                            "customer_home",
                          );
                        },
                        child: Icon(
                          Icons.person,
                          size: 55,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({super.key, required AnimationController controller})
    : _controller = controller;

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.view,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi,
          child: child,
        );
      },
      child: Image(image: AssetImage('images/inapp/im06.png')),
    );
  }
}

class GoogleFacebookLogin extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final Widget child;
  const GoogleFacebookLogin({
    Key? key,
    required this.child,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            SizedBox(height: 50, width: 50, child: child),
            Text(label, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
