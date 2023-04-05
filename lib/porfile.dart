import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

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
              padding: const EdgeInsets.only(left: 90, top: 80),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/avatar.jpeg'),
                  ),
                  const SizedBox(height: 40),
                  // Container(
                  //   child: const Text(
                  //     'Your Profile',
                  //     style: TextStyle(
                  //       color: Color(0xff4c505b),
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 33,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),


            SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.45,
                      right: 35,
                      left: 35),
                  child: Column(
                    children:  [
                      Text(
                        'Vinay Vikkranth',
                        style: TextStyle(
                          color: Color(0xff4c505b),
                          fontWeight: FontWeight.bold,
                          fontSize: 33,
                        ),
                      ),
                      SizedBox(height: 30,),
                      Text(
                        'REG NO: 20BCE2059',
                        style: TextStyle(
                          color: Color(0xff4c505b),
                          fontWeight: FontWeight.bold,
                          fontSize: 33,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'ROOM: F484',
                        style: TextStyle(
                          color: Color(0xff4c505b),
                          fontWeight: FontWeight.bold,
                          fontSize: 33,
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      TextButton(
                          onPressed: () async {
                            Navigator.pushNamed(context, 'homePage');
                          },
                          child: Text(
                            'Home',
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
              ),
            ),
            SingleChildScrollView(
              child: Container(
                child: Row(
                  children: [
                    SizedBox(height:1290 ,),
                    SizedBox(width: 65,),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xff4c505b),
                      child: IconButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, 'cleaningRegister');
                        },
                        icon: Icon(Icons.cleaning_services,color: Colors.white,),
                      ),
                    ),
                    SizedBox(width: 50,),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xff4c505b),
                      child: IconButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, 'homePage');
                        },
                        icon: Icon(Icons.home,color: Colors.white,),
                      ),
                    ),
                    SizedBox(width: 50,),

                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xff4c505b),
                      child: IconButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, 'ScanQR');
                        },
                        icon: Icon(Icons.qr_code,color: Colors.white,),
                      ),
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
