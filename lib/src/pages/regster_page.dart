

import 'package:chatapp/src/components/my_button.dart';
import 'package:chatapp/src/components/textfield.dart';
import 'package:chatapp/src/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
   final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   final TextEditingController confirmPasswordController = TextEditingController();
   final Function()? onTap;

    // Constructor to initialize the onTap function
   Register({super.key, required this.onTap});
    void register(BuildContext context) async {
     final _auth=AuthService();
     if (passwordController.text==confirmPasswordController.text) {
     try {
      await _auth.registerWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
    } 
  
     catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(e.toString()),
          );
        },
      );
    }
       }
       else {
         showDialog(
           context: context,
           builder: (context) {
             return AlertDialog(
               title: const Text("Passwords do not match"),
             );
           },
         );
       }
     }

  @override
  Widget build(BuildContext context) {
return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 20),
            Text(
              "Let's get you registered!",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 20),
            MyTextFiled(
              hintText: "Email",
              obscureText: false,
              controller: emailController,
            ),
            const SizedBox(height: 20),
            MyTextFiled(
              hintText: "password",
              obscureText: true,
              controller: passwordController,
            ),
            const SizedBox(height: 20),
            MyTextFiled(
              hintText: "confirm password",
              obscureText: true,
              controller: confirmPasswordController,
            ),
            const SizedBox(height: 20),
            Mybutton(text: "Register",
           onTap: () => register(context),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login  now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
    
