import 'package:flutter/material.dart';

class roomDetails extends StatefulWidget {
  const roomDetails({Key? key}) : super(key: key);

  @override
  State<roomDetails> createState() => _roomDetailsState();
}

class _roomDetailsState extends State<roomDetails> {
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
              padding: const EdgeInsets.only(left: 100,top:10),
              child: const Text('Room Details', style: TextStyle(
                  color: Colors.white,
                  fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3,
                    right: 35,
                    left: 35),
                child: Column(
                  children:  [
                    TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade50,
                          hintText: 'Block',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),

                    SizedBox(height: 30,),

                    TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade50,
                          hintText: 'Room NO',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),

                    SizedBox(height: 30,),

                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xff4c505b),
                      child: IconButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, 'cleaningRegister');
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
                          'Sign In',
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
