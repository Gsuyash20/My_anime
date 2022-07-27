import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_anime/screen/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const id = 'home_screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
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
      ),
    );
  }
}