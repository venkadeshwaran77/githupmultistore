import 'package:flutter/material.dart';
import 'package:multi_store/widgets/appbar_widget.dart';

class  BalanceScreen extends StatelessWidget {
  const BalanceScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation:0,
        backgroundColor:Colors.white,
        title: AppBarTitle(title:'Balance', 
        ),
        centerTitle:true,
        leading: AppBarBackButton(
          
        ),
      ),
    );
  }
}
