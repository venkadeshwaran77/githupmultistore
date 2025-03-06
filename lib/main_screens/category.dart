import 'package:flutter/material.dart';
import 'package:multi_store/categories/accessories_categ.dart';
import 'package:multi_store/categories/bags_category.dart';
import 'package:multi_store/categories/beauty_categ.dart';
import 'package:multi_store/categories/electronics_categ.dart';
import 'package:multi_store/categories/home&garden_categ.dart';
import 'package:multi_store/categories/kids_categ.dart';
import 'package:multi_store/categories/men_categ.dart';
import 'package:multi_store/categories/shoes_categ.dart';
import 'package:multi_store/categories/women_categ.dart';
import 'package:multi_store/widgets/fake_search.dart';

List<ItemsData> items = [
  ItemsData(label: "Men"),
  ItemsData(label: "Women"),
  ItemsData(label: "Shoes"),
  ItemsData(label: "Bags"),
  ItemsData(label: "Electronics"),
  ItemsData(label: "Accessories"),
  ItemsData(label: "Home & garden"),
  ItemsData(label: "Kids"),
  ItemsData(label: "Beauty"),
];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
     for (var element in items) {
            element.isSelected = false;
          }
          setState(() {
            items[0].isSelected = true;
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: FakeSearch(),
      ),
      body: Stack(
        children: [
          Positioned(bottom: 0, left: 0, child: sideNavigator(size)),
          Positioned(bottom: 0, right: 0, child: categView(size)),
        ],
      ),
    );
  }

  Widget sideNavigator(Size size) {
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.2,

      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                index,
                duration: Duration(microseconds: 1000),
                curve: Curves.bounceInOut,
              );
            },
            child: Container(
              color:
                  items[index].isSelected == true
                      ? Colors.white
                      : Colors.grey.shade300,
              height: 100,
              child: Center(child: Text(items[index].label)),
            ),
          );
        },
      ),
    );
  }

  Widget categView(Size size) {
    return Container(
      height: size.height * 0.8,
      width: size.width * 0.8,
      color: Colors.white,
      child: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          for (var element in items) {
            element.isSelected = false;
          }
          setState(() {
            items[value].isSelected = true;
          });
        },
        scrollDirection: Axis.vertical,
        children: [
          MenCategory(),
          WomenCategory(),
          ShoesCategory(),
          BagsCategory(),
          ElectronicsCategory(),
          AccessoriesCategory(),
          HomeandGardenCategory(),
          KidsCategory(),
          BeautyCategory(),
        ],
      ),
    );
  }
}

class ItemsData {
  String label;
  bool isSelected;
  ItemsData({required this.label, this.isSelected = false});
}
