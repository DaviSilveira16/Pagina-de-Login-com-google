import 'dart:html';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_page/checagem_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  get googleUser => null;

  @override
  void initState() {
    super.initState();
     FirebaseAuth.instance.authStateChanges().listen((User? user){
      if(Credential == false){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ChecagemPage(),
          ),
        );
      }
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            signInWithGoogle();
          },
        
          child: const Text('Login with Google'),
        ),
      ),
    );
  }
}
  
signInWithGoogle() async {
  GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  AuthCredential credential= GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken ,
    idToken: googleAuth?.idToken ,
  );
   await FirebaseAuth.instance.signInWithCredential(credential);
  

  //print(userCredential.user?.displayName);


}
