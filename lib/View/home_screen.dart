import 'package:flutter/material.dart';
import 'package:movies_app/Core/theme/my_theme.dart';
import 'package:movies_app/View/browse/browse_view.dart';
import 'package:movies_app/View/home/home_view/home_view.dart';
import 'package:movies_app/View/search/search_view.dart';
import 'package:movies_app/View/watchlist/watchlist_view.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var tabs = [
      HomeView(),
      SearchView(),
      BrowseView(),
      WatchlistView(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              backgroundColor: MyTheme.secondaryColor,
              icon: ImageIcon(
                AssetImage('assets/images/home.png'),
              ),
              label: "HOME"),
          BottomNavigationBarItem(
              backgroundColor: MyTheme.secondaryColor,
              icon: ImageIcon(
                AssetImage('assets/images/search.png'),
              ),
              label: "SEARCH"),
          BottomNavigationBarItem(
              backgroundColor: MyTheme.secondaryColor,
              icon: ImageIcon(
                AssetImage('assets/images/browse.png'),
              ),
              label: "BROWSE"),
          BottomNavigationBarItem(
              backgroundColor: MyTheme.secondaryColor,
              icon: ImageIcon(
                AssetImage('assets/images/bookmarks.png'),
              ),
              label: "WATCHLIST"),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }
}
