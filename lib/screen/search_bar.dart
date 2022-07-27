import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);
  static const id = 'searchBar';

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const TextField(
            style: TextStyle(fontSize: 18),
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Search...',
              border: InputBorder.none,
              focusedBorder: InputBorder.none
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {}
            )
          ],
        ),
      ),
    );
  }
}
