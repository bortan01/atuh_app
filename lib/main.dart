import 'package:auth_app/services/api_status.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'services/google_sign_in_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Auth - Google - Apple'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async {
                await GooogleSignInServices.signOut();
              },
              icon: const Icon(FontAwesomeIcons.doorOpen),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  splashColor: Colors.transparent,
                  minWidth: double.infinity,
                  height: 50,
                  color: Colors.red,
                  shape: const StadiumBorder(),
                  onPressed: () async {
                    final result = await GooogleSignInServices.signIngWithGoogle();
                    if (result is Success) {
                      print(result.response);
                    }
                    if (result is Failure) {
                      print(result.errorResponse);
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Sign in with Google",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
