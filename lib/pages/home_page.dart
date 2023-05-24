import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  //sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
       /* actions: [
        IconButton(
          onPressed: signUserOut, 
          icon: const Icon(Icons.logout)
        )
      ],*/
      ),
      //create userdrawer
    drawer: Drawer( 
        child: ListView(
          children:  <Widget> [
            //UserDrawer
            UserAccountsDrawerHeader(
              accountName:  const Text('User',
              style: TextStyle(fontSize: 20),
              ), 
              accountEmail: Text(user.email!,
              style: const TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
              ),
              
              ),
              ),

            const ListTile(
              title: Text('Home'),  
            ),

            const ListTile(
              title: Text('Profile'),  
            ),

             ListTile(
              title: const Text('Sign out'), 
              onTap: signUserOut,  
            ),

          ],
        ),
      ),



     /* body: Center(
        child: Text(
          'LOGGED IN AS: '+ user.email!,
          style: TextStyle(fontSize: 20),
          )),
          */
    
    
      
    body:  SafeArea(
        child: Column(
          children: [

    //add text that says "Hello, User!"
    const Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('Hello, User',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
    ),

    const SizedBox(height: 50),
    //add user icon and text 'profile' under it
    
    const Align(
      alignment: Alignment.center,
      child: Icon(
          Icons.account_circle,
          size: 112,  
        ),
    ),
    
    const Text('Profile',
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold
    ),
    ),


    const SizedBox(height: 250),

    //add button to redirect to dental monitor

    SizedBox(
      width: 200,
      child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(217, 217, 217, 217)),
              ),
                child: const Text('Dental Monitor',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                ),
            ),
    ),

    //add button to redirect to food monitor

    SizedBox(
      width: 200,
      child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(217, 217, 217, 217)),
              ),
                child: const Text('Food Monitor',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                ),
            ),
    ),


    




          ],
        ),
    ),
    
    


    
      
   



    
    );
    
  }
}