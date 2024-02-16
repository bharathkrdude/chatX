import 'package:chat_x/auth/auth_service.dart';
import 'package:chat_x/components/my_button.dart';
import 'package:chat_x/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
   final void Function()? onTap;
 void register(BuildContext context) {
  final _auth = AuthService();
  if (_pwController.text == _confirmController.text) {
    try {
      _auth.signUpWithEmailPassword(_emailController.text, _pwController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  } else {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Password doesn't match"),
      ),
    );
  }
}

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  RegisterPage({super.key, required this.onTap});

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
              hintText: 'Email',
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
              height: 10,
            ),
            MyTextField(
              hintText: 'Confirm password',
              obscureText: true,
              controller: _confirmController,
            ),
            const SizedBox(
              height: 25,
            ),

            /// login button
            MyButton(
              text: "Register",
              onTap: ()=> register(context),
            ),

            /// register now
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an Account?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    )),
                GestureDetector(
                  onTap: onTap,
                  child: Text('Login now',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
