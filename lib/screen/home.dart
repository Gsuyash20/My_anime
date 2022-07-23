import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);
  static const id = 'first_screen';
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
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
                    Icons.add,
                    size: 28,
                  ),
                  label: ''),
              NavigationDestination(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Profile')
            ],
          ),
        ),
      ),
    );
  }
}
