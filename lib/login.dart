import 'package:flutter/material.dart';


class Mylogin extends StatefulWidget {
  const Mylogin({Key? key}) : super(key: key);

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login.png'),fit: BoxFit.cover)),
      child: Scaffold(
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
                      height: 15,
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xff4c505b),
                      child: IconButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, 'profile');
                        },
                        icon: Icon(Icons.arrow_forward,color: Colors.white,),
                      ),
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
