import 'package:flutter/material.dart';
import 'package:multi_store/widgets/appbar_widget.dart';

class  ManageProducts extends StatelessWidget {
  const ManageProducts ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation:0,
        backgroundColor:Colors.white,
        title: AppBarTitle(title:'Manage Products', 
        ),
        centerTitle:true,
        leading: AppBarBackButton(
          
        ),
      ),
    );
  }
}
