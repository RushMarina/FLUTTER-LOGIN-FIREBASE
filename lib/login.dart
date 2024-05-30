import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';


class Login extends StatelessWidget {
  
final Function togScreen;

const Login({super.key, required this.togScreen});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //ICON
                const SizedBox(height: 45),
                const Icon(Icons.person_outlined, color: Colors.grey, size: 140),
                //WELCOME
                const SizedBox(height: 20),
                const Text('Welcome', 
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text('Please sign in to continue', 
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                //EMAIL
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration( //nu
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.mail_outlined, size: 30),
                      labelText: "Email",
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.w800,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                //PASSWORD
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration( //nu
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock, size: 30),
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.w800,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                //FORGOT
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     TextButton(
                //       onPressed: (){}, 
                //       child: Text('Forgot password?', 
                //         style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //           color: Theme.of(context).primaryColor,
                //         ),
                //       ),
                //     )
                //   ],
                // ),
                //BTN
                const SizedBox(height: 10),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),//transporent
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    onPressed: (){},
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )
                  ), 
                ),
                //GOOGLE
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  icon: const Icon(Icons.login),
                  label: const Text("Login with Google"),
                  onPressed: () async {
                    User? user = await AuthService().signInWithGoogle();
                    if (user != null) {
                      //Handle successful login
                    }
                  },
                ),
              
                //REGISTRATION
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Create a new account ", style: TextStyle(
                      fontSize: 20,

                    )),
                    GestureDetector(
                      onTap:()=> togScreen(),
                      child: Text('here', 
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}