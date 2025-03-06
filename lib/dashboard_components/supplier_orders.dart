import 'package:flutter/material.dart';
import 'package:multi_store/widgets/appbar_widget.dart';

class  SupplierOrders extends StatelessWidget {
  const SupplierOrders ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation:0,
        backgroundColor:Colors.white,
        title: AppBarTitle(title:'Supplier Orders',
        ),
        centerTitle:true,
        leading: AppBarBackButton(
          
        ),
      ),
    );
  }
}
