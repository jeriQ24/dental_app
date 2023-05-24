import 'package:dental_app/components/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

  //sign user in method
  void signUserUp() async {

  //show loading circle
  showDialog(context: context, builder: (context){
    return const Center(child: CircularProgressIndicator(),
      );
    },
  );

  
    // try creating new user
    try {
      // check if password is confirmed
      if (passwordController.text == confirmPasswordController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text,
    );
      } else {
        // show error message, password don't match
        showErrorMessage("Passwords don't match!");
      } 

    // pop the circle 
    Navigator.pop(context);

  } on FirebaseAuthException catch (e) {
    // pop the circle 
    Navigator.pop(context);
    //show error message
    showErrorMessage(e.code);

     }

  }

    //error message to user
    void showErrorMessage(String message) {
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text(
              message),
          );
        },
      );
    }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //title
                const Text("iDentify",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                ),
                ),
                const SizedBox(height: 25),
              //logo
              const Icon(
                Icons.lock,
                size: 100,
                color: Colors.black,
              ),
              
              const SizedBox(height: 50),
              
              //welcome back text
              Text("Welcome back you've been missed!",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
                ),
              ),
          
              const SizedBox(height: 25),
              //email textfield
              MyTextField(
               controller: emailController,
               hintText: 'Email',
               obscureText: false,
              ),
                
              const SizedBox(height: 10),
              //password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),  
              
              const SizedBox(height: 10),
          
              //confirm password textfield
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),  
              
              const SizedBox(height: 10),
          
              
          
              const SizedBox(height: 25),
          
              //signup button textfield
              MyButton(
                text: 'Sign Up',
                onTap: signUserUp,
              ),
              const SizedBox(height: 25),
              
              /*Divider(
                thickness: 5,
              ),*/
          
              //Already have an account? Login now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.grey),
                    ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login now',
                      style: TextStyle(
                        color:Colors.blue,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                  ),
                ],
              ),
                
                
              ]
            ),
          ),
        ),
      ),
    );
  }
}