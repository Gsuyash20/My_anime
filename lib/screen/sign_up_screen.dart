import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../constant_sign_in.dart';
import '../sign_in/google_sign_in.dart';
import 'home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const id = 'sign_up_screen';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Container(
          decoration: kOuterBoxDecoration,
          child: Padding(
            padding: const EdgeInsets.only(top: 110, left: 40),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 100.0),
                      const Text(
                        'Sign Up with',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'Pacifico',
                            color: Colors.white),
                      ),
                      const SizedBox(width: 10.0, height: 100.0),
                      DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Pacifico',
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            RotateAnimatedText('Email'),
                            RotateAnimatedText('Google'),
                          ],
                          repeatForever: true,
                        ),
                      ),
                    ],
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
                              _auth.createUserWithEmailAndPassword(
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
                            'Sign Up',
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
                    height: 90,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.googleLogIn();
                      Navigator.pushNamed(context, FirstScreen.id);
                    },
                    style: ButtonStyle(
                      foregroundColor:
                      MaterialStateProperty.all(Colors.white),
                      textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 24),),),
                    icon: const FaIcon(FontAwesomeIcons.google,color: Colors.black38,),
                    label: const Text('Sign Up with Google',style: TextStyle(fontFamily: 'Pacifico',),),
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
