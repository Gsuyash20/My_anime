import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.dark(),
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 240,
                title: const Text(
                  'Profile',
                  style: TextStyle(fontSize: 28,
                  fontFamily: 'Pacifico'),
                ),
                centerTitle: true,
                flexibleSpace: const FlexibleSpaceBar(
                  centerTitle: true,
                  title: CircleAvatar(
                    radius: 50,
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        alignment: Alignment.topCenter,
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.pen),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
