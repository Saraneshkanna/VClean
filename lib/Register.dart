import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/register.png'),fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35,top:10),
              child: const Text('Create\nAccount', style: TextStyle(
                  color: Colors.white,
                  fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2,
                    right: 35,
                    left: 35),
                child: Column(
                  children:  [
                    TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade50,
                          hintText: 'Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),

                    SizedBox(height: 15,),

                    TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade50,
                          hintText: 'Registration NO',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),

                    SizedBox(height: 15,),

                    TextField(
                      decoration: InputDecoration(
                          
                          filled: true,
                          fillColor: Colors.grey.shade50,
                          hintText: 'Email',
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade50,
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white)
                          )
                      ),
                    ),
                    // SizedBox(height: 15,),
                    // Text('Sign Up', style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 27,
                    //     fontWeight: FontWeight.w700,
                    // )
                    // ),
                    SizedBox(
                      height: 15,
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xff4c505b),
                      child: IconButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, 'roomDetails');
                        },

                        icon: Icon(Icons.arrow_forward, color: Colors.white,),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, 'login');
                        },
                        child: Text(
                          'Already Registered? Sign In',
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
