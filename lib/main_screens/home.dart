import 'package:flutter/material.dart';
import 'package:multi_store/widgets/fake_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: FakeSearch(),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.yellow,
            indicatorWeight: 8,
            tabs: [
              RepeatedTab(label: 'Men'),
              RepeatedTab(label: 'Women'),
              RepeatedTab(label: 'Shoes'),
              RepeatedTab(label: 'Bags'),
              RepeatedTab(label: 'Electronics'),
              RepeatedTab(label: 'Accessories'),
              RepeatedTab(label: 'Home & Garden'),
              RepeatedTab(label: 'Kids'),
              RepeatedTab(label: 'Beauty'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Men screen')),
            Center(child: Text('Women screen')),
            Center(child: Text('Shoes screen')),
            Center(child: Text('Bags screen')),
            Center(child: Text('Electronics screen')),
            Center(child: Text('Accessories screen')),
            Center(child: Text('Home and garden screen')),
            Center(child: Text('kids screen')),
            Center(child: Text('beauty screen')),
          ],
        ),
      ),
    );
  }
}

class RepeatedTab extends StatelessWidget {
  final String label;
  const RepeatedTab({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(label, style: TextStyle(color: Colors.grey.shade600)),
    );
  }
}
