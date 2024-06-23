import 'package:dairyapp/Pages/Home/Tabs/SettingTab.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../../Utility/Customeappbar.dart';
import 'Tabs/HomePageTab/HomePagetab.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  static List<Widget> _pages = <Widget>[
    Center(child: Text('Page 1')),
    HomePageTab(),
    SettingsTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title:"Milky",),
      body: _pages[_selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        items: [
          TabItem(icon: Icons.article, title: ''),
          TabItem(icon: Icons.home, title: ''),
          TabItem(icon: Icons.person_rounded, title: ''),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

