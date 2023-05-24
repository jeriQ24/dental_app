import 'package:dental_app/components/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() async {

  //show loading circle
  showDialog(context: context, builder: (context){
    return const Center(child: CircularProgressIndicator(),
      );
    },
  );

  
    // try sign in 
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text,
    );
    // pop the circle 
    // ignore: use_build_context_synchronously
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
              //forgot passwordtextfield
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot Password?'),
                  ],
                ),
              ),
          
              const SizedBox(height: 25),
          
              //sign in button textfield
              MyButton(
                text: 'Sign In',
                onTap: signUserIn,
              ),
              const SizedBox(height: 25),
              
              /*Divider(
                thickness: 5,
              ),*/
          
              //not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a Member?',
                    style: TextStyle(color: Colors.grey),
                    ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register Now',
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