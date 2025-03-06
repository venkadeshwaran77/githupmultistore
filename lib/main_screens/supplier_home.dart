import 'package:flutter/material.dart';
import 'package:multi_store/main_screens/category.dart';
import 'package:multi_store/main_screens/dashboard.dart';
import 'package:multi_store/main_screens/home.dart';
import 'package:multi_store/main_screens/stores.dart';

class SupplierHomeScreen extends StatefulWidget {
  const SupplierHomeScreen({super.key});

  @override
  State<SupplierHomeScreen> createState() => _SupplierHomeScreenState();
}

class _SupplierHomeScreenState extends State<SupplierHomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = [
  HomeScreen(),
  CategoryScreen(),
  StoresScreen(),
 DashBoardScreen(),
  Center(child:Text('upload'),),
  ];
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs [_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'stores'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.upload), label: 'Upload'),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
