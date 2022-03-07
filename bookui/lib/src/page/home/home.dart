import 'package:bookui/src/page/home/widget/coming_book.dart';
import 'package:bookui/src/page/home/widget/custom_app_bar.dart';
import 'package:bookui/src/page/home/widget/recommended_book.dart';
import 'package:bookui/src/page/home/widget/trending_book.dart';
import 'package:bookui/src/settings/settings_controller.dart';
import 'package:bookui/src/page/home/widget/search_navigation_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/favorite_list_screen.dart';

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

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _widgetOptions = <Widget>[
      HomeNavig(controller: widget.settingsController),
      SearchNavig(controller: widget.settingsController),
      FavoriteNavig(controller: widget.settingsController),
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
          label: 'Explore',
          icon: Icon(
            Icons.whatshot,
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

class HomeNavig extends StatelessWidget {
  final SettingsController controller;

  const HomeNavig({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Explore",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                IconButton(
                    onPressed: () {
                      controller.updateThemeMode(
                          controller.themeMode == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light);
                    },
                    icon: Icon(
                      controller.themeMode == ThemeMode.light
                          ? Icons.dark_mode_rounded
                          : Icons.light_mode_rounded,
                    ))
              ],
            )),
        //ComingBook(),
        RecommendedBook(),
        TrendingBook(),
      ],
    );
  }
}
