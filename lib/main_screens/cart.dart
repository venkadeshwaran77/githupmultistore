import 'package:flutter/material.dart';
import 'package:multi_store/widgets/appbar_widget.dart';
import 'package:multi_store/widgets/yellow_button.dart';

class CartScreen extends StatefulWidget {
  final Widget? back;
  const CartScreen({Key? key, this.back}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading:widget.back,
            title: AppBarTitle(title: 'Cart'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete_forever, color: Colors.black),
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Yours Cart Is Empty !', style: TextStyle(fontSize: 30)),
                SizedBox(height: 50),
                Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(25),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.6,
                    onPressed: () {
                      Navigator.canPop(context)
                      ? Navigator.pop(context)
                      : Navigator.pushReplacementNamed(context, "customer_home");
                    },
                    child: Text(
                      'continue shopping',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Total: \₹', style: TextStyle(fontSize: 18)),
                    Text(
                      '00.00',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                YellowButton(width: 0.45, lable: 'CHECK OUT', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
