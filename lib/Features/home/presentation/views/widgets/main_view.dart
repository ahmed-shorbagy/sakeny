import 'package:flutter/material.dart';
import 'package:sakeny/Features/favorites/peresentation/views/favorites_view.dart';
import 'package:sakeny/Features/home/presentation/views/home_view.dart';
import 'package:sakeny/Features/home/presentation/views/settings_view.dart';
import 'package:sakeny/generated/l10n.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final PageController _pageController = PageController(initialPage: 1);

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        clipBehavior: Clip.none,
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const <Widget>[
          SettingsView(),
          HomeView(),
          FavoritesView(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(0),
        color: Theme.of(context).colorScheme.secondary,
        surfaceTintColor: Theme.of(context).colorScheme.background,
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: S.of(context).bottomBarSettings,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: S.of(context).bottomBarHome,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              label: S.of(context).bottomBarFavourite,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          showUnselectedLabels: true,
          unselectedItemColor: Theme.of(context).colorScheme.onBackground,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
