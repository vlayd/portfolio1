import 'package:flutter/material.dart';

class BottomTabs extends StatelessWidget {
  const BottomTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pages = <Widget> [
      const Center(child: Icon(Icons.cloud, size: 64, color: Colors.teal,)),
      const Center(child: Icon(Icons.alarm, size: 64, color: Colors.redAccent,)),
      const Center(child: Icon(Icons.forum, size: 64, color: Colors.blueGrey,)),
      const Center(child: Icon(Icons.forum, size: 64, color: Colors.blueGrey,)),
    ];

    final _tabs = <Tab> [
      const Tab(icon: Icon(Icons.cloud), text: 'Tab1'),
      const Tab(icon: Icon(Icons.alarm), text: 'Tab2'),
      const Tab(icon: Icon(Icons.forum), text: 'Tab3'),
      const Tab(icon: Icon(Icons.forum), text: 'Tab3'),
    ];
    return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tabs pelo Appbar'),
            backgroundColor: Colors.cyan
          ),
          bottomNavigationBar: menu(_tabs),
          body: TabBarView(children: _pages),
        )
    );
  }

  Widget menu(List<Tab> tab) {
    return Container(
      color: Color(0xFF3F5AA6),
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.blue,
        tabs: tab,
      ),
    );
  }
}
