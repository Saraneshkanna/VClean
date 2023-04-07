import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// This function will be called when the user presses the sign up button


class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {

  final nameController = TextEditingController();
  final regNoController = TextEditingController();
  final roomNoController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final usersCollection = FirebaseFirestore.instance.collection('users');

  void signUp() async {


    final name = nameController.text;
    final regNo = regNoController.text;
    final roomNo = roomNoController.text;
    final email = emailController.text;
    final password = passwordController.text;


    // // Create a document with the user's data
    // await usersCollection.doc(email).set({
    //   'name': name,
    //   'registrationNo': regNo,
    //   'roomNo': roomNo,
    //   'email': email,
    //   'password': password,
    // });

    try {
      bool hasError = false;
      String errorText = "";
      bool isValidEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
      bool isValidName = RegExp(r'^[a-zA-Z\s]+$').hasMatch(name);
      bool isValidRegNo = RegExp(r'^\d{2}[A-Z]{3}\d{4}$').hasMatch(regNo);
      bool isValidRoomNo = RegExp(r'^[A-Z]-\d{3,4}$').hasMatch(roomNo);
      bool isValidPW = RegExp(r'^.{6,}$').hasMatch(password);

      hasError = !(isValidRoomNo && isValidRegNo && isValidName && isValidEmail && isValidPW);
      if(!isValidName){
      errorText = "Please enter a proper name!";
      }
      else if(!isValidRegNo){
      errorText = "Please enter a valid Registration Number!";
      }
      else if(!isValidRoomNo){
        errorText = "Room number should be in format: {Block}-{Room Number}";
      }
      else if(!isValidEmail){
        errorText = "Please enter a valid email address!";
      }
      else if(!isValidPW){
        errorText = "Password must be atleast 6 characters!";
      }

      // User is signed up, store additional user data to Firestore
      if(hasError){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorText,style: TextStyle(
                fontSize: 20, // set font size to 24
              ),),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 5),
            ),
        );
        }
      else{
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
          'name': nameController.text,
          'registrationNo': regNoController.text,
          'roomNo': roomNoController.text,
          'email': emailController.text,
        });
        Navigator.pushNamed(context, 'profile');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

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
              padding: const EdgeInsets.only(left: 35,top:0),
              child: const Text('Create\nAccount', style: TextStyle(
                  color: Colors.white,
                  fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.15,
                    right: 35,
                    left: 35),
                child: Column(
                  children:  [
                    TextFormField(
                      controller: nameController,
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

                    TextFormField(
                      controller: regNoController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade50,
                          hintText: 'Registration No.',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),

                    SizedBox(height: 15,),

                    TextFormField(
                      controller: roomNoController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade50,
                          hintText: 'Room No.',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),

                    SizedBox(height: 15,),

                    TextFormField(
                      controller: emailController,
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
                    TextFormField(
                      controller: passwordController,
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
                      // child: IconButton(
                      //   onPressed: () async {
                      //     Navigator.pushNamed(context, 'roomDetails');
                      //   },
                        child: IconButton(
                          onPressed: signUp,
                          icon: Icon(Icons.arrow_forward,color: Colors.white,),
                        ),

                        //icon: Icon(Icons.arrow_forward, color: Colors.white,),
                      ),
                   // ),
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
