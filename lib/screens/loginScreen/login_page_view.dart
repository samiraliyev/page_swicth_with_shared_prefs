import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../registerPage/register_page_view.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: const Text('Login Page'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: ElevatedButton(
              child: const Text("go to register page"),
              onPressed: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                await preferences.setBool('isLogin', false).then(
                      (_) => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const RegisterPageView()),
                        ),
                      ),
                    );
              }),
        ),
      ),
    );
  }
}
