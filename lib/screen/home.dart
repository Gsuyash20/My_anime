import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        bottomNavigationBar: buildNavigationBarTheme(),
        appBar: AppBar(
          shadowColor: Colors.transparent,
         // backgroundColor: Colors.transparent,
          elevation: 0,
          shape: const OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none),
          title:  TextField(
            decoration: InputDecoration(
              prefixIcon: IconButton(icon: const FaIcon(FontAwesomeIcons.bars),
                onPressed: () {  },
              ),
              hintText: 'Search',
              fillColor: Colors.red,
              // border: const OutlineInputBorder(
              //     borderRadius: BorderRadius.all(Radius.circular(10)),
              //     borderSide: BorderSide.none),
            ),),
        ),)

    );
  }
  NavigationBarTheme buildNavigationBarTheme() {
    return NavigationBarTheme(
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
    );
  }
}
