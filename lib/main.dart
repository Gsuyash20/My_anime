import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_anime/screen/home.dart';
import 'package:my_anime/screen/login_screen.dart';
import 'package:my_anime/screen/sign_up_screen.dart';
import 'package:my_anime/sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          FirstScreen.id: (context) => const FirstScreen(),
          SignUpScreen.id: (context) => const SignUpScreen(),
        },
      ),
    );
  }
}


