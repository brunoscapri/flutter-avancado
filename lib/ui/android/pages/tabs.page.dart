import 'package:flutter/material.dart';
import 'package:shopping/ui/android/pages/home.page.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(children: [
        HomePage(),
        Container(color: Colors.red),
        Container(color: Colors.yellow)
      ]),
      bottomNavigationBar: TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.shopping_cart),
          ),
          Tab(
            icon: Icon(Icons.supervisor_account),
          )
        ],
        indicatorColor: Theme.of(context).primaryColor,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(8),
        labelColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
