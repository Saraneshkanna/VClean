import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Mylogin extends StatefulWidget {
  const Mylogin({Key? key}) : super(key: key);

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  final _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login.png'),fit: BoxFit.cover)),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35,top:80),
              child: const Text('Welcome\nBack', style: TextStyle(
                  color: Colors.white,
                  fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.45,
                    right: 35,
                    left: 35),
                child: Column(
                  children:  [
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          filled: true,
                          // fillColor: Colors.grey,
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    SizedBox(height: 30,),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          filled: true,
                          // fillColor: Colors.grey,
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Text('Sign In', style: TextStyle(
                    //   fontSize: 27, fontWeight: FontWeight.w700)
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          final email = _emailController.text;
                          final password = _passwordController.text;
                          _loading = true;
                          try {
                            final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
                            Navigator.pushNamed(context, 'profile');
                            _loading = false;
                          } catch (e) {
                            // Handle login errors
                          }
                        },
                        child: _loading
                            ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                            : Text('Login'),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, 'register');
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Color(0xff4c505b)
                          ),
                        )
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}