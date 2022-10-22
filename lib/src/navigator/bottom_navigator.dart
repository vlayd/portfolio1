import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _currentIndex = 0;
  final _pages = <Widget> [
    const Center(child: Icon(Icons.cloud, size: 64, color: Colors.teal,)),
    const Center(child: Icon(Icons.alarm, size: 64, color: Colors.redAccent,)),
    const Center(child: Icon(Icons.forum, size: 64, color: Colors.blueGrey,)),
    const Center(child: Icon(Icons.forum, size: 64, color: Colors.blueGrey,)),
  ];

  final _navigator = <BottomNavigationBarItem> [
    const BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Tab1'),
    const BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Tab2'),
    const BottomNavigationBarItem(icon: Icon(Icons.forum), label: 'Tab3'),
    const BottomNavigationBarItem(icon: Icon(Icons.forum), label: 'Tab4'),
  ];

  @override
  Widget build(BuildContext context) {
    assert(_pages.length == _navigator.length);

    return Scaffold(
      appBar: AppBar(
          title: const Text('Tabs pelo Appbar'),
          backgroundColor: Colors.cyan
      ),
      bottomNavigationBar: menu(_navigator),
      body: _pages[_currentIndex],
    );
  }

  Widget menu(List<BottomNavigationBarItem> navigator) {
    return Container(
      color: const Color(0xFF3F5AA6),
      child: BottomNavigationBar(
        items: navigator,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
