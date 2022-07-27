import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_anime/screen/search_bar.dart';

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
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: const ShapeDecoration(
                      color: Color(0xff1C202C),
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    child: TextField(
                      showCursor: false,
                      decoration: InputDecoration(
                        prefixIconColor: const Color(0xffE2E4E3),
                        prefixIcon: IconButton(
                          icon: const FaIcon(FontAwesomeIcons.bars),
                          focusColor: const Color(0xffE2E4E3),
                          onPressed: () {
                          },
                        ),
                        hintText: 'Search...',
                        border: InputBorder.none,
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, SearchBar.id);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
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
