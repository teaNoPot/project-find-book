import 'package:bookui/src/page/home/widget/coming_book.dart';
import 'package:bookui/src/page/home/widget/custom_app_bar.dart';
import 'package:bookui/src/page/home/widget/recommended_book.dart';
import 'package:bookui/src/page/home/widget/trending_book.dart';
import 'package:bookui/src/settings/settings_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final SettingsController settingsController;

  const HomePage({Key? key, required this.settingsController})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _widgetOptions = <Widget>[
      ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Explore",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
          CustomAppBar(settingsController: widget.settingsController),
          //ComingBook(),
          RecommendedBook(),
          TrendingBook(),
        ],
      ),
      ListView(children: [
        CustomAppBar(settingsController: widget.settingsController),
      ]),
      Text(
        'Index 2: Favorites',
      ),
    ];

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  BottomNavigationBar _buildBottomNavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      selectedItemColor: Colors.amber[800],
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(
            Icons.home_filled,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Search',
          icon: Icon(Icons.search_outlined),
        ),
        BottomNavigationBarItem(
          label: 'Favorites',
          icon: Icon(Icons.favorite),
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
