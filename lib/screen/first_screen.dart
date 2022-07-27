import 'package:flutter/material.dart';
import 'package:my_anime/screen/home_screen.dart';
import 'package:my_anime/screen/profile.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);
  static const id = 'first_screen';
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int currentIndex = 0;
  final List<Widget> screens = [const HomeScreen(), const ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            backgroundColor: const Color(0xff1C202C),
            indicatorColor: Colors.white54,
            iconTheme: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return const IconThemeData(color: Color(0xff48365A));
                } else {
                  return const IconThemeData(
                    color: Color(0xff5F6063),
                  );
                }
              },
            ),
          ),
          child: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            selectedIndex: currentIndex,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            destinations: const <Widget>[
              NavigationDestination(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home'),
              NavigationDestination(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Profile')
            ],
          ),
        ),
      );
  }
}
