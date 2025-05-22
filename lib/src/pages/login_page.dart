
import 'package:chatapp/src/components/my_button.dart';
import 'package:chatapp/src/components/textfield.dart';
import 'package:chatapp/src/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Function()? onTap;
   Login({super.key, required this.onTap});
   void login( BuildContext context) async{
     final authService=AuthService();
     try{
      await authService.signInWithEmailAndPassword(emailController.text, passwordController.text);
     }
     catch(e){
       showDialog(context: context,
       builder: (context) {
         return AlertDialog(
           title: Text(e.toString()),
           
         );
       });
     }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.surface,
      body:Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
           Icon(Icons.message,
           size: 60,
           color:Theme.of(context).colorScheme.primary,
           ),
           const SizedBox(height: 20),
           Text("Welcome Back!!",
           style: TextStyle(
             fontSize: 16,
             fontWeight: FontWeight.bold,
             color: Theme.of(context).colorScheme.primary,
           )
           ),
           const SizedBox(height: 20),
           MyTextFiled(
            hintText: "Email",
            obscureText:false,
            controller: emailController,
            ),
            const SizedBox(height: 20),
            MyTextFiled(
            hintText: "password",
            obscureText: true,
            controller: passwordController,
            ),
            const SizedBox(height: 20),
            Mybutton(
              text:"Login",
              onTap: () => login(context),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?",
                style:TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text("Register now",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                  )
                  ),
                ),
              ],
            )
          ],
        ),
      ) ,
    );
  }
}