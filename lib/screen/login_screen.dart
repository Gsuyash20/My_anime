import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:my_anime/screen/sign_up_screen.dart';
import '../constant_sign_in.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const id = 'login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Container(
          decoration: kOuterBoxDecoration,
          child: Padding(
            padding: const EdgeInsets.only(top: 110, left: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      ColorizeAnimatedText('Hello There.',
                          textStyle: const TextStyle(
                              fontSize: 45, fontWeight: FontWeight.w900),
                          colors: colorizeColors)
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Login or SignUp to continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: kInnerBoxDecoration,
                    margin: const EdgeInsets.only(right: 30),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        TextField(
                          decoration:
                          kTextFieldDecoration.copyWith(hintText: 'Email'),
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextField(
                          obscureText: true,
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Password'),
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            try {
                              await _auth.signInWithEmailAndPassword(
                                  email: email, password: password);
                              if (!mounted) return;
                              Navigator.pushNamed(context, FirstScreen.id);
                            } catch (e) {
                              print(e);
                            }
                          },
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                              const Size(80, 40),
                            ),
                          ),
                          child: const Text(
                            'Sign in',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: kLBottomTextStyle,
                        textAlign: TextAlign.start,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpScreen.id);
                        },
                        child: TextLiquidFill(
                          text: 'Sign Up',
                          boxWidth: 80,
                          boxHeight: 65,
                          waveColor: const Color(0xffFF2B00),
                          boxBackgroundColor: const Color(0xff00d4ff),
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
