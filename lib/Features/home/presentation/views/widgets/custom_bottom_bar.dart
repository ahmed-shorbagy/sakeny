import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
      ],
      currentIndex: 1,
      type: BottomNavigationBarType.shifting,
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      showUnselectedLabels: true,
      unselectedItemColor: Theme.of(context).colorScheme.outline,
      onTap: (index) {},
    );
  }
}
