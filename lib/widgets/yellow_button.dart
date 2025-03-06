import 'package:flutter/material.dart';


class YellowButton extends StatelessWidget {
  final String lable;
  final Function() onPressed;
  final double width;

  const YellowButton({
    Key? key,
    required this.lable,
    required this.onPressed,
    required this.width,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(25),
      ),
      child: MaterialButton(onPressed:onPressed, child: Text(lable)),
    );
  }
}
