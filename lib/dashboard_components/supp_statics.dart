import 'package:flutter/material.dart';
import 'package:multi_store/widgets/appbar_widget.dart';

class  StaticsScreen extends StatelessWidget {
  const StaticsScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation:0,
        backgroundColor:Colors.white,
        title: AppBarTitle(title:'Statics', 
        ),
        centerTitle:true,
        leading: AppBarBackButton(
          
        ),
      ),
    );
  }
}
