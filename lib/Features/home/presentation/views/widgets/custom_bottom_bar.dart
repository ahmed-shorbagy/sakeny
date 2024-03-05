import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeny/core/utils/App_router.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
      ],
      currentIndex: 1,
      type: BottomNavigationBarType
          .fixed, // Use fixed type if you want all items to be displayed
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      showUnselectedLabels: true,
      unselectedItemColor: Theme.of(context).colorScheme.onBackground,
      onTap: (index) {
        switch (index) {
          case 0:
            // Navigate to Profile page
            GoRouter.of(context).push(AppRouter.kProfileView);
            break;
          case 1:
            // Navigate to Home page
            GoRouter.of(context).push(AppRouter.kHomeView);
            break;
          case 2:
            // Navigate to Favorites page
            GoRouter.of(context).push(AppRouter.kFavoritesView);
            break;
        }
      },
    );
  }
}
