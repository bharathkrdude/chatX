

import 'package:chat_x/auth/auth_service.dart';
import 'package:chat_x/components/my_button.dart';
import 'package:chat_x/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;
  //login funtion
  void login(BuildContext context) async {
    // auth service
    final authService = AuthService();
    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _pwController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  //email pasword controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  LoginPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          /// logo
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(
              height: 50,
            ),

            /// welcome back messege

            Text("Welcome You have been missed!!",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                )),

            /// email textfield
            MyTextField(
              hintText: 'Username',
              obscureText: false,
              controller: _emailController,
            ),

            /// pw textfield
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              hintText: 'Password',
              obscureText: true,
              controller: _pwController,
            ),
            const SizedBox(
              height: 25,
            ),

            /// login button
            MyButton(
              text: 'Login',
              onTap: () => login(context),
            ),

            /// register now
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dont have an Account?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    )),
                GestureDetector(
                    onTap: onTap,
                    child: Text('Register now',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
