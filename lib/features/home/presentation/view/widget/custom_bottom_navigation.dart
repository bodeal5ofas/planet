import 'package:flutter/material.dart';
import 'package:planet_app/core/utils/theme.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.currentIndex, this.onTap});
  final int currentIndex;
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BottomNavigationBar(
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          onTap: onTap,
          currentIndex: currentIndex,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          unselectedItemColor: Colors.white,
          selectedItemColor: Mytheme.kMainColor,
          items: const [
            BottomNavigationBarItem(
                label: 'planet',
                icon: ImageIcon(
                  AssetImage('assets/images/planet.png'),
                )),
            BottomNavigationBarItem(
                label: 'pets',
                icon: ImageIcon(
                  AssetImage('assets/images/pet_icon.png'),
                )),
            BottomNavigationBarItem(label: 'search0', icon: Icon(Icons.search)),
          ]),
    );
  }
}
